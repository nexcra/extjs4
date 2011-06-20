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
            }
            context.Response.Write(json);
        }

        public string jsonTree(HttpContext context)
        {
            string json = string.Empty;
            string con = ConfigurationManager.AppSettings["App"].ToString();
            SqlConnection conn = new SqlConnection(con);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM easyuiTree", conn);
            conn.Open();
            DataTable dt = new DataTable();
            da.Fill(dt);
            json += "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                json += "{";
                json += "\"text\":\"" + dt.Rows[i]["Name"].ToString().Trim() + "\",\"cls\":\"folder";
                json += "},";
            }
            json = json.Substring(0, json.Length - 1);
            json += "]";
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