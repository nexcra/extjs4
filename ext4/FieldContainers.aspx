<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FieldContainers.aspx.cs" Inherits="ext4.FieldContainers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
Ext.onReady(function(){
	Ext.define('Employee', {
        extend: 'Ext.data.Model',
        fields: [
            {name: 'email',     type: 'string'},
            {name: 'title',     type: 'string'},
            {name: 'firstName', type: 'string'},
            {name: 'lastName',  type: 'string'},
            {name: 'phone-1',   type: 'string'},
            {name: 'phone-2',   type: 'string'},
            {name: 'phone-3',   type: 'string'},
            {name: 'hours',     type: 'number'},
            {name: 'minutes',   type: 'number'},
            {name: 'startDate', type: 'date'},
            {name: 'endDate',   type: 'date'}
        ]
    });
	
	var form=Ext.create('Ext.form.Panel',{
		renderTo:'div',
		title:'FieldContainers',
		width:600,
		autoHeight:true,
		bodyPadding:10,
		defaults:{
			anchor:'100%',
			labelWidth:100
		},
		items:[{
			xtype:'textfield',
			fieldLabel:'Eamil Address',
			name:'email',
			vtype:'email',
			msgTarget:'side',
			allowBlank:false
		},{
			xtype:'fieldcontainer',
			fieldLabel:'Date Range',
			combineErrors:true,
			msgTarget:'side',
			layout:'hbox',
			defaults:{
				flex:1,
				hideLabel:true
			},
			items:[{
				xtype:'datefield',
				name:'startDate',
				fieldLabel:'Start',
				margin:'0 5 0 0',
				allowBlank:false
			},{
				xtype:'datefield',
				name:'endDate',
				fieldLabel:'End',
				allowBlank:false
			}]
		},{
			xtype:'fieldset',
			title:'Details',
			collapsible:true,
			defaults:{
				labelWidth:89,
				anchor:'100%',
				layout:{
					type:'hbox',
					defaultMargins:{top:0,right:5,bottom:0,left:0}
				}
			},
			items:[{
				xtype:'fieldcontainer',
				fieldLabel:'Phone',
				combineErrors:true,
				msgTarget:'under',
				defaults:{
					hideLabel:true
				},
				items:[{
					xtype:'displayfield',
					value:'('
				},{
					xtype:'textfield',
					width:29,
					fieldLabel:'Phone 1',
					name:'phone-1',
					allowBlank:false
				},{
					xtype:'displayfield',
					value:')'
				},{
					xtype:'textfield',
					width:29,
					fieldLabel:'Phone 2',
					name:'phone-2',
					allowBlank:false,
					margins: '0 5 0 0'
				},{
					xtype:'displayfield',
					value:'-'
				},{
					xtype:'textfield',
					width:48,
					fieldLable:'Phone 3',
					name:'phone-3',					
					allowBlank:false
				}]
			},{
				xtype:'fieldcontainer',
				fieldLabel:'Time worked',
				combineErrors:false,
				defaults:{
					hideLabel:true
				},
				items:[{
					name:'hours',
					xtype:'numberfield',
					width:48,
					allowBlank:false
				},{
					xtype:'displayfield',
					value:'hous'
				},{
					name:'minutes',
					xtype:'numberfield',
					width:48,
					allowBlank:false
				},{
					xtype:'displayfield',
					value:'mins'
				}]
			},{
				xtype:'fieldcontainer',
				fieldLabel:'Full Name',
				combineErrors:true,
				msgTarget:'side',
				defaults:{
					hideLabel:true
				},
				items:[{
					width:50,
					xtype:'combo',
					mode:'local',
					value:'mrs',
					triggerAction:'all',
					forceSelection:true,
					editable:false,
					fieldLabel:'Title',
					name:'title',
					displayField:'name',
					valueField:'value',
					queryMode:'local',
					store:Ext.create('Ext.data.Store',{
						fields:['name','value'],
						data:[{
							name:'Mr',
							value:'Mr'
						},{
							name:'Mrs',
							value:'mrs'
						},{
							name:'Miss',
							value:'miss'
						}]
					})
				},{
					xtype:'textfield',
					flex:1,
					name:'firstName',
					allowBlank:false
				},{
					xtype:'textfield',
					flex:1,
					name:'lastName',
					fieldLabel:'Last',
					allowBlank:false,
					margins:'0'
				}]
			}]
		}],
		buttons:[{
			text   : 'Load test data',
			handler:function(){
				this.up('form').getForm().loadRecord(Ext.ModelManager.create({
					'email'    : 'abe@sencha.com',
					'title'    : 'mr',
					'firstName': 'Abraham',
					'lastName' : 'Elias',
					'startDate': '01/10/2003',
					'endDate'  : '12/11/2009',
					'phone-1'  : '555',
					'phone-2'  : '123',
					'phone-3'  : '4567',
					'hours'    : 7,
					'minutes'  : 15
				},'Employee'));
			}
		},{
			text:'Save',
			handler:function(){
				var form=this.up('form').getForm(),
				s='';
				if(form.isValid()){
					Ext.iterate(form.getValues(),function(key,value){
						s+=Ext.util.Format.format("{0}={1}<br/>",key,value);
					},this);
					Ext.Msg.alert('Form Values',s);
				}
			}
		},{
			text:'Reset',
			handler:function(){
				this.up('form').getForm().reset();
			}
		}]
	
	});
	
	
	
	
	
	
	
	
	
	
	
	
});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="div"/>
</asp:Content>
