using System;
using System.Collections.Generic;
using System.Web;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI;
using System.IO;

namespace NStuSys
{
    /// <summary>
    /// Summary description for Photo
    /// </summary>
    public class Photo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.QueryString["stu"] != null)
            {
                int stu_id = Convert.ToInt32(context.Request.QueryString["stu"]);
                SqlDataSource sqldata = new SqlDataSource();
                DataView dv;
                DataTable dt;

                sqldata.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                sqldata.SelectCommand = "SELECT * FROM stu_photos WHERE studentid="+ stu_id.ToString();
                dv = (DataView)sqldata.Select(DataSourceSelectArguments.Empty);
                dt = dv.ToTable();
                if (dt.Rows.Count == 1)
                {
                    DataRow dr;
                    dr = dt.Rows[0];
                    context.Response.Clear();
                    context.Response.ContentType = dr["type"].ToString();
                    byte[] buffer = (byte[]) dr["picture"];

                    MemoryStream memoryStream = new MemoryStream(buffer, false);

                    try{
                        System.Drawing.Image imgFromDataBase = System.Drawing.Image.FromStream((Stream)memoryStream);
                        imgFromDataBase.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                    catch (ArgumentException ex)
                    {
                        context.Response.Write(ex.Message);
                    }

                    /*try
                    {
                        context.Response.OutputStream.Write(buffer, 0, buffer.Length);
                    }
                    catch (HttpException e)
                    {
                        context.Response.Write(e.Message);
                    }*/
                    context.Response.End();
                }
            }
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