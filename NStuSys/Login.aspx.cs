using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace NStuSys
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean( Session["login"]) == true)
            {
                Response.Redirect("Default.aspx");
            }

            if (Request.Cookies["username"] != null)
            {
                HttpCookie aCookie;
                aCookie = Request.Cookies["username"];
                UserName.Text = Server.HtmlEncode(aCookie.Value);
            }
        }

   

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (UserName.Text.Length > 3)
            {
                if (Password.Text.Length > 6)
                {
                    SqlData1.SelectCommand = "SELECT * FROM [users] WHERE ([username] = '" + UserName.Text + "' AND password = '" + Password.Text + "')";
                    DataView dv = new DataView();
                    dv = (DataView)SqlData1.Select(DataSourceSelectArguments.Empty);
                    DataTable dt = new DataTable();
                    dt = dv.ToTable();

                    if (dt.Rows.Count < 1)
                    {
                        FailureText.Text = "Username or password incorrect";
                    }
                    else
                    {
                        DataRow dr;
                        dr = dt.Rows[0];
                        if (dr["status"].ToString() == "0")
                        {
                            FailureText.Text = "User is disabled";
                        }
                        else
                        {

                            for (int i = 0; i < (dr.ItemArray.Length -1); i++)
                            {
                                Session.Add(dt.Columns[i].ColumnName.ToString(), dr[i].ToString());
                            }
                            int r = Convert.ToInt32(dr["role"]);
                            SqlData1.SelectCommand = "SELECT role FROM roles WHERE Id=" + r.ToString();
                            dv = (DataView)SqlData1.Select(DataSourceSelectArguments.Empty);
                            dt = dv.ToTable();
                            if (dt.Rows.Count > 0)
                            {
                                dr = dt.Rows[0];
                                Session.Add("role", dr[0].ToString());
                            }

                            Session.Add("login", "true");
                            Session.Timeout = 10;

                            if (RememberMe.Checked == true)
                            {
                                Response.Cookies["username"].Value = UserName.Text.ToString();
                                Response.Cookies["username"].Expires = DateTime.Now.AddDays(1);
                            }

                            Response.Redirect("Default.aspx?Login_Success");
                        }
                    }
                }
                else
                {
                    FailureText.Text = "Password must be greater than 6 characters";
                }
              
            }
         }
    }
}