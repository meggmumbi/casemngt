using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var nav = new Config().ReturnNav();
                string lawyerNo = Convert.ToString(Session["lawyerNo"]);
                var lawyers = nav.Vendors.Where(x=> x.No == lawyerNo).ToList();
                foreach(var lawyer in lawyers)
                {
                    fullname.Text = lawyer.Name;
                    email.Text = lawyer.E_Mail;
                    phonenumber.Text = lawyer.Phone_No;
                    idno.Text = lawyer.ID_Number;
                    postcode.Text = lawyer.Post_Code;
                    city.Text = lawyer.City;
                    address.Text = lawyer.Address;
                    country.Text = lawyer.Country_Region_Code;
                }
            }
        }
    }
}