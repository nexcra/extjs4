using System;
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
                case "customer":
                    json = customer(context);
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
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM easyuiTree WHERE Pid=" + node + "", conn);
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
            conn.Close();
            conn.Dispose();
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
            conn.Close();
            conn.Dispose();
            return dt.Rows.Count > 0;
        }

        public string customer(HttpContext context)
        {
            string json = string.Empty;
            string con = ConfigurationManager.AppSettings["Northwind"].ToString();
            SqlConnection conn = new SqlConnection(con);
            SqlDataAdapter ds = new SqlDataAdapter("SELECT * FROM Customer", conn);
            conn.Open();
            DataTable dt = new DataTable();
            ds.Fill(dt);
            json += "{'totalCount:'500',topics:[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                json += "{";
                json += "'CompanyName':'" + dt.Rows[i]["CompanyName"] + "','ContactName':'" + dt.Rows[i]["ContactName"] + "','ContactTitle':'" + dt.Rows[i]["ContactName"] + "','Address':'" + dt.Rows[i]["Address"] + "','Phone':'" + dt.Rows[i]["Phone"] + "','Fax','" + dt.Rows[i]["Fax"] + "'";
                json += "},";
            }
            json = json.Substring(0, json.Length - 1);
            json += json + "]}";
            conn.Close();
            conn.Dispose();
            
            return json;
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