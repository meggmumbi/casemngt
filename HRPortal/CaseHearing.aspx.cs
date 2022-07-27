using HRPortal.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class CaseHearing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var nav = new Config().ReturnNav();
                var empList = nav.CaseRegister.ToList();
                List<Item> list = new List<Item>();
                foreach (var item in empList)
                {
                    Item itm = new Item();
                    itm.Description = item.No +'_'+item.Case_Number+'_'+item.Name_of_Parties+'_'+item.Nature_of_Claim;
                    itm.No = item.No;
                    list.Add(itm);
                }

                caseentry.DataSource = list;
                caseentry.DataValueField = "No";
                caseentry.DataTextField = "Description";
                caseentry.DataBind();

                var advo = nav.CaseAdvocates;
                advocate.DataSource = advo;
                advocate.DataValueField = "Code";
                advocate.DataTextField = "Names";
                advocate.DataBind();
            }
        }

        protected void Savegeneraldetails_Click(object sender, EventArgs e)
        {
            try
            {
                bool err = false;
                string msg = "";
                string docNo = "";
                string txtcaseentry = caseentry.SelectedValue;
                string nlasthearingdate = registrationDate.Text.Trim();
                DateTime txtlasthearingdate = new DateTime();
                try
                {
                    txtlasthearingdate = DateTime.ParseExact(nlasthearingdate, "d/M/yyyy", CultureInfo.InvariantCulture);
                }
                catch (Exception)
                {
                }
                string txtpreceedings = preceedings.Text.Trim();
                int txtattendance = 0;
                    //Convert.ToInt32(attendance.Text.Trim());
                string nmentiondate = returndate.Text.Trim();
                DateTime txtmentiondate = new DateTime();
                try
                {
                    txtmentiondate = DateTime.ParseExact(nmentiondate, "d/M/yyyy", CultureInfo.InvariantCulture);
                }
                catch (Exception)
                {
                }
                string nnexthearingdate = DOB.Text.Trim();
                DateTime txtnexthearingdate = new DateTime();
                try
                {
                    txtnexthearingdate = DateTime.ParseExact(nnexthearingdate, "d/M/yyyy", CultureInfo.InvariantCulture);
                }
                catch (Exception)
                {
                }
                DateTime txttoday = DateTime.ParseExact(Convert.ToDateTime(DateTime.Now).ToString("d/M/yyyy"), "d/M/yyyy", CultureInfo.InvariantCulture); 

                if(txtnexthearingdate < txttoday)
                {
                    err = true;
                    msg = "The Next Hearing / Mention / Judgement / Rulling Date cannot be less than today.";
                }
                string txtdecision = decision.Text.Trim();
                string nbringuphearingdate = qualificationTo.Text.Trim();
                DateTime txtbringuphearingdate = new DateTime();
                try
                {
                    txtbringuphearingdate = DateTime.ParseExact(nbringuphearingdate, "d/M/yyyy", CultureInfo.InvariantCulture);
                }
                catch (Exception)
                {
                }
                string nbringupmentiondate = qualificationFrom.Text.Trim();
                DateTime txtbringupmentiondate = new DateTime();
                try
                {
                    txtbringupmentiondate = DateTime.ParseExact(nbringupmentiondate, "d/M/yyyy", CultureInfo.InvariantCulture);
                }
                catch (Exception)
                {
                }
                string txtcoram = coram.Text.Trim();
                if (err)
                {
                    generalFeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    String status = Config.ObjNav.FnSaveCasehearinggeneralDetails(docNo, txtcaseentry, txtlasthearingdate, txtpreceedings, txtattendance, txtmentiondate, txtnexthearingdate, txtdecision, txtbringuphearingdate, txtbringupmentiondate, txtcoram);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        Response.Redirect("CaseHearing.aspx?step=2&&docNo=" + info[2]);
                    }
                    else
                    {
                        generalFeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                generalFeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void addadvocate_Click(object sender, EventArgs e)
        {
            try
            {
                int docNo = Convert.ToInt32(Request.QueryString["docNo"]);
                string txtadvocate = advocate.Text.Trim();

                String status = Config.ObjNav.FnSaveAdvocate(docNo, txtadvocate);
                String[] info = status.Split('*');
                if (info[0] == "success")
                {
                    Linesfeedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "  <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    Linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
            catch (Exception m)
            {
                Linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void nexttostepthree_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["docNo"];
            Response.Redirect("CaseHearing.aspx?step=3&&docNo="+docNo);
        }

        protected void backtostepone_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["docNo"];
            Response.Redirect("CaseHearing.aspx?step=1&&docNo=" + docNo);
        }

        protected void uploadDocument_Click(object sender, EventArgs e)
        {

        }

        protected void backtosteptwo_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["docNo"];
            Response.Redirect("CaseHearing.aspx?step=2&&docNo=" + docNo);
        }

        protected void submitcasehearing_Click(object sender, EventArgs e)
        {
            try
            {
                int docNo = Convert.ToInt32(Request.QueryString["docNo"]);

                String status = Config.ObjNav.FnSubmithearing(docNo);
                String[] info = status.Split('*');
                if (info[0] == "success")
                {
                    documentsfeedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "  <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                    "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                }
                else
                {
                    documentsfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
            catch (Exception m)
            {
                documentsfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
    }
}