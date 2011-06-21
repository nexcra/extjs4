<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tabs.aspx.cs" Inherits="ext4.Tabs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.createWidget('tabpanel', {
            width: 450,
            height: 300,
            renderTo: 'tab1',
            activeTab: 0,
            defaults: {
                bodyPadding: 0
            },
            items: [{
                contentEl: 'tab1_a',
                title: 'tab1_a'
            }, {
                contentEl:'tab1_b',
                title:'tab1_b'
            }]
        });



    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="tab1"></div>

<p id="tab1_a">第一个tabs</p>
<p id="tab1_b">第二个tabs</p>
</asp:Content>
