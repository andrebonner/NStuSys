using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace NStuSys
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] == "logout")
            {
                Session.RemoveAll();
            }

            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Page.IsPostBack)
            {
                return;
            }
            DataView dv;
            DataTable dt;
            DataRow dr;

            if (Request.QueryString["stu"] != null && Request.QueryString["size"]!=null)
            {
                int stu_id = Convert.ToInt32(Request.QueryString["stu"]);
                               
                sqldata1.SelectCommand = "SELECT * FROM stu_photos WHERE studentid=" + stu_id.ToString();
                dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                dt = dv.ToTable();
                if (dt.Rows.Count == 1)
                {
                   
                    dr = dt.Rows[0];
                    Response.Clear();
                    Response.ContentType = dr["type"].ToString();
                    byte[] buffer = (byte[])dr["picture"];

                    MemoryStream memoryStream = new MemoryStream(buffer, false);
                    System.Drawing.Image imgFromDataBase = System.Drawing.Image.FromStream(memoryStream);
                    imgFromDataBase.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);            

                    Response.End();
                }
            }

            //DataView dv;
            //DataTable dt = new DataTable();
            //DataRow dr;

            dv = (DataView) sqldata1.Select(DataSourceSelectArguments.Empty);
            dt = dv.ToTable();

            String ActionTitle = "";
            if (dt.Rows.Count < 1 || Request.QueryString["action"] == "add")
            {
                // show the new student information dialog
                multiview1.ActiveViewIndex = 1;
                ActionTitle = " : New Student";
            }else if(Request.QueryString["action"] == "view"){
                // view all the students
                multiview1.ActiveViewIndex = 2;
                ActionTitle = " : View Students";
            }
            else
            {
                if (Request.QueryString["id"] != null)
                {
                    if (Request.QueryString["action"] == "delete")
                    {
                        // dont have a delete yet
                        multiview1.ActiveViewIndex = 5;
                        int id = Convert.ToInt32(Request.QueryString["id"]);

                        // student information for editing
                        sqldata1.SelectCommand = "SELECT id, firstname, lastname, address FROM students WHERE id=" + id.ToString();
                        dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                        dt = dv.ToTable();

                        if (dt.Rows.Count == 1)
                        {
            
                            dr = dt.Rows[0];
                            this.labelFirstname.Text=dr["firstname"].ToString();
                            this.labelLastname.Text = dr["lastname"].ToString();
                            this.labelAddress.Text = dr["address"].ToString();
                        }
                        ActionTitle = " : Delete Student";
                    }

                    if (Request.QueryString["action"] == "edit")
                    {
                        multiview1.ActiveViewIndex = 0;
                        int id = Convert.ToInt32(Request.QueryString["id"]);

                        // student information for editing
                        sqldata1.SelectCommand = "SELECT * FROM students WHERE id=" + id.ToString();
                        dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                        dt = dv.ToTable();

                        if (dt.Rows.Count == 1)
                        {
                            
                            dr = dt.Rows[0];
                            this.studentId.Value = id.ToString();
                            // student info
                            String dBirth = dr["dateofbirth"].ToString();
                            if (dr["dateofbirth"].ToString() != "")
                            {
                                try
                                {
                                    dBirth = Convert.ToDateTime(dr["dateofbirth"]).ToString("dd/MM/yyyy");
                                    //dob = DateTime.ParseExact(dBirth, "dd/MM/yyyy", null);
                                }
                                catch (FormatException fe)
                                {
                                    Response.Write(dr["dateofbirth"].ToString() + "<br/> FormatException: " + fe.Message.ToString());
                                }
                            }           

                            this.firstName.Text = dr["firstname"].ToString();
                            this.middleName.Text = dr["middlename"].ToString();
                            this.lastName.Text = dr["lastname"].ToString();
                            this.dateOfBirth.Text = dBirth;
                            this.sex.SelectedValue = dr["sex"].ToString();
                            this.address.Text = dr["address"].ToString();
                            // guardian information for editing
                            sqldata1.SelectCommand = "SELECT * FROM guardians WHERE studentid=" + id.ToString();
                            dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                            dt = dv.ToTable();
                            if (dt.Rows.Count == 1)
                            {
                                
                                dr = dt.Rows[0];
                                // guardian info
                                this.gFirstName.Text = dr["gfirstname"].ToString();
                                this.gLastName.Text = dr["glastname"].ToString();
                                this.gContact.Text = dr["contact"].ToString();
                            }

                            sqldata1.SelectCommand = "SELECT * FROM nextofkin WHERE studentid=" + id.ToString();
                            dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                            dt = dv.ToTable();
                            if (dt.Rows.Count == 1)
                            {
                                
                                dr = dt.Rows[0];
                                // nextofkin info
                                this.nokFirstName.Text = dr["nokfirstname"].ToString();
                                this.nokLastName.Text = dr["noklastname"].ToString();
                                this.nokContact.Text = dr["nokcontact"].ToString();
                                this.nokRelationship.SelectedValue = dr["nokrelationship"].ToString();
                            }
                            sqldata1.SelectCommand = "SELECT * FROM stu_photos WHERE studentid=" + id.ToString();
                            dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                            dt = dv.ToTable();
                            if (dt.Rows.Count == 1)
                            {
                                dr = dt.Rows[0];
                                Image1.ImageUrl = "~/Photo.ashx?stu=" + id.ToString() + "&size=" + dr["filesize"].ToString();
                                
                                //dr["picture"];
                                //dr["type"];
                                //dr["filename"];
                                //dr["filesize"];
                            }
                        }
                        ActionTitle = " : Edit Student";
                    }
                }
                else
                {

                    if (Session["role"].ToString() == "teacher")
                    {
                        multiview1.ActiveViewIndex = 3;
                        ActionTitle = " : Change Password";
                    }

                    if (Request.QueryString["action"] == "user")
                    {                       
                        if (Session["role"].ToString() == "administrator")
                        {
                            multiview1.ActiveViewIndex = 4;
                            if (Request.QueryString["uid"] != null)
                            {
                                int uId = Convert.ToInt32(Request.QueryString["uid"]);
                                this.userId.Value = uId.ToString();
                                sqldata1.SelectCommand = "SELECT * FROM users WHERE Id=" + uId.ToString();
                                dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                                dt = dv.ToTable();

                                if (dt.Rows.Count == 1)
                                {

                                    dr = dt.Rows[0];
                                    this.UserName.Text = dr["username"].ToString();
                                    this.Email.Text = dr["email"].ToString();
                                    this.Role.SelectedValue = dr["role"].ToString();
                                    this.status.Checked = true;
                                }
                                this.saveUserButton.CommandName = "edit";
                                ActionTitle = " : Edit User";
                                this.userTitle.Text = "Edit Current User";
                            }
                            else
                            {
                                this.saveUserButton.CommandName = "create";
                                ActionTitle = " : New User";
                                this.userTitle.Text = "Create New User";
                            }
                        }
                    }
                }
            }

            userLoginInfo.Text = "Welcome " + Session["username"].ToString() +", Role: " + Session["role"].ToString() + ", <a href=\"Default.aspx?action=logout&session="+ Session.SessionID.ToString() +"\" >Logout</a>";

            Page.Title = Application["title"].ToString() + ActionTitle;
        }

        protected void onEdit_student(object sender, GridViewCommandEventArgs e) {
            int index = Convert.ToInt32(e.CommandArgument);
            String mId = gridview1.DataKeys[index].Value.ToString();

            Response.Redirect("Default.aspx?action=edit&id=" + mId);
        }

        protected void onDelete_student(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            String mId = gridview1.DataKeys[index].Value.ToString();

            Response.Redirect("Default.aspx?action=delete&id=" + mId);
        }
        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             
            if (e.CommandName == "editButton")
            {
                onEdit_student(sender, e);

            }
            else if(e.CommandName=="deleteButton")
            {
                onDelete_student(sender, e);
            }
        }


        protected void addButtonFoot_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?action=add");
        }

        protected void sSave_Click(object sender, EventArgs e)
        {
            //firstName.Text = sFirstName.Text;
            //lastName.Text = sLastName.Text;
            //sex.SelectedValue = sSex.SelectedValue;
            //gContact.Text = sContact.Text;

            sqldata1.InsertCommand = "INSERT INTO students(firstname, lastname, sex) VALUES ('" + sFirstName.Text + "','" + sLastName.Text + "','" + sSex.SelectedValue + "')";
            if (sqldata1.Insert() > 0)
            {
                DataView dv;
                DataTable dt;
                sqldata1.SelectCommand = "SELECT id FROM students WHERE firstname='"+ sFirstName.Text +"' AND lastname='"+ sLastName.Text +"'";
                dv = (DataView)sqldata1.Select(DataSourceSelectArguments.Empty);
                dt = dv.ToTable();
                if (dt.Rows.Count > 0)
                {
                    DataRow dr;
                    dr = dt.Rows[0];

                    int sId = Convert.ToInt32(dr[0]);
                    sqldata1.InsertCommand = "INSERT INTO guardians (studentid, gfirstname, glastname, contact) VALUES ("+ sId.ToString() +",'','','"+ sContact.Text +"')";
                    sqldata1.Insert();

                    sqldata1.InsertCommand = "INSERT INTO nextofkin (studentid, nokfirstname, noklastname, nokcontact, nokrelationship) VALUES ("+ sId.ToString() +",'','','','')";
                    sqldata1.Insert();

                    sqldata1.InsertCommand = "INSERT INTO stu_photos (studentid, picture, type, filename, filesize) VALUES (" + sId.ToString() + ",'','','','')";
                    sqldata1.Insert();

                    Response.Redirect("Default.aspx?action=edit&id=" + sId.ToString());
                }
            }
        }

        protected void sex_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void address_TextChanged(object sender, EventArgs e)
        {

        }

        protected void saveStudent_Click(object sender, EventArgs e)
        {
            DateTime dob = new DateTime();
            string dBirth = dateOfBirth.Text;
            
            try
            {
                //dob = Convert.ToDateTime("13/04/1988");
                dob = DateTime.ParseExact(dBirth,"dd/MM/yyyy",null);
            }
            catch (FormatException fe)
            {
                Response.Write(dateOfBirth.Text + "<br/> FormatException: "+ fe.Message.ToString());
            }
            
            sqldata1.UpdateCommand = "UPDATE students SET firstname='" + firstName.Text + "', middlename='"+ middleName.Text +"', lastname='" + lastName.Text + "', dateofbirth='"+ dob.ToShortDateString() +"', sex='" + sex.SelectedValue + "' WHERE id="+ studentId.Value;
            if (sqldata1.Update() > 0)
            {
                sqldata1.UpdateCommand = "UPDATE guardians SET gfirstname ='" + gFirstName.Text + "', glastname ='" + gLastName.Text + "', contact ='" + gContact.Text + "' WHERE studentid=" + studentId.Value;
                if (sqldata1.Update() < 1)
                {
                    Response.Write("Could not Update Guardians<br/>");
                }

                sqldata1.UpdateCommand = "UPDATE nextofkin SET nokfirstname ='" + nokFirstName.Text + "', noklastname ='" + nokLastName.Text + "', nokcontact ='" + nokContact.Text + "', nokrelationship ='" + nokRelationship.SelectedValue + "' WHERE studentid=" + studentId.Value;
                if (sqldata1.Update() < 1)
                {
                    Response.Write("Could not Upate Next of Kin<br/>");
                }

                if (photoFile.HasFile)
                {
                    //Response.Write(this.photoFile.PostedFile.FileName);
                    //Response.Write(this.photoFile.PostedFile.ContentType);
                    //Response.Write(this.photoFile.PostedFile.ContentLength.ToString());

                    byte[] dImage = new byte[photoFile.PostedFile.ContentLength];
                    photoFile.PostedFile.InputStream.Read(dImage, 0, photoFile.PostedFile.ContentLength);

                    sqldata1.UpdateCommand = "UPDATE stu_photos SET picture ='"+ dImage +"', type='" + photoFile.PostedFile.ContentType + "', filename='" + photoFile.PostedFile.FileName + "', filesize='" + photoFile.PostedFile.ContentLength.ToString() + "' WHERE studentid=" + studentId.Value;
                  
                    if (sqldata1.Update() < 1)
                    {
                        Response.Write("Could not Update Students Photos<br/>");
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"].ToString();
            // delete the student information from database
            sqldata1.DeleteCommand = "DELETE FROM students WHERE id="+ id;
            Response.Write(sqldata1.DeleteCommand.ToString() + "<br/>");

            sqldata1.DeleteCommand = "DELETE FROM guardians WHERE studentid=" + id;
            Response.Write(sqldata1.DeleteCommand.ToString() + "<br/>");

            sqldata1.DeleteCommand = "DELETE FROM nextofkin WHERE studentid=" + id;
            Response.Write(sqldata1.DeleteCommand.ToString() + "<br/>");

        }

        protected void saveUserButton_Click(object sender, EventArgs e)
        {
            if (this.saveUserButton.CommandName == "create") {
                sqldata1.InsertCommand = "INSERT INTO users (username, password, email, status, role, regdate) VALUES ('" + UserName.Text + "','"+ Password.Text +"','"+ Email.Text +"','1','"+ Role.SelectedValue +"', GETDATE())";
                if (sqldata1.Insert() > 0)
                {
                    Response.Redirect("Default.aspx?action=user");
                }
            }
            else if (this.saveUserButton.CommandName == "edit")
            {
                if (Request.QueryString["uid"] != null)
                {
                    int uId = Convert.ToInt32(Request.QueryString["uid"].ToString());
                    int sta = 0;
                    if (status.Checked)
                    {
                        sta = 1;
                    }
                    sqldata1.UpdateCommand = "UPDATE users SET username ='" + UserName.Text + "', password ='" + Password.Text + "', email ='" + Email.Text + "', status ='" + sta.ToString() + "', role ='" + Role.SelectedValue + "' WHERE Id=" + uId;
                    if (sqldata1.Update() > 0)
                    {
                        Response.Redirect("Default.aspx?action=user&uid="+ uId.ToString());
                    }
                }
            }
        }

        protected void repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Role_SelectedIndexChanged(object sender, EventArgs e)
        {

        }






    }
}