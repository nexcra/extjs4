<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckboxRadio.aspx.cs" Inherits="ext4.CheckboxRadio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        var individual = {
            xtype: 'container',
            layout: 'hbox',
            margin: '0 0 10',
            items: [{
                xtype: 'fieldset',
                flex: 1,
                title: 'Individual Checkboxes',
                defaultType: 'checkbox',
                layout: 'anchor',
                defaults: {
                    anchor: '100%',
                    hideEmptyLabel: false
                },
                items: [{
                    xtype: 'textfield',
                    name: 'txt-alignment-1',
                    fieldLabel: 'Alignment Test'
                }, {
                    fieldLabel: 'Favorite Animals',
                    boxLabel: 'Dog',
                    name: 'fav-animal-dog',
                    inputValue: 'dog'
                }, {
                    fieldLabel: '',
                    name: 'fav-animal-monkey',
                    boxLabel: 'Monkey',
                    inputValue: 'monkey',
                    checked: true
                }, {
                    fieldLabel: '',
                    boxLabel: 'Cat',
                    name: 'fav-animal-cat',
                    inputValue: 'cat'
                }]
            }, {
                xtype: 'component',
                width: 10
            }, {
                xtype: 'fieldset',
                flex: 1,
                title: 'Individual Radios',
                defaultType: 'radio',
                layout: 'anchor',
                defaults: {
                    anchor: '100%',
                    hideEmptyLabel: false
                },
                items: [{
                    fieldLabel: 'Alignment Test',
                    xtype: 'textfield',
                    name: 'txt-alignment-2'
                }, {
                    fieldLabel: 'Favorite Color',
                    boxLabel: 'Red',
                    name: 'radio1',
                    checked: true,
                    inputValue: 'Red'
                }, {
                    fieldLabel: '',
                    boxLabel: 'Blue',
                    name: 'radio1',
                    inputValue: 'Blue'
                }, {
                    fieldLabel: '',
                    boxLabel: 'Green',
                    name: 'radio1',
                    inputValue: 'Green'
                }]
            }]
        }



        var checkGroup = {
            title: 'Checkbox Groups (initially collapsed)',
            xtype: 'fieldset',
            layout: 'anchor',
            defaults: {
                anchor: '100%',
                labelStyle: 'padding-left:4px'
            },
            collapsible: true,
            collapsed: true,
            items: [{
                xtype: 'textfield',
                name: 'txt-alignment-3',
                fieldLabel: 'Alignment Test'
            }, {
                xtype: 'checkboxgroup',
                cls: 'x-check-group-alt',
                fieldLabel: 'Auto Layout',
                items: [{
                    boxLabel: 'Item1', name: 'cbk-item-1', inputValue: 'item1'
                }, {
                    boxLabel: 'Item2', name: 'cbk-item-2', inputValue: 'item2'
                }, {
                    boxLabel: 'item3', name: 'cbk-item-3', inputValue: 'item3'
                }, {
                    boxLabel: 'item4', name: 'cbk-item-4', inputValue: 'item4'
                }, {
                    boxLabel: 'item5', name: 'cbk-item-5', inputValue: 'item5', checked: true
                }]
            }, {
                xtype: 'checkboxgroup',
                fieldLabel: 'Single Column',
                columns: 1,
                items: [{
                    boxLabel: 'Item1', name: 'cbk-col-1'
                }, {
                    boxLabel: 'Item2', name: 'cbk-col-2', checked: true
                }, {
                    boxLabel: 'Item3', name: 'cbk-col-3'
                }]
            }, {
                xtype: 'checkboxgroup',
                fieldLabel: 'Multi-Column (horizontal)',
                cls: 'x-check-group-alt',
                columns: 3,
                items: [{
                    boxLabel: 'Item1', name: 'cbk-mc-1'
                }, {
                    boxLabel: 'Item2', name: 'cbk-mc-2'
                }, {
                    boxLabel: 'Item3', name: 'cbk-mc-3'
                }, {
                    boxLabel: 'Item4', name: 'cbk-mc-4'
                }, {
                    boxLabel: 'Item5', name: 'cbk-mc-5', checked: true
                }]
            }, {
                xtype: 'checkboxgroup',
                fieldLabel: 'Multi-Column (vertical)',
                columns: 3,
                vertical: true,
                items: [{
                    boxLabel: 'Item1', name: 'cbk-mcv-1'
                }, {
                    boxLabel: 'Item2', name: 'cbk-mcv-2'
                }, {
                    boxLabel: 'Item3', name: 'cbk-mcv-3'
                }, {
                    boxLabel: 'Item4', name: 'cbk-mcv-4', checked: true
                }, {
                    boxLabel: 'Item5', name: 'cbk-mcv-5'
                }]
            }, {
                xtype: 'checkboxgroup',
                fieldLabel: 'Multi-Column<br />(custom widths)',
                cls: 'x-check-group-alt',
                columns: [100, 100],
                vertical: true,
                items: [{
                    boxLabel: 'Item1', name: 'cbk-mcc-1'
                }, {
                    boxLabel: 'Item2', name: 'cbk-mcc-2'
                }, {
                    boxLabel: 'Item3', name: 'cbk-mcc-3'
                }, {
                    boxLabel: 'Item4', name: 'cbk-mcc-4'
                }, {
                    boxLabel: 'Item5', name: 'cbk-mcc-5', checked: true
                }]
            }, {
                xtype: 'checkboxgroup',
                fieldLabel: 'Custom Layout<br />(w/ validation)',
                msgTarget: 'side',
                allowBlank: true,
                autoFitErrors: false,
                anchor: '-18',
                layout: 'column',
                defaultType: 'container',
                items: [{
                    columnWidth: .25,
                    items: [{
                        xtype: 'component', html: 'Heading 1', cls: 'x-form-check-group-label'
                    }, {
                        xtype: 'checkbox', boxLabel: 'Item1'
                    }, {
                        xtype: 'checkbox', boxLabel: 'Item2'
                    }]
                }, {
                    columnWidth: .5,
                    items: [{
                        xtype: 'component', html: 'Heading 2', cls: 'x-form-check-group-label'
                    }, {
                        xtype: 'checkbox', boxLabel: 'A long item just for fun'
                    }]
                }, {
                    columnWidth: .25,
                    items: [{
                        xtype: 'component', html: 'Heading 3', cls: 'x-form-check-group-label'
                    }, {
                        xtype: 'checkbox', boxLabel: 'Item4'
                    }, {
                        xtype: 'checkbox', boxLabel: 'Item5'
                    }]
                }]
            }]
        }

        var radioGroup = {
            xtype: 'fieldset',
            collapsible: true,
            collapsed: false,
            title: 'Radio Groups',
            layout: 'anchor',
            defaults: {
                anchor: '100%',
                labelStyle: 'padding-left:4px'
            },
            items: [{
                fieldLabel: 'Alignment Test',
                xtype: 'textfield',
                name: 'txt-alignment-4'
            }, {
                fieldLabel: 'Auto Layout',
                xtype: 'radiogroup',
                cls: 'x-check-group-alt',
                items: [{
                    boxLabel: 'Item1', name: 'rb-auto', inputValue: 1
                }, {
                    boxLabel: 'Item2', name: 'rb-auto', inputValue: 2
                }, {
                    boxLabel: 'Item3', name: 'rb-auto', inputValue: 3
                }, {
                    boxLabel: 'Item4', name: 'rb-auto', inputValue: 4
                }, {
                    boxLabel: 'Item5', name: 'rb-auto', inputValue: 5
                }]
            }, {
                fieldLabel: 'Single Column',
                xtype: 'radiogroup',
                columns: 1,
                items: [{
                    boxLabel: 'Item1', name: 'rb-col', inputValue: 1
                }, {
                    boxLabel: 'Item2', name: 'rb-col', inputValue: 2
                }, {
                    boxLabel: 'Item3', name: 'rb-col', inputValue: 3, checked: true
                }]
            }, {
                xtype: 'radiogroup',
                fieldLabel: 'Multi-Column (horizontal)',
                cls: 'x-check-group-alt',
                columns: 3,
                items: [{
                    boxLabel: 'Item1', name: 'rb-horiz-1', inputValue: 1
                }, {
                    boxLabel: 'Item2', name: 'rb-horiz-1', inputValue: 2, checked: true
                }, {
                    boxLabel: 'Item3', name: 'rb-horiz-1', inputValue: 3
                }, {
                    boxLabel: 'Item1', name: 'rb-horiz-2', inputValue: 1
                }, {
                    boxLabel: 'Item2', name: 'rb-horiz-2', inputValue: 2
                }]
            }, {
                xtype: 'radiogroup',
                fieldLabel: 'Multi-Column (vertical)',
                columns: 3,
                vertical: true,
                items: [{
                    boxLabel: 'Item1', name: 'rb-vert', inputValue: 1
                }, {
                    boxLabel: 'Item2', name: 'rb-vert', inputValue: 2, checked: true
                }, {
                    boxLabel: 'Item3', name: 'rb-vert', inputValue: 3
                }, {
                    boxLabel: 'Item4', name: 'rb-vert', inputValue: 4
                }, {
                    boxLabel: 'Item5', name: 'rb-vert', inputValue: 5
                }]
            }, {
                xtype: 'radiogroup',
                fieldLabel: 'Multi-Column<br />(custom widths)',
                cls: 'x-check-group-alt',
                columns: [100, 100],
                vertical: true,
                items: [{
                    boxLabel: 'Item1', name: 'rb-custwidth', inputValue: 1
                }, {
                    boxLabel: 'Item2', name: 'rb-custwidth', inputValue: 2, checked: true
                }, {
                    boxLabel: 'Item3', name: 'rb-custwidth', inputValue: 3
                }, {
                    boxLabel: 'Item4', name: 'rb-custwidth', inputValue: 4
                }, {
                    boxLabel: 'Item5', name: 'rb-custwidth', inputValue: 5
                }]
            }, {
                xtype: 'radiogroup',
                fieldLabel: 'Custom Layout<br />(w/ validation)',
                allowBlank: false,
                msgTarget: 'side',
                autoFitErrors: false,
                anchor: '-18',
                layout: 'column',
                defaultType: 'container',
                items: [{
                    columnWidth: .25,
                    items: [{
                        xtype: 'component', html: 'Heading 1', cls: 'x-form-check-group-label'
                    }, {
                        xtype: 'radiofield', name: 'rb-cust', inputValue: 1, boxLabel: 'Item1'
                    }, {
                        xtype: 'radiofield', name: 'rb-cust', inputValue: 2, boxLabel: 'Item2'
                    }]
                }, {
                    columnWidth: .5,
                    items: [{
                        xtype: 'component', html: 'Heading 2', cls: 'x-form-check-group-label'
                    }, {
                        xtype: 'radiofield', name: 'rb-cust', inputValue: 3, boxLabel: 'Item3'
                    }]
                }, {
                    columnWidth: .25,
                    items: [{
                        xtype: 'component', html: 'Heading 3', cls: 'x-form-check-group-label'
                    }, {
                        xtype: 'radiofield', name: 'rb-cust', inputValue: 4, boxLabel: 'Item4'
                    }, {
                        xtype:'radiofield',name:'rb-cust',inputValue:5,boxLabel:'Item5'
                    }]
                }]
            }]
        }

        var fp = Ext.create('Ext.FormPanel', {
            title: 'Check/Radio Groups Example',
            frame: true,
            renderTo: 'form-ct',
            width: 600,
            fieldDefaults: {
                labelWidth: 110 //The width of the fieldLabel in pixels. Only applicable if the labelAlign is set to "left" or "right". Defaults to 100.
            },
            bodyPadding: 10,
            items: [
                individual,
                checkGroup,
                radioGroup
            ],
            buttons: [{
                text: 'Save',
                handler: function () {
                    if (fp.getForm().isValid()) {
                        Ext.Msg.alert('Submitted Values', 'The following will be sent to the server: <br />' +
                        fp.getForm().getValues(true).replace(/&/g, ', '))
                    }
                }
            }, {
                text: 'Reset',
                handler: function () {
                    fp.getForm().reset();
                }
            }]
        });


    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="form-ct"></div>
</asp:Content>
