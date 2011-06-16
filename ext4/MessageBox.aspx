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
                title: 'Ext.Msg.show()',
                msg: 'Ext.Msg.show(config object)配置config参数.',
                buttons: Ext.Msg.OKCANCEL,
                //animateTarget:'show',动画效果
                closable: false,
                //icon: Ext.Msg.INFO,
                width: 300,
                //prompt:true,单行输入框
                //multiline:true,多行输入框                
                fn: function (e) {
                    alert('您点击了' + e + '按钮');
                }
            });
        });

        Ext.get('progressa').on('click', function () {
            Ext.Msg.show({
                title: 'ProgressText',
                msg: '进度条',
                closable: false,
                progress: true,
                //wait: true,如果wait为true，同时也写了fn函数，进度条会出现来回加载现象
                fn: f
            });
            var f = function (v) {
                return function () {
                    if (v == 10) {
                        Ext.Msg.hide();
                    }
                    else {
                        var i = v / 9;
                        Ext.Msg.updateProgress(i, Math.round(100 * i) + "% completed", i);
                    }
                }
            }
            for (var i = 0; i < 11; i++) {
                setTimeout(f(i), i * 500);
            }
        });

        Ext.get('progressb').on('click', function () {
            Ext.Msg.show({
                title: 'ProgressText',
                msg: '5秒后关闭',
                progress: true,
                width: 300,
                wait: true,
                waitConfig: {
                    interval: 600,
                    duration: 5000,
                    fn: function () {
                        Ext.Msg.hide();
                    }
                },
                closable: true
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
<p id="progressa">progressText</p>
<p id="progressb">progressText</p>
</asp:Content>
