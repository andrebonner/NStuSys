using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace NStuSys
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["title"] = "NStuSys : New Student System";
            //System.Diagnostics.Trace.WriteLine("Application Start");
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["startVal"] = 0;
            //System.Diagnostics.Trace.WriteLine("Session Start");
            Session.Timeout = 5;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}