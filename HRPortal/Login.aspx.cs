using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            try
            {
                String tUsername = username.Text.Trim();
                String tPassword = password.Text.Trim();
                var nav = new Config().ReturnNav();
                var users = nav.DynasoftPortalUser.Where(r => r.Authentication_Email == tUsername && r.Password_Value == tPassword && r.Record_Type == "Lawyer");
                Boolean exists = false;
                foreach (var user in users)
                {
                    exists = true;
                    Session["name"] = user.Full_Name;
                    Session["lawyerNo"] = user.Record_ID;

                    if (user.Change_Password == false)
                    {
                        Response.Redirect("ChangePassword.aspx");
                    }
                    
                }
                if (!exists)
                {
                    feedback.InnerHtml =
                        "<div class='alert alert-danger'>A user with the entered credentials does not exist<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
            catch (Exception ex)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>'"+ex.Message+"'</div>";

            }
        }
    }
}