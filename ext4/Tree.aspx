<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tree.aspx.cs" Inherits="ext4.Tree" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        var store = Ext.create('Ext.data.TreeStore', {
            root: {
                expanded: true,
                text: "",
                user: "",
                status: "",
                children: [
            { text: "detention", leaf: true },
            { text: "homework", expanded: true,
                children: [
                    { text: "book report", leaf: true },
                    { text: "alegrbra", leaf: true }
                ]
            },
            { text: "buy lottery tickets", leaf: true }
        ]
            }
        });
        Ext.create('Ext.tree.Panel', {
            title: 'Simple Tree',
            width: 200,
            height: 150,
            store: store,
            rootVisible: false,
            renderTo: 'tree1'
        });

        var store1 = Ext.create('Ext.data.TreeStore', {
            proxy: {
                type: 'ajax',
                url: 'check-nodes.aspx'
            },
            sorters: [{
                property: 'leaf',
                direction: 'ASC'
            }, {
                property: 'text',
                direction: 'ASC'
            }]
        });
        var tree1 = Ext.create('Ext.tree.Panel', {
            store: store1,
            rootVisible: false,
            useArrows: true,
            frame: true,
            title: 'Check Tree',
            renderTo: 'tree2',
            width: 200,
            height: 250,
            dockedItems: [{
                xtype: 'toolbar',
                items: {
                    text: 'Get checked nodes',
                    handler: function () {
                        var records = tree1.getView().getChecked(),
                        names = [];
                        Ext.Array.each(records, function (res) {
                            names.push(res.get('text'));
                        });
                        Ext.MessageBox.show({
                            title: 'Selected Nodes',
                            msg: names.join('<br/>'),
                            icon: Ext.MessageBox.INFO
                        });
                    }
                }
            }]
        });

        var store2 = Ext.create('Ext.data.TreeStore', {
            proxy: {
                type: 'ajax',
                url: 'WebService.ashx?action=tree'
            },
            root: {
                title: 'Ext.Tree',
                id: '0',
                expanded: true
            },
            folderSort: true,
            sorters: [{
                property: 'text',
                direction: 'asc'
            }]
        });

        var tree2 = Ext.create('Ext.tree.Panel', {
            store: store2,
            viewConfig: {
                plugins: { ptype: 'treeviewdragdrop' }
            },
            renderTo: 'tree3',
            height: 300,
            width: 250,
            title: 'Files',
            useArrows: true,
            dockedItems: [{
                xtype: 'toolbar',
                items: [{
                    text: 'Expand All',
                    handler: function () {
                        tree2.expandAll();
                    }
                }, {
                    text: 'Collapse All',
                    handler: function () {
                        tree2.collapseAll();
                    }
                }]
            }]
        });

        tree2.on('itemclick', function (view, record, item, index, e) {
            Ext.Msg.alert('Status', '您点击的ID是:' + record.raw.id + ",您点击的文字是:" + record.raw.text);
        })

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="tree1"></div>
<div id="tree2"></div>
<div id="tree3"></div>
</asp:Content>
