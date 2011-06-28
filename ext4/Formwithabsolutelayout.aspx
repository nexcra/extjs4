<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formwithabsolutelayout.aspx.cs" Inherits="ext4.Formwithabsolutelayout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {

        var form = Ext.create('Ext.form.Panel', {
            layout: 'absolute',
            url: 'save.html',
            defaultType: 'textfield',
            border: false,
            items: [{
                fieldLabel: 'Send To',
                fieldWidth: 60,
                msgTarget: 'side',
                allowBlank: false,
                x: 5,
                y: 5,
                name: 'to',
                anchor: '-5'
            }, {
                fieldLabel: 'Subject',
                fieldWidth: 60,
                x: 5,
                y: 35,
                name: 'subject',
                anchor: '-5'
            }, {
                x:5,
                y:65,
                xtype:'textarea',
                hideLabel:'margin:0',
                name:'msg',
                anchor:'-5 -5'
            }]
        });
        var win = Ext.create('Ext.Window', {
            title: 'Resize Me',
            width: 500,
            height: 300,
            minWidth: 300,
            maxHeight: 200,
            layout: 'fit',
            plain: true,
            items: form,
            buttons: [{
                text: 'Send'
            }, {
                text: 'Cancel'
            }]
        });
        win.show();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
