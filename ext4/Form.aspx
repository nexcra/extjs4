<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="ext4.Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.create('Ext.form.Panel', {
            url: 'save-form.html',
            frame: true,
            title: 'Sample Form',
            width: 350,
            fieldDefaults: {
                msgTarget: 'side',
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
                xtype:'timefield',
                fieldLabel:'Time',
                name:'time',
                minValue:'8:00am',
                maxValue:'6:00pm'
            }],
            buttons:[{text:'Save'},{text:'Cancel'}],
            renderTo: 'form1'
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="form1"></div>
</asp:Content>
