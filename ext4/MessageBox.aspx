<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MessageBox.aspx.cs" Inherits="ext4.MessageBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.get('alert').on('click', function () {
            Ext.Msg.alert('Status', 'Changes saved successfully.', function () {
                //点击按钮后的事件
            });
        });

        Ext.get('confirm').on('click', function () {
            Ext.Msg.confirm('Status', 'Config MessageBox.', function (e) {
                alert(e);
            });
        });

        Ext.get('prompta').on('click', function () {
            Ext.Msg.prompt('Status', 'Prompt MessageBox.', function (e, text) {
                alert(e + "--" + text);
            });
        });

        Ext.get('promptb').on('click', function () {
            Ext.Msg.prompt('Status', "Prompt MessageBox.", function (e, text) {
                alert(e + "--" + text);
            }, this, true);
        });


        Ext.get('show').on('click', function () {
            Ext.Msg.show({
                title:'Ext.Msg.show()',
                msg:'Ext.Msg.show(config object)',
                buttons: Ext.Msg.YESNO,
                animateTarget:'show'
            });
        });




    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p id="alert">Ext.Msg.alert('title','msg',fn)</p>
<p id="confirm">Ext.Msg.confirm('title','msg',fn)</p>
<p id="prompta">Ext.Msg.prompt('title','msg',fn)</p>
<p id="promptb">Ext.Msg.prompt('title','msg',fn,this,true)</p>
<p id="show">Ext.Msg.show(congif object)</p>
</asp:Content>
