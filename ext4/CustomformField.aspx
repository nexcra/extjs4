<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomformField.aspx.cs" Inherits="ext4.CustomformField" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
        #search-results a {
            color: #385F95;
            font:bold 11px tahoma, arial, helvetica, sans-serif;
            text-decoration:none;
        }
        
        #search-results a:hover {
            text-decoration:underline;
        }
        
        #search-results p {
            margin:3px !important;
        }
        
        .search-item {
            font:normal 11px tahoma, arial, helvetica, sans-serif;
            padding:3px 10px 3px 10px;
            border:1px solid #fff;
            border-bottom:1px solid #eeeeee;
            white-space:normal;
            color:#555;
        }
        .search-item h3 {
            display:block;
            font:inherit;
            font-weight:bold;
            color:#222;
        }

        .search-item h3 span {
            float: right;
            font-weight:normal;
            margin:0 0 5px 5px;
            width:100px;
            display:block;
            clear:none;
        }
        
        .x-form-clear-trigger {
            background-image: url(extjs/resources/themes/images/default/form/clear-trigger.gif);
        }
        
        .x-form-search-trigger {
            background-image: url(extjs/resources/themes/images/default/form/search-trigger.gif);
        }
    </style>
<script type="text/javascript">
    Ext.Loader.setConfig({ enabled: true });
    Ext.Loader.setPath('Ext.ux', 'extjs/examples/ux');
    Ext.require([
            'Ext.data.*',
            'Ext.panel.Panel',
            'Ext.view.View',
            'Ext.layout.container.Fit',
            'Ext.toolbar.Paging',
            'Ext.ux.form.SearchField'
        ]);

    Ext.define('Post', {
        extend: 'Ext.data.Model',
        idProperty: 'post_id',
        fields: [{
            name: 'postId', mapping: 'post_id'
        }, {
            name: 'title', mapping: 'topic_title'
        }, {
            name: 'topicId', mapping: 'topic_id'
        }, {
            name: 'author', mapping: 'author'
        }, {
            name: 'lastPost', mapping: 'post_time', type: 'date', dateFormat: 'timestamp'
        }, {
            name: 'excerpt', mapping: 'post_text'
        }]
    });

    Ext.onReady(function () {
        var forumId = 4;
        var store = Ext.create('Ext.data.Store', {
            model: 'Post',
            proxy: {
                type: 'jsonp',
                url: 'http://sencha.com/forum/topics-remote.php',
                extraParams: {
                    forumId: forumId
                },
                reader: {
                    type: 'json',
                    root: 'topics',
                    totalProperty: 'totalCount'
                }
            },
            listeners: {
                beforeload: function () {
                    var params = store.getProxy().extraParams;
                    if (params.query) {
                        delete params.forumId;
                    } else {
                        params.forumId = forumId;
                    }
                }
            }
        });
        store.loadPage(1);
		
		var resultTpl = Ext.create('Ext.XTemplate',
            '<tpl for=".">',
            '<div class="search-item">',
                '<h3><span>{lastPost:this.formatDate}<br />by {author}</span>',
                '<a href="http://sencha.com/forum/showthread.php?t={topicId}&p={postId}" target="_blank">{title}</a></h3>',
                '<p>{excerpt}</p>',
            '</div></tpl>', {
                formatDate: function (value) {
                    return Ext.Date.format(value, 'M J,Y');
                }
            });

       var panel=Ext.create('Ext.Panel',{
			title:'Forum Search',
			renderTo:'girds',
			width:600,
			height:300,
			id:'search-results',
			layout:'fit',
			items:{
				autoScroll:true,
				xtype:'dataview',
				tpl:resultTpl,
				store:store,
				itemSelector:'div.search-item'
			},
			dockedItems:[{
				dock:'top',
				xtype:'toolbar',
				items:{
					width:400,
					fieldLabel:'Search',
					labelWidth:50,
					xtype:'searchfield',
					store:store
				}
			},{
				dock:'bottom',
				xtype:'pagingtoolbar',
				store:store,
				pageSize:25,
				displayInfo:true,
				displayMsg:'topics {0} -{1} of {2}',
				emptyMsg:'No topics to display'
			}]
	   });
        
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="girds"></div>
</asp:Content>
