<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FileUploadField.aspx.cs" Inherits="ext4.FileUploadField" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
        .upload-icon {
            background: url('extjs/examples/shared/icons/fam/image_add.png') no-repeat 0 0 !important;
        }
        #fi-button-msg {
            border: 2px solid #ccc;
            padding: 5px 10px;
            background: #eee;
            margin: 5px;
            float: left;
        }
</style>
<script type="text/javascript">
    Ext.onReady(function () {
        var fibasic = Ext.create('Ext.form.field.File', {
            renderTo: 'fi-basic',
            hideLabel: true,
            width: 400
        })
        var msg = function (title, msg) {
            Ext.Msg.show({
                title: title,
                msg: msg,
                minWidth: 200,
                modal: true,
                icon: Ext.Msg.INFO,
                buttons: Ext.Msg.OK
            });
        }
        Ext.create('Ext.button.Button', {
            text: 'Get File Path',
            renderTo: 'fi-basic-btn',
            handler: function () {
                var v = fibasic.getValue();
                msg('Selected File', v && v != '' ? v : 'None');
            }
        })

        Ext.create('Ext.form.field.File', {
            renderTo: 'fi-button',
            buttonOnly: true,
            hideLabel: true,
            listeners: {
                'change': function (fb, v) {
                    var el = Ext.get('fi-button-msg');
                    el.update('<b>Selected:</b>' + v);
                    if (!el.isVisible) {
                        el.slideIn('t', {
                            duration: 200,
                            easing: 'easeIn',
                            listeners: {
                                afteranimate: function () {
                                    el.highlight();
                                    el.setWidth(null);
                                }
                            }
                        });
                    }
                    else {
                        el.highlight();
                    }
                }
            }
        })


        Ext.create('Ext.form.Panel', {
            renderTo: 'fi-form',
            width: 500,
            frame: true,
            title: 'File Upload Form',
            bodyPadding: '10 10 0',
            defaults: {
                anchor: '100%',
                allowBlank: false,
                msgTarget: 'side',
                labelWidth: 50
            },
            items: [{
                xtype: 'textfield',
                fieldLabel: 'Name'
            }, {
                xtype: 'filefield',
                id: 'form-file',
                emptyText: 'Select an image',
                fieldLabel: 'Photo',
                name: 'photo-path',
                buttonText: '',
                buttonConfig: {
                    iconCls: 'upload-icon'
                }
            }],
            buttons: [{
                text: 'Save',
                handler: function () {
                    var form = this.up('form').getForm();
                    if (form.isValid()) {
                        form.submit({
                            url: 'web.ashx',
                            waitMsg: 'Uploading your photo...',
                            success: function (fp, o) {
                                msg('Success', 'Processed file "' + o.result.file + '" on the server');
                            }
                        });
                    }
                }
            }, {
                text: 'Reset',
                handler: function () {
                    this.up('form').getForm().reset();
                }
            }]
        });



    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="fi-basic"></div>
<div id="fi-basic-btn"></div>
<div id="fi-button"></div>
<div id="fi-button-msg" style="display:none;"></div>
<div class="x-clear"></div>
<div id="fi-form"></div>
</asp:Content>
