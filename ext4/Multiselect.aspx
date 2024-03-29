﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Multiselect.aspx.cs" Inherits="ext4.Multiselect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="extjs/examples/ux/css/ItemSelector.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    Ext.Loader.setConfig({ enabled: true });
    Ext.Loader.setPath('Ext.ux', 'extjs/examples/ux');
    Ext.require([
    'Ext.form.Panel',
    'Ext.ux.form.MultiSelect',
    'Ext.ux.form.ItemSelector'
    ]);

    Ext.onReady(function () {
        var msForm = Ext.widget('form', {
            title: 'MultiSelect Test',
            width: 400,
            bodyPadding: 10,
            renderTo: 'multiselect',
            items: [{
                anchor: '100%',
                xtype: 'multiselect',
                fieldLabel: 'Multiselect',
                name: 'multiselect',
                msgTarget: 'side',
                allowBlank: false,
                store: [[123, 'One Hundred Twenty Three'],
                    ['1', 'One'], ['2', 'Two'], ['3', 'Three'], ['4', 'Four'], ['5', 'Five'],
                    ['6', 'Six'], ['7', 'Seven'], ['8', 'Eight'], ['9', 'Nine']],
                value: ['3', '4', '6'],
                ddReorder: true
            }],
            tbar: [{
                text: 'Options',
                menu: [{
                    text: 'Set value(2,3)',
                    handler: function () {
                        msForm.getForm().findField('multiselect').setValue(['2', '3']);
                    }
                }, {
                    text: 'Toggle enabled',
                    handler: function () {
                        var m = msForm.getForm().findField('multiselect');
                        if (!m.disabled) {
                            m.disable();
                        } else {
                            m.enable();
                        }
                    }
                }, {
                    text: 'Toggle delimiter',
                    handler: function () {
                        var m = msForm.getForm().findField('multiselect');
                        if (m.delimiter) {
                            m.delimiter = null;
                            Ext.Msg.alert('Delimiter Changed', 'The delimiter is now set to <b>null</b>. Click Save to ' +
                                      'see that values are now submitted as separate parameters.');
                        } else {
                            m.delimiter = ',';
                            Ext.Msg.aleret('Delimiter Changed', 'The delimiter is now set to <b>","</b>. Click Save to ' +
                                      'see that values are now submitted as a single parameter separated by the delimiter.')
                        }
                    }
                }]
            }],
            buttons: [{
                text: 'Clear',
                handler: function () {
                    var field = msForm.getForm().findField('multiselect');
                    if (!field.readOnly && !field.disabled) {
                        field.clearValue();
                    }
                }
            }, {
                text: 'Save',
                handler: function () {
                    if (msForm.getForm().isValid()) {
                        Ext.Msg.alert('Submitted Values', 'The following will be sent to the server: <br />' + msForm.getForm().getValues(true));
                    }
                }
            }, {
                text: 'Reset',
                handler: function () {
                    msForm.getForm().reset();
                }
            }]
        });



        var ds = Ext.create('Ext.data.ArrayStore', {
            data: [[123, 'One Hundred Twenty Three'],
                ['1', 'One'], ['2', 'Two'], ['3', 'Three'], ['4', 'Four'], ['5', 'Five'],
                ['6', 'Six'], ['7', 'Seven'], ['8', 'Eight'], ['9', 'Nine']],
            fields: ['value', 'text'],
            sortInfo: {
                field: 'value',
                direction: 'ASC'
            }
        });

        var isForm = Ext.widget('form', {
            title: 'ItemSelector Test',
            width: 700,
            bodyPadding: 10,
            renderTo: 'itemselector',
            tbar: [{
                text: 'Options',
                menu: [{
                    text: 'Set value(2,3)',
                    handler: function () {
                        isForm.getForm().findField('itemselector').setValues(['2', '3']);
                    }
                }, {
                    text: 'Toggle enabled',
                    handler: function () {
                        var m = isForm.getForm().findField('itemselector');
                        if (!m.disabled) {
                            m.disable();
                        } else {
                            m.enable();
                        }
                    }
                }, {
                    text: 'Toggle delimiter',
                    handler: function () {
                        var m = isForm.getForm().findField('itemselector');
                        if (m.delimiter) {
                            m.delimiter = null;
                            Ext.Msg.alert('Delimiter Changed', 'The delimiter is now set to <b>null</b>. Click Save to ' +
                                      'see that values are now submitted as separate parameters.')
                        } else {
                            m.delimiter = ',';
                            Ext.Msg.alert('Delimiter Changed', 'The delimiter is now set to <b>","</b>. Click Save to ' +
                                      'see that values are now submitted as a single parameter separated by the delimiter.');
                        }
                    }
                }]
            }],
            items: [{
                xtype: 'itemselector',
                name: 'itemselector',
                anchor: '100%',
                fieldLabel: 'ItemSelector',
                imagePath: 'extjs/examples/ux/images/',
                store: ds,
                displayField: 'text',
                valueField: 'value',
                value: ['3', '4', '6'],
                allowBlank: false,
                msgTarget: 'side'
            }],
            buttons: [{
                text: 'Clear',
                handler: function () {
                    var field = isForm.getForm().findField('itemselector');
                    if (!field.readyOnly && !field.disabled) {
                        field.clearValue();
                    }
                }
            }, {
                text: 'Reset',
                handler: function () {
                    isForm.getForm().reset();
                }
            }, {
                text: 'Save',
                handler: function () {
                    if (isForm.getForm().isValid()) {
                        Ext.Msg.alert('Submitted Values', 'The following will be sent to the server: <br />' + isForm.getForm().getValues(true));
                    }
                }
            }]
        });


    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="multiselect"></div>
<div id="itemselector"></div>
</asp:Content>
