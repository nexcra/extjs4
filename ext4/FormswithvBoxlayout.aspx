<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormswithvBoxlayout.aspx.cs" Inherits="ext4.FormswithvBoxlayout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
Ext.Loader.setConfig({enabled: true});

Ext.Loader.setPath('Ext.ux', 'extjs/examples/ux/');
Ext.require([
    'Ext.form.*',
    'Ext.window.Window',
    'Ext.data.*',
    'Ext.ux.FieldReplicator'
]);
Ext.onReady(function(){
	var form=Ext.create('Ext.form.Panel',{
		plain:true,
		border:0,
		bodyPadding:5,
		url:'save.html',
		fieldDefaults:{
			labelWidth:55,
			anchor:'100%'
		},
		layout:{
			type:'vbox',
			align:'stretch'
		},
		items:[{
			xtype:'combo',
			store:Ext.create('Ext.data.ArrayStore',{
				fields:['email'],
				data:[['test@example.com'],['someone@example.com'],['some@example.com']]
			}),
			displayField:'email',
			plugins:[Ext.ux.FieldReplicator],
			fieldLabel:'Send To',
			queryMode:'local',
			selectOnTab:false,
			name:'to'
		},{
			xtype:'textfield',
			fieldLabel:'Subject',
			name:'subject'
		},{
			xtype:'textarea',
			fieldLabel:'Message text',
			hideLabel:true,
			name:'msg',
			style:'margin:0',
			flex:1
		}]
	});
	
	var win=Ext.create('Ext.Window',{
		title:'Compose message',
		collapsible:true,
		animCollapse:true,
		maximizable:true,
		width:750,
		height:500,
		minWidth:300,
		minHeight:200,
		layout:'fit',
		items:form,
		dockedItems:[{
			xtype:'toolbar',
			dock:'bottom',
			ui:'footer',
			layout:{
				pack:'center'
			},
			items:[{
				minWidth:80,
				text:'Send'
			},{
				minWidth:80,
				text:'Cancel'
			}]
		}]
	});
	win.show();
});

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="div"></div>
</asp:Content>
