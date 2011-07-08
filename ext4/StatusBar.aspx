<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StatusBar.aspx.cs" Inherits="ext4.StatusBar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="extjs/examples/ux/statusbar/css/statusbar.css" rel="stylesheet" type="text/css" />
    <script src="extjs/examples/ux/statusbar/StatusBar.js" type="text/javascript"></script>
<script type="text/javascript">
Ext.Loader.setConfig({
	enable:true
});
Ext.Loader.setPath('Ext.ux','extjs/examples/ux');
Ext.require([
  'Ext.panel.Panel',
  'Ext.button.Button',
  'Ext.window.Window',
  'Ext.ux.statusbar.StatusBar',
  'Ext.toolbar.TextItem',
  'Ext.menu.Menu',
  'Ext.toolbar.Spacer',
  'Ext.button.Split',
  'Ext.form.field.TextArea'
]);
Ext.onReady(function(){
	var loadFn=function(btn){
		btn=Ext.getCmp(statusBar);
		btn.disable();
		statusBar.showBusy();
		Ext.defer(function(){
			statusBar.clearStatus({useDefaults:true});
			btn.enable();
		},2000);
	};

	Ext.create('Ext.Panel',{
		title:'Basic StatusBar',
		renderTo: 'div1',
        bodyStyle:'padding:10px;',
		width:550,
		height:100,
		items:[{
			xtype:'button',
			id:'basic-button',
			text:'Do Loading',
			handler:Ext.Function.pass(loadFn,['basic-button','basic-statusbar'])
		}],
		bbar:Ext.create('Ext.ux.StatusBar',{
			id:'basic-statusbar',
			defaultText:'default-icon',
			text:'Ready',
			iconCls:'x-status-valid',
			items:[{
				xtype:'button',
				text:'Show Warning & Clear',
				handler:function(){
					var sb=Ext.getCmp('basic-statusbar');
					sb.setStatus({
						text:'Oops!',
						iconCls:'x-status-error',
						clear:true
					});
				}
			},{
				xtype:'button',
				text:'Show Busy',
				handler:function(){
					var sb=Ext.getCmp('basic-statusbar');
					sb.showBusy();
				}
			},{
				text:'button',
				text:'Clear status',
				handler:function(){
					var sb=Ext.getCmp('basic-statusbar');
					sb.clearStatus();
				}
			},'-',
				'Plain Text'
			]
		})
	});
	
	
	Ext.create('Ext.Panel',{
		title:'Right-aligned StatusBar',
		renderTo:'div2',
		width:500,
		height:100,
		bodyStyle:'padding:10px;',
		items:[{
			xtype:'button',
			id:'b',
			text:'Do Loading',
			handler:Ext.Function.pass(loadFn,['basic-button','basic-statusbar'])
		}],
		bbar:Ext.create('Ext.ux.StatusBar',{
			id:'v',
			defaultText: 'Default status',
			statusAlign: 'right',
			items:[{text:'A Button'},'-', 'Plain Text', ' ', ' ']
		})
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="div1"/><div id="div2"/>
</asp:Content>
