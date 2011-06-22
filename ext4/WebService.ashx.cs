﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
namespace ext4
{
    /// <summary>
    /// WebService 的摘要说明
    /// </summary>
    public class WebService : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string json = string.Empty;
            string action = context.Request.QueryString["action"];
            switch (action)
            { 
                case "tree":
                    json = jsonTree(context);
                    break;
            }
            context.Response.Write(json);
        }

        public string jsonTree(HttpContext context)
        {
            string json = string.Empty;
            string node = context.Request.QueryString["node"];
            string con = ConfigurationManager.AppSettings["App"].ToString();
            SqlConnection conn = new SqlConnection(con);
            string sql=null;
            if (string.IsNullOrEmpty(node) || node == "id")
            {
                sql = "SELECT * FROM easyuiTree";
            }
            else
            {
                sql = "SELECT * FROM easyuiTree WHERE Pid=" + node + "";
            }
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            conn.Open();
            DataTable dt = new DataTable();
            da.Fill(dt);
            json += "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string id = dt.Rows[i]["ID"].ToString();
                string name = dt.Rows[i]["Name"].ToString().Trim();
                string url = dt.Rows[i]["Url"].ToString().Trim();
                string leaf = "true";
                if (isLeaf(id))
                    leaf = "false";
                json += "{";
                json += "\"text\":\"" + name + "\",\"leaf\":" + leaf + ",\"id\":\"" + id + "\"";
                json += "},";
            }
            json = json.Substring(0, json.Length - 1);
            json += "]";
            return json;
        }

        public Boolean isLeaf(string pid)
        {
            string con = ConfigurationManager.AppSettings["App"].ToString();
            SqlConnection conn = new SqlConnection(con);
            SqlDataAdapter ds = new SqlDataAdapter("SELECT * FROM easyuiTree WHERE Pid=" + pid + "", conn);
            conn.Open();
            DataTable dt = new DataTable();
            ds.Fill(dt);
            return dt.Rows.Count > 0;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}