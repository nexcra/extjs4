<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="ext4.Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        var f1 = Ext.create('Ext.form.Panel', {
            url: 'save.aspx',
            frame: true,
            title: 'Sample Form',
            width: 350,
            fieldDefaults: {
                msgTarget: 'side', //错误提示类型
                labelWidth: 75
            },
            defaultType: 'textfield',
            defaults: {
                anchor: '100%'
            },
            items: [{
                fieldLabel: 'First Name',
                name: 'first',
                allowBlank: false
            }, {
                fieldLabel: 'Last Name',
                name: 'last'
            }, {
                fieldLabel: 'Company',
                name: 'company'
            }, {
                fieldLabel: 'Email',
                name: 'email',
                vtype: 'email'
            }, {
                xtype: 'timefield',
                fieldLabel: 'Time',
                name: 'time',
                minValue: '8:00am',
                maxValue: '6:00pm'
            }],
            buttons: [{ text: 'Save' }, { text: 'Cancel'}],
            renderTo: 'form1'
        });

        var f2 = Ext.create('Ext.form.Panel', {
            url: 'save.aspx',
            frame: true,
            title: 'Simple Form width FieldSets',
            bodyStyle: 'padding:5px 5px 0',
            width: 350,
            renderTo: 'form2',
            fieldDefaults: {
                msgTarget: 'side',
                labelWidth: 75
            },
            defaults: {
                anchor: '100%'
            },
            items: [{
                xtype: 'fieldset',
                checkboxToggle: true, //伸缩效果
                title: 'User Information',
                defaultType: 'textfield',
                collapsed: true,
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                items: [{
                    fieldLabel: 'First Name',
                    name: 'first',
                    allowBlank: false
                }, {
                    fieldLabel: 'Last Name',
                    name: 'last'
                }, {
                    fieldLabel: 'Company',
                    name: 'company'
                }, {
                    fieldLabel: 'Email',
                    name: 'email',
                    vtype: 'email'
                }]
            }, {
                xtype: 'fieldset',
                title: 'Phone Number',
                collapsible: true,
                defaultType: 'textfield',
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                items: [{
                    fieldLabel: 'Home',
                    name: 'home',
                    value: '(888)555-1212'
                }, {
                    fieldLabel: 'Business',
                    name: 'business'
                }, {
                    fieldLabel: 'Mobile',
                    name: 'mobile'
                }, {
                    fieldLabel: 'Fax',
                    name: 'fax'
                }]
            }],
            buttons: [{ text: 'Save' }, { text: 'Cancel'}]
        });

        var f3 = Ext.create('Ext.form.Panel', {
            frame: true,
            title: 'Multi Column Nested Layout and Anchoring',
            bodyStyle: 'padding:5px 5px 0',
            width: 600,
            renderTo: 'form3',
            fieldDefaults: {
                labelAlign: 'top',
                msgTarget: 'side'
            },
            items: [{
                xtype: 'container',
                anchor: '100%',
                layout: 'column',
                items: [{
                    xtype: 'container',
                    columnWidth: .5,
                    layout: 'anchor',
                    items: [{
                        xtype: 'textfield',
                        fieldLabel: 'First Name',
                        name: 'first',
                        anchor: '96%'
                    }, {
                        xtype: 'textfield',
                        fieldLabel: 'Company',
                        name: 'company',
                        anchor: '96%'
                    }]
                }, {
                    xtype: 'container',
                    columnWidth: .5,
                    layout: 'anchor',
                    items: [{
                        xtype: 'textfield',
                        fieldLabel: 'Last Name',
                        name: 'last',
                        anchor: '100%'
                    }, {
                        xtype: 'textfield',
                        fieldLabel: 'Email',
                        vtype: 'email',
                        anchor: '100%'
                    }]
                }]
            }, {
                xtype: 'htmleditor',
                name: 'bio',
                fieldLabel: 'Biography',
                height: 200,
                anchor: '100%'
            }],
            buttons: [{ text: 'Save' }, { text: 'Cancel'}]
        });

        var f4 = Ext.create('Ext.form.Panel', {
            renderTo: 'form4',
            width: 350,
            bodyBorder: false,
            border: false,
            fieldDefaults: {
                labelWidth: 75,
                msgTarget: 'side'
            },
            defaults: {
                anachor: '100%'
            },
            items: [{
                xtype: 'tabpanel',
                activeTab: 0,
                defaults: {
                    bodyStyle: 'padding:10px'
                },
                items: [{
                    title: 'Personal Details',
                    defaultType: 'textfield',
                    items: [{
                        fieldLabel: 'First Name',
                        name: 'first',
                        allowBlank: false,
                        value: 'Ed'
                    }, {
                        fieldLabel: 'Last Name',
                        name: 'last',
                        value: 'Spencer'
                    }, {
                        fieldLabel: 'Company',
                        name: 'company',
                        value: 'Ext JS'
                    }, {
                        fieldLabel: 'Email',
                        name: 'email',
                        vtype: 'email'
                    }]
                }, {
                    title: 'Phone Number',
                    defaultType: 'textfield',
                    items: [{
                        fieldLabel: 'Home',
                        name: 'home',
                        value: '(888)555-1212'
                    }, {
                        fieldLabel: 'Business',
                        name: 'business'
                    }, {
                        fieldLabel: 'Mobile',
                        name: 'mobile'
                    }, {
                        fieldLabel: 'Fax',
                        name: 'fax'
                    }]
                }]
            }],
            buttons: [{ text: 'Save' }, { text: 'Cancel'}]
        });


        var f5 = Ext.create('Ext.form.Panel', {
            title: 'Inner Tabs',
            bodyStyle: 'padding:5px',
            width: 600,
            renderTo: 'form5',
            fieldDefaults: {
                labelAlign: 'top',
                msgTarget: 'side'
            },
            defaults: {
                anchor: '100%'
            },
            items: [{
                layout: 'column',
                border: false,
                items: [{
                    columnWidth: 5,
                    border: false,
                    layout: 'anchor',
                    defaultType: 'textfield',
                    items: [{
                        fieldLabel: 'First Name',
                        name: 'first',
                        anchor: '95%'
                    }, {
                        fieldLabel: 'Company',
                        name: 'company',
                        anchor: '95%'
                    }]
                }, {
                    columnWidth: 5,
                    border: false,
                    layout: 'anchor',
                    defaultType: 'textfield',
                    items: [{
                        fieldLabel: 'Last Name',
                        name: 'last',
                        anchor: '95%'
                    }, {
                        fieldLabel: 'Email',
                        name: 'mail',
                        vtype: 'email',
                        anchor: '90%'
                    }]
                }]
            }, {
                xtype: 'tabpanel',
                plain: true,
                activeTab: 0,
                height: 235,
                defaults: {
                    bodyStyle: 'padding:10px'
                },
                items: [{
                    title: 'Personal Details',
                    defaults: { width: 230 },
                    defaultType: 'textfield',
                    items: [{
                        fieldLabel: 'First Name',
                        name: 'first',
                        allowBlank: true,
                        value: 'andy'
                    }, {
                        fieldLabel: 'Last Name',
                        name: 'last',
                        value: 'yang'
                    }, {
                        fieldLabel: 'Company',
                        name: 'company',
                        value: 'extjs'
                    }, {
                        fieldLabel: 'Email',
                        name: 'email',
                        vtype: 'email'
                    }]
                }, {
                    title: 'Phone Number',
                    defaults: { width: 230 },
                    defaultType: 'textfield',
                    items: [{
                        fieldLabel: 'Home',
                        name: 'home',
                        value: '(888)555-1212'
                    }, {
                        fieldLabel: 'Business',
                        name: 'business'
                    }, {
                        fieldLable: 'Mobile',
                        name: 'mobile'
                    }, {
                        fieldLable: 'Fax',
                        name: 'fax'
                    }]
                }, {
                    cls: 'x-plain',
                    title: 'Biography',
                    layout: 'fit',
                    items: {
                        xtype: 'htmleditor',
                        name: 'bods',
                        fieldLabel: 'Biography'
                    }
                }]
            }],
            buttons: [{ text: 'Save' }, {text:'Cancel'}]
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="form1"></div>
<div id="form2"></div>
<div id="form3"></div>
<div id="form4"></div>
<div id="form5"></div>
</asp:Content>
