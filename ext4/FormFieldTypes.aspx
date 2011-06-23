<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormFieldTypes.aspx.cs" Inherits="ext4.FormFieldTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        var formPanel = Ext.create('Ext.form.Panel', {
            frame: true,
            title: 'Form Fields',
            width: 340,
            bodyPadding: 5,
            fieldDefaults: {
                labelAlign: 'left',
                labelWidth: 90,
                anchor: '100%'
            },
            items: [{
                fieldLabel: 'Text field',
                value: 'Text field value',
                name: 'textfield',
                xtype: 'textfield'
            }, {
                fieldLabel: 'Password field',
                name: 'password',
                xtype: 'textfield',
                fieldType: 'password'
            }, {
                fieldLabel: 'File upload',
                name: 'file',
                xtype: 'filefield'
            }, {
                fieldLabel: 'TextArea',
                name: 'textarea',
                xtype: 'textareafield'
            }, {
                fieldLabel: 'Display field',
                xtype: 'displayfield',
                value: 'Display field<span style="color:green"> value</spam>'
            }, {
                fieldLabel: 'Number field',
                xtype: 'numberfield',
                value: 5,
                minValue: 0,
                maxValue: 50
            }, {
                fieldLabel: 'CheckBox',
                xtype: 'checkboxfield',
                boxLabel: 'box label'
            }, {
                fieldLabel: 'Radio buttons',
                xtype: 'radiofield',
                boxLabel: 'radio 1'
            }, {
                fieldLabel: '',
                labelSeparator: '',
                hideEmptyLabel: false,
                xtype: 'radiofield',
                boxLabel: 'radio 2'
            }, {
                fieldLabel: 'Date Field',
                xtype: 'datefield'
            }, {
                fieldLabel:'Time Field',
                xtype:'timefield',
                minValue: '1:30 AM',
                maxValue:'9:15PM'
            }]
        });

        formPanel.render('form-ct')
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="form-ct"></div>
</asp:Content>
