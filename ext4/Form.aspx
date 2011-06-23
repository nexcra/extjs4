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
                maxValue: '6:00pm',
                emptyText: 'Select one'
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
                        emptyText: 'Andy',
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
                        emptyText: 'Yang',
                        name: 'last',
                        anchor: '95%'
                    }, {
                        fieldLabel: 'Email',
                        name: 'mail',
                        vtype: 'email',
                        anchor: '95%',
                        emptyText: 'guangming.yang@shnewtouch.com'
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
                    title: 'Contact Us',
                    closeAction: 'hide',
                    width: 400,
                    height: 400,
                    minHeight: 400,
                    layout: 'fit',
                    resizable: true,
                    modal: true,
                    items: form
                });
            }
            win.show();
        }



        var myData = [
            ['3m Co', 71.72, 0.02, 0.03, '9/1 12:00am'],
            ['Alcoa Inc', 29.01, 0.42, 1.47, '9/1 12:00am'],
            ['Altria Group Inc', 83.81, 0.28, 0.34, '9/1 12:00am'],
            ['American Express Company', 52.55, 0.01, 0.02, '9/1 12:00am'],
            ['American International Group, Inc.', 64.13, 0.31, 0.49, '9/1 12:00am'],
            ['AT&T Inc.', 31.61, -0.48, -1.54, '9/1 12:00am'],
            ['Boeing Co.', 75.43, 0.53, 0.71, '9/1 12:00am'],
            ['Caterpillar Inc.', 67.27, 0.92, 1.39, '9/1 12:00am'],
            ['Citigroup, Inc.', 49.37, 0.02, 0.04, '9/1 12:00am'],
            ['E.I. du Pont de Nemours and Company', 40.48, 0.51, 1.28, '9/1 12:00am'],
            ['Exxon Mobil Corp', 68.1, -0.43, -0.64, '9/1 12:00am'],
            ['General Electric Company', 34.14, -0.08, -0.23, '9/1 12:00am'],
            ['General Motors Corporation', 30.27, 1.09, 3.74, '9/1 12:00am'],
            ['Hewlett-Packard Co.', 36.53, -0.03, -0.08, '9/1 12:00am'],
            ['Honeywell Intl Inc', 38.77, 0.05, 0.13, '9/1 12:00am'],
            ['Intel Corporation', 19.88, 0.31, 1.58, '9/1 12:00am'],
            ['International Business Machines', 81.41, 0.44, 0.54, '9/1 12:00am'],
            ['Johnson & Johnson', 64.72, 0.06, 0.09, '9/1 12:00am'],
            ['JP Morgan & Chase & Co', 45.73, 0.07, 0.15, '9/1 12:00am'],
            ['McDonald\'s Corporation', 36.76, 0.86, 2.40, '9/1 12:00am'],
            ['Merck & Co., Inc.', 40.96, 0.41, 1.01, '9/1 12:00am'],
            ['Microsoft Corporation', 25.84, 0.14, 0.54, '9/1 12:00am'],
            ['Pfizer Inc', 27.96, 0.4, 1.45, '9/1 12:00am'],
            ['The Coca-Cola Company', 45.07, 0.26, 0.58, '9/1 12:00am'],
            ['The Home Depot, Inc.', 34.64, 0.35, 1.02, '9/1 12:00am'],
            ['The Procter & Gamble Company', 61.91, 0.01, 0.02, '9/1 12:00am'],
            ['United Technologies Corporation', 63.26, 0.55, 0.88, '9/1 12:00am'],
            ['Verizon Communications', 35.57, 0.39, 1.11, '9/1 12:00am'],
            ['Wal-Mart Stores, Inc.', 45.45, 0.73, 1.63, '9/1 12:00am']
        ];
        var ds = Ext.create('Ext.data.ArrayStore', {
            fields: [{
                name: 'company'
            }, {
                name: 'price', type: 'float'
            }, {
                name: 'change', type: 'float'
            }, {
                name: 'pctChange', type: 'float'
            }, {
                name: 'lastChange', type: 'date', dateFormat: 'n/j h:ia'
            }, {
                name: 'rating', type: 'int', convert: function (value, record) {
                    var pct = record.get('pctChange');
                    if (pct < 0) return 2;
                    if (pct < 1) return 1;
                    return 0;
                }
            }],
            data: myData
        });
        function change(val) {
            if (val > 0) {
                return '<span style="color:green;">' + val + '</span>';
            } else if (val < 0) {
                return '<span style="color:red;">' + val + '</span>';
            }
            return val;
        }
        function pctChange(val) {
            if (val > 0) {
                return '<span style="color:green;">' + val + '%</span>';
            } else if (val < 0) {
                return '<span style="color:red;">' + val + '%</span>';
            }
            return val;
        }
        function rating(v) {
            if (v == 0) return "A";
            if (v == 1) return "B";
            if (v == 2) return "C";
        }
        var gridForm = Ext.create('Ext.form.Panel', {
            renderTo: 'grid',
            frame: true,
            title: 'Company data',
            bodyPadding: 5,
            width: 700,
            layout: 'column',

            fieldDefaults: {
                labelAlign: 'left',
                msgTarget: 'side'
            },
            items: [{
                columnWidth: 0.60,
                xtype: 'gridpanel',
                store: ds,
                height: 400,
                title: 'Company Data',

                columns: [{
                    text: 'Company',
                    flex: 1,
                    sortable: true,
                    dataIndex: 'company'
                }, {
                    text: 'Price',
                    width: 75,
                    sortable: true,
                    dataIndex: 'price'
                }, {
                    text: 'Change',
                    width: 75,
                    sortable: true,
                    dataIndex: 'change',
                    renderer: change
                }, {
                    text: '% Change',
                    width: 75,
                    sortable: true,
                    dataIndex: 'pctChange',
                    renderer: pctChange
                }, {
                    text: 'Last Change',
                    width: 85,
                    sortable: true,
                    dataIndex: 'lastChange',
                    renderer: Ext.util.Format.dateRenderer('m/d/y')
                }, {
                    text: 'Rating',
                    width: 30,
                    sortable: true,
                    dataIndex: 'rating',
                    renderer: rating
                }],
                listeners: {
                    selectionchange: function (model, records) {
                        if (records[0])
                            this.up('form').getForm().loadRecord(records[0]); //获取选中的行的值
                    }
                }
            }, {
                columnWidth: 0.4,
                margin: '0 0 0 10',
                xtype: 'fieldset',
                text: 'Company Details',
                defaults: {
                    width: 240,
                    labelWidth: 90
                },
                defaultType: 'textfield',
                items: [{
                    fieldLabel: 'Name',
                    name: 'company'
                }, {
                    fieldLabel: 'Price',
                    name: 'price'
                }, {
                    fieldLabel: '%Change',
                    name: 'pctChange'
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'Last Updated',
                    name: 'lastChange'
                }, {
                    fieldLabel: 'Rating',
                    xtype: 'radiogroup',
                    columns: 3,
                    defaults: {
                        name: 'rating'
                    },
                    items: [{
                        inputValue: '0',
                        boxLabel: 'A'
                    }, {
                        inputValue: '1',
                        boxLabel: 'B'
                    }, {
                        inputValue: '2',
                        boxLabel: 'C'
                    }]
                }]
            }]
        });
        gridForm.child('gridpanel').getSelectionModel().select(0); //设置第一行为选中



        var pwd = Ext.create('Ext.FormPanel', {
            renderTo: 'pw',
            frame: true,
            title: 'Password Verification',
            bodyPadding: '5px 5px 0',
            width: 350,
            fieldDefaults: {
                labelWidth: 125,
                msgTarget: 'side',
                autoFitErrors: false
            },
            defaults: {
                width: 300,
                inputType: 'password'
            },
            defaultType: 'textfield',
            items: [{
                fieldLabel: 'Password',
                name: 'pass',
                id: 'pass'
            }, {
                fieldLabel: 'Confirm Password',
                name: 'pass-cfrm',
                vtype: 'password',
                initialPassField: 'pass'//被验证的ID,这个属性可以自己更改，但要与验证规则中的一致
            }]
        });

        Ext.create('Ext.FormPanel', {
            renderTo: 'dr',
            frame: true,
            title: 'Date Range',
            bodyPadding: '5px 5px 0',
            width: 350,
            fieldDefaults: {
                labelWidth: 125,
                msgTarget: 'side',
                autoFitErrors: false
            },
            defaults: {
                width: 300
            },
            defaultType: 'datefield',
            items: [{
                fieldLabel: 'Start Date',
                name: 'startdt',
                id: 'startdt',
                vtype: 'daterange',
                endDateField: 'endt'
            }, {
                fieldLabel: 'End Date',
                name: 'enddt',
                id: 'enddt',
                vtype: 'daterange',
                startDateField: 'startdt'
            }]
        });

        //        initialPassField是自定义的属性，
        //        Ext.apply扩展了表单的自动验证功能(VType)，
        //        如果控件中有initialPassField属性，那么验证的时候将该组件的值
        //        与id为initialPassField所指定的值的组件 的值进行比较，不一致则提醒。
        Ext.apply(Ext.form.field.VTypes, {
            password: function (val, field) {
                if (field.initialPassField) {
                    var pwd = field.up('form').down('#' + field.initialPassField);
                    return (val == pwd.getValue());
                }
                return true;
            },
            passwordText: 'Passwords do not match',

            daterange: function (val, field) {
                var date = field.parseDate(val); //将String类型解析为Date类型
                if (!date) {
                    return false;
                }
                if (field.startDateField && (!this.dateRangeMax || (date.getTime() != this.dateRangeMax.getTime()))) {
                    var start = field.up('form').down('#' + field.startDateField);
                    start.setMaxValue(date);
                    start.validate();
                    this.dateRangeMax = date;
                }
                else if (field.endDateField && (!this.dateRangeMin || (date.getTime() != this.dateRangeMin.getTime()))) {
                    var end = field.up('form').down('#' + field.endDateField);
                    end.setMinValue(date);
                    end.validate();
                    this.dateRangeMin = date;
                }

                return true;
            },
            daterangeText: 'Start date must be less than end date'
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
<div id="grid"></div>
<div id="pw"></div>
<div id="dr"></div>
</asp:Content>
