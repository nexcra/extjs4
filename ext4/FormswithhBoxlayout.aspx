<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormswithhBoxlayout.aspx.cs" Inherits="ext4.FormswithhBoxlayout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
Ext.onReady(function(){
	Ext.create('Ext.form.Panel',{
		renderTo:'div',
		title:'Form Panel',
		bodyStyle:'padding:5px 5px 0',
		width:600,
		defaults:{
			border:false,
			xtype:'panel',
			flex:1,
			layout:'anchor'
		},
		fieldDefaults:{
			labelAlign:'top',
			msgTarget:'side'
		},
		layout:'hbox',
		items:[{
			items:[{
				xtype:'textfield',
				fieldLabel:'First Name',
				anchor:'-5',
				name:'first'
			},{
				xtype:'textfield',
				fieldLabel: 'Company',
				anchor: '-5',
				name: 'company'
			}]
		},{
			items: [{
                xtype:'textfield',
                fieldLabel: 'Last Name',
                anchor: '100%',
                name: 'last'
            },{
                xtype:'textfield',
                fieldLabel: 'Email',
                anchor: '100%',
                name: 'email',
                vtype:'email'
            }]
		}],
		buttons:['->',{
			text:'Save'			
		},{
			text:'Cancel'
		}]
	});

});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="div"/>
</asp:Content>
