<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Panel.aspx.cs" Inherits="ext4.Panel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.create('Ext.Panel', {
            title: 'Ext.Panel',
            renderTo: 'panel_a',
            width: 300,
            height: 200,
            html: 'Ext.Panel',
            bodyPadding: 5,
            collapsible: true//设为true，显示右上角的收缩按钮，默认为false
        });

        Ext.create('Ext.Panel', {
            title: 'Ext.Panel',
            bodyPadding: 5,
            margin: '5 0 0 0',
            items: [{
                xtype: 'datefield',
                fieldLabel: 'start date'
            }, {
                xtype: 'datefield',
                fieldLabel: 'end date'
            }],
            width: 300,
            renderTo: 'panel_b'
        });

        Ext.create('Ext.Panel', {
            title: 'Drag me',
            margin: '5 0 0 0',
            x: 555,
            y: 190,
            floating: true,
            frame: true, //圆角边框
            width: 300,
            height: 200,
            margin: '5',
            items: [{
                xtype: 'datefield',
                fieldLabel: 'start date'
            }, {
                xtype: 'datefield',
                fieldLabel: 'end date'
            }],
            draggable: {
                insertProxy: false, //拖动时不虚线显示原始位置
                onDrag: function (e) {
                    var pel = this.proxy.getEl();
                    this.x = pel.getLeft(true);
                    this.y = pel.getTop(true); //获取拖动时panel的坐标
                },
                endDrag: function (e) {
                    this.panel.setPosition(this.x, this.y); //移动到最终位置
                }
            },
            renderTo: 'panel_c'
        });


        Ext.create('Ext.Panel', {
            title: 'Ext.Panel',
            width: 400,
            height: 300,
            margin: '5 0 0 0',
            collapsible: true,
            closable: true,
            tbar: [{ text: 'Click me', handler: function () {
                Ext.Msg.alert('Status', 'the firest button has been click');
            }
            }, { text: 'Button'}], //顶部工具栏
            //bbar: [{ text: 'Button' }, { text: 'Button'}], //底部工具栏
            buttons: [{ text: 'Button' }, { text: 'Button'}],
            html: 'tbar bbar',
            bodyPadding: 5,
            renderTo: 'panel_d'
        });


        Ext.create('Ext.Panel', {
            title: 'Ext.Panel',
            width: 500,
            height: 100,
            margin: '5 0 0 0',
            tools: [
            { id: 'save' },
            { id: 'help' },
            { id: 'print' },
            { id: 'refresh' },
            { id: 'close', handler: function () {
                Ext.Msg.confirm('Status', 'Close the panel', function (e, txt) {
                    if (e == 'yes') {
                        Ext.get('panel_e').hide();
                    }
                    else {
                        return;
                    }
                });
            }
            }
            ],
            renderTo: 'panel_e'
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="panel_a"></div>
<div id="panel_b"></div>
<div id="panel_c"></div>
<div id="panel_d"></div>
<div id="panel_e"></div>
</asp:Content>
