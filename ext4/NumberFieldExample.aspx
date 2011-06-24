<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NumberFieldExample.aspx.cs" Inherits="ext4.NumberFieldExample" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.createWidget('form', {
            renderTo: 'example-form',
            title: 'Number fields with spinner',
            bodyPadding: 5,
            frame: true,
            width: 340,
            fieldDefaults: {
                labelAlign: 'left',
                labelWidth: 105,
                anchor: '100%'
            },
            items: [{
                xtype: 'numberfield',
                fieldLabel: 'Default',
                name:'basic',
                value: 1,
                minValue: 0,
                maxValue: 125
            }, {
                xtype: 'numberfield',
                fieldLabel: 'With a step of 0.4',
                name: 'test',
                minValue: -100,
                maxValue: 100,
                allowDecimals: true,
                decimalPrecision: 1,
                step: 0.4
            }, {
                xtype: 'numberfield',
                hideTrigger:true,
                fieldLabel:'Without spinner',
                name:'widthout_spinner'
            }]
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="example-form"></div>
</asp:Content>
