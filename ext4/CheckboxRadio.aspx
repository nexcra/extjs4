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
                    name: 'txt-test1',
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
                    xtype:'textfield'
                },{
                    fieldLabel: 'Favorite Color',
                    boxLabel: 'Red',
                    name: 'radio1',
                    checked: true
                }, {
                    fieldLabel: '',
                    boxLabel: 'Blue',
                    name: 'radio1'
                }, {
                    fieldLabel:'',
                    boxLabel:'Green',
                    name:'radio1'
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
                individual
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
