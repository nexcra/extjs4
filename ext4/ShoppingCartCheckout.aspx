<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCartCheckout.aspx.cs" Inherits="ext4.ShoppingCartCheckout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="extjs/examples/shared/states.js" type="text/javascript"></script>
<script type="text/javascript">
    Ext.onReady(function () {
        var formPanel, statesStore = Ext.create('Ext.data.ArrayStore', {
            fields: ['abbr'],
            data: Ext.example.states
        }),
        monthsStore = Ext.create('Ext.data.Store', {
            fields: ['name', 'num'],
            data: (function () {
                var data = [];
                Ext.Array.forEach(Ext.Date.monthNames, function (name, i) {
                    data[i] = { name: name, num: i + 1 };
                });
                return data;
            })()
        });

        function onMailingAddrFieldChange(field) {
            var copyToBilling = formPanel.down('[name=billingSameAsMailing]').getValue();
            if (copyToBilling) {
                formPanel.down('[name=' + field.billingFieldName + ']').setValue(field.getValue());
            }
        }


        formPanel = Ext.widget('form', {
            renderTo: 'div1',
            title: 'Complete Check Out',
            frame: true,
            width: 550,
            bodyPadding: 5,
            fieldDefaults: {
                labelAlign: 'right',
                msgTarget: 'qtip',
                labelWidth: 90
            },
            items: [{
                xtype: 'fieldset',
                title: 'Your Contact Information',
                defaultType: 'textfield',
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                items: [{
                    xtype: 'fieldcontainer',
                    fieldLabel: 'Name',
                    combineErrors: true,
                    defaultType: 'textfield',
                    layout: 'hbox',
                    defaults: {
                        hideLabel: 'true'
                    },
                    items: [{
                        name: 'firstName',
                        fieldLabel: 'First Name',
                        flex: 2,
                        emptyText: 'First',
                        allowBlank: false
                    }, {
                        name: 'lastName',
                        fieldLabel: 'Last Name',
                        flex: 3,
                        margins: '0 0 0 6',
                        emptyText: 'Last',
                        allowBlank: false
                    }]
                }, {
                    xtype: 'container',
                    layout: 'hbox',
                    defaultType: 'textfield',
                    items: [{
                        fieldLabel: 'Email Address',
                        name: 'Email',
                        vtype: 'email',
                        flex: 1,
                        allowBlank: false
                    }, {
                        fieldLabel: 'Phone Number',
                        labelWidth: 100,
                        name: 'Phone',
                        width: 190,
                        emptyText: 'xxx-xxx-xxxx',
                        maskRe: /[\d\-]/,
                        regex: /^\d{3}-\d{3}-\d{4}$/,
                        regexText: 'Must be in the format xxx-xxx-xxxx'
                    }]
                }]
            }, {

                xtype: 'fieldset',
                title: 'Mailing Address',
                defaultType: 'textfield',
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                items: [{
                    fieldLabel: 'Street Address',
                    name: 'mailingStreet',
                    listeners: { change: onMailingAddrFieldChange },
                    billingFieldName: 'billingStreet',
                    allowBlank: false
                }, {
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                        xtype: 'textfield',
                        fieldLabel: 'City',
                        name: 'maillingCity',
                        listeners: { change: onMailingAddrFieldChange },
                        billingFieldName: 'billingCity',
                        flex: 1,
                        allowBlank: false
                    }, {
                        xtype: 'combobox',
                        name: 'mailingState',
                        listeners: { change: onMailingAddrFieldChange },
                        billingFieldName: 'billingState',
                        fieldLabel: 'State',
                        labelWidth: 50,
                        width: 100,
                        store: statesStore,
                        valueField: 'abbr',
                        displayField: 'abbr',
                        typeAhead: true,
                        queryMode: 'local',
                        allowBlank: false,
                        forceSelection: true
                    }, {
                        xtype: 'textfield',
                        fieldLabel: 'Postal Code',
                        fieldWidth: 90,
                        width: 180,
                        name: 'mailingPostalCode',
                        listeners: { change: onMailingAddrFieldChange },
                        allowBlank: false,
                        maxLength: 10,
                        enforceMaxLength: true,
                        maskRe: /[\d\-]/,
                        regex: /^\d{5}(\-\d{4})?$/,
                        regexText: 'Must be in the format xxxxx or xxxxx-xxxx'
                    }]
                }]
            }, {
                xtype: 'fieldset',
                title: 'Billing Address',
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                items: [{
                    xtype: 'checkbox',
                    name: 'billingSameAsMailing',
                    boxLabel: 'Same as Mailling',
                    hideLabel: true,
                    checked: true,
                    style: 'margin-bottom:10px',
                    handler: function (me, checked) {
                        var fieldset = me.ownerCt;
                        Ext.Array.forEach(fieldset.previousSibling().query('textfield'), onMailingAddrFieldChange);
                        Ext.Array.forEach(fieldset.query('textfield'), function (field) {
                            field.setDisabled(checked);
                            if (!Ext.isIE6) {
                                field.el.animate({ opacity: checked ? .3 : 1 });
                            }
                        });
                    }
                }, {
                    xtype: 'textfield',
                    fieldLabel: 'Street Address',
                    name: 'billingStreet',
                    disabled: true,
                    allowBlank: false
                }, {
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                        xtype: 'textfield',
                        fieldLabel: 'City',
                        name: 'billingCity',
                        style: (!Ext.isIE6) ? 'opacity:.3' : '',
                        flex: 1,
                        disabled: true,
                        allowBlank: false
                    }, {
                        xtype: 'combobox',
                        name: 'billingState',
                        sytle: (!Ext.isIE6) ? 'opacity:.3' : '',
                        fieldLabel: 'State',
                        labelWidth: 50,
                        width: 100,
                        store: statesStore,
                        valueField: 'abbr',
                        displayField: 'abbr',
                        typeAhead: true,
                        disabled: true,
                        queryMode: 'local',
                        allowBlank: false,
                        forceSelection: true
                    }, {
                        xtype: 'textfield',
                        fieldLabel: 'Postal Code',
                        labelWidth: 80,
                        name: 'billingPostalCode',
                        style: (!Ext.isIE6) ? 'opacity:.3' : '',
                        width: 160,
                        disabled: true,
                        allowBlank: false,
                        maxLength: 10,
                        enforceMaxLength: true,
                        maskRe: /[\d\-]/,
                        regex: /^\d{5}(\-\d{4})?$/,
                        regexText: 'Must be in the format xxxxx or xxxxx-xxxx'
                    }]
                }]
            }, {
                xtype: 'fieldset',
                title: 'Payment',
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                items: [{
                    xtype: 'radiogroup',
                    layout: 'hbox',
                    defaults: {
                        name: 'ccType',
                        margins: '0 15 0 0'
                    },
                    items: [{
                        inputValue: 'visa',
                        checked: true,
                        boxLabel: 'VISA'
                    }, {
                        inputValue: 'mastercard',
                        boxLabel: 'MasterCard'
                    }, {
                        inputValue: 'americanExpress',
                        boxLabel: 'American Express'
                    }, {
                        inputValue: 'discover',
                        boxLabel: 'Discover'
                    }]
                }, {
                    fieldLabel: 'Name On Card',
                    name: 'ccName',
                    xtype: 'textfield',
                    allowBlank: false
                }, {
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                        xtype: 'textfield',
                        name: 'ccName',
                        fieldLabel: 'Card Number',
                        flex: 1,
                        allowBlank: false,
                        minLength: 15,
                        maxLength: 16,
                        enforceMaxLength: true,
                        maskRe: /\d/
                    }, {
                        xtype: 'fieldcontainer',
                        fieldLabel: 'Expiration',
                        labelWidth: 75,
                        layout: 'hbox',
                        width: 235,
                        items: [{
                            xtype: 'combobox',
                            name: 'ccExpireMonth',
                            displayField: 'name',
                            valueField: 'num',
                            queryModa: 'local',
                            emptyText: 'Month',
                            hideLabel: true,
                            margins: '0 6 0 0',
                            store: monthsStore,
                            flex: 1,
                            allowBlank: false,
                            forceSelection: true
                        }, {
                            xtype: 'numberfield',
                            name: 'ccExpireYear',
                            hideLabel: true,
                            width: 55,
                            value: new Date().getFullYear(),
                            minValue: new Date().getFullYear(),
                            allowBlank: false
                        }]
                    }]
                }]
            }],
            buttons: [{
                text: 'Reset',
                handler: function () {
                    this.up('form').getForm().reset();
                }
            }, {
                text: 'Complete Purchase',
                width: 150,
                handler: function () {
                    var form = this.up('form').getForm();
                    if (form.isValid()) {
                        Ext.Msg.alert('Submitted Values', form.getValues(true));
                    }
                }
            }]


        });

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="div1"></div>
</asp:Content>
