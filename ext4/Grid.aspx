<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="ext4.Grid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.define('model', {
            extend: 'Ext.data.Model',
            fields: [{
                name: 'CompanyName', type: 'string'
            }, {
                name: 'ContactName', type: 'string'
            }, {
                name: 'ContactTitle', type: 'string'
            }, {
                name: 'Address', type: 'string'
            }, {
                name: 'Phone', type: 'string'
            }, {
                name: 'Fax', type: 'string'
            }]
        });

        var store = Ext.create('Ext.data.Store', {
            model: 'model',
            proxy: {
                type: 'ajax',
                url: 'webservice.ashx?action=customer',
                render: {
                    type:'json',
                    root: 'topics',
                    totalProperty: 'totalCount'
                }
            }
        });

        var grid = Ext.create('Ext.grid.Panel', {
            store: store,
            title:'Grid Pager',
            renderTo:Ext.getBody(),
            culumns: [{
                text: 'CompanyName',
                dataIndex: 'CompanyName',
                flex: 1,
                sortable: true
            }, {
                text: 'ContactName',
                dataIndex: 'ContactName',
                flex: 1,
                sortable: true
            }, {
                text: 'ContactTitle',
                dataIndex: 'ContactTitle',
                flex: 1,
                sortable: true
            }, {
                text: 'Adress',
                dataIndex: 'Address',
                flex: 1,
                sortable: true
            }, {
                text: 'Phone',
                dataIndex: 'Phone',
                flex: 1,
                sortable: true
            }, {
                text:'Fax',
                dataIndex:'Fax',
                flex: 1,
                sortable:true
            }]
        });

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
