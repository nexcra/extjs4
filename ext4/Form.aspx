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
                    columnWidth: .5,
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
                    columnWidth: .5,
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
                        anchor: '95%'
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
            buttons: [{ text: 'Save' }, { text: 'Cancel'}]
        });



        var win;
        function showContactForm() {
            if (!win) {
                var form = Ext.widget('form', {
                    layout: {
                        type: 'vbox',
                        align: 'stretch'
                    },
                    border: false,
                    bodyPadding: 10,
                    fieldDefaults: {
                        labelAlign: 'top',
                        labelWidth: 100,
                        labelStyle: 'font-weight:bold'
                    },
                    defaults: {
                        margins: '0 0 10 0'
                    },
                    items: [{
                        xtype: 'fieldcontainer',
                        fieldLabel: 'Your Name',
                        labelStyle: 'font-weight:bold;padding:0',
                        layout: 'hbox',
                        defaultType: 'textfield',
                        fieldDefaults: {
                            labelAlign: 'top'
                        },
                        items: [{
                            flex: 1,
                            name: 'firstName',
                            fieldLabel: 'First',
                            allowBlank: false
                        }, {
                            width: 30,
                            name: 'middleInitial',
                            fieldLabel: 'MI',
                            margins: '0 0 0 5'
                        }, {
                            flex: 2,
                            name: 'lastName',
                            fieldLabel: 'Last',
                            allowBlank: false,
                            margins: '0 0 0 5'
                        }]
                    }, {
                        xtype: 'textfield',
                        fieldLabel: 'Your Email Address',
                        vtype: 'email',
                        allowBlank: false
                    }, {
                        xtype: 'textfield',
                        fieldLabel: 'Subject',
                        allowBlank: false
                    }, {
                        xtype: 'textareafield',
                        fieldLabel: 'Message',
                        labelAlign: 'top',
                        flex: 1,
                        margins: '0',
                        allowBlank: false
                    }],
                    buttons: [{
                        text: 'Cancel',
                        handler: function () {
                            this.up('form').getForm().reset();
                            this.up('window').hide();
                        }
                    }, {
                        text: 'Send',
                        handler: function () {
                            if (this.up('form').getForm().isValid()) {// 注意大小写
                                //this.up('form').getForm().submit();
                                this.up('form').getForm().reset();
                                this.up('window').hide();
                                Ext.Msg.alert('Thank you!', 'Your inquiry has been sent. We will respond as soon as possible.');
                            }
                        }
                    }]
                });


                win = Ext.widget('window', {
                    title:'Contact Us',
                    closeAction:'hide',
                    width:400,
                    height:400,
                    minHeight:400,
                    layout: 'fit',
                    resizable: true,
                    modal: true,
                    items:form
                });
            }
            win.show();
        }
        
        var cs = Ext.widget('panel', {
            renderTo: 'contact-us',
            title: 'Welcome!',
            width: 500,
            bodyPadding: 20,
            items: [{
                xtype: 'component',
                html: 'Thank you for visiting our site! We welcome your feedback; please click the button below to send us a message. We will respond to your inquiry as quickly as possible.',
                style: 'margin-bottom:20px;'
            }, {
                xtype: 'container',
                style: 'text-align:center',
                items: [{
                    xtype: 'button',
                    cls: 'contactBtn',
                    scale: 'large',
                    text: 'Contact Us',
                    handler: showContactForm
                }]
            }]
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
<div id="contact-us"></div>
</asp:Content>
