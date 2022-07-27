using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class ForgotPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forgotpassword_Click(object sender, EventArgs e)
        {
            try
            {
                String tUsername = username.Text.Trim();
                String status = Config.ObjNav.ResetPassword(tUsername);
                String[] info = status.Split('*');
                feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] +
                                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                if (info[0] == "success")
                {
                    username.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('Login.aspx') }, 10000);", true);
            }
            }
            catch (Exception t)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + t.Message +
                                        "r<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
    }
}