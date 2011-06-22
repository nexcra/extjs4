<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tabs.aspx.cs" Inherits="ext4.Tabs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.createWidget('tabpanel', {
            width: 450,
            height: 200,
            renderTo: 'tab1',
            activeTab: 0,
            defaults: {
                bodyPadding: 10
            },
            items: [{
                contentEl: 'tab1_a',
                title: 'tab1_a'
            }, {
                contentEl: 'tab1_b',
                title: 'tab1_b'
            }]
        });

        Ext.createWidget('tabpanel', {
            width: 450,
            renderTo: 'tab2',
            activeTab: 0,
            plain: true,
            margin:'5 0 0 0',
            defaults: {
                bodyPadding: 10,
                autoScroll: true
            },
            items: [{
                title: 'tab_a',
                html: 'My content was added during construction.'
            }, {
                title: 'tab_b',
                loader: {
                    url: 'check-nodes.aspx',
                    contentType: 'html',
                    loadMask: true
                },
                listeners: {
                    activate: function (tab) {
                        tab.loader.load();
                    }
                }
            }]

        });

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="tab1"></div>
<div id="tab2"></div>

<p id="tab1_a" class="x-hide-display">第一个tabs</p>
<p id="tab1_b" class="x-hide-display">第二个tabs</p>
</asp:Content>
