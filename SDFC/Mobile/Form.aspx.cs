using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SDFC.Models;
using System.Web.Configuration;
using System.Web.UI.HtmlControls;

namespace SDFC.Mobile
{
    public partial class Form : System.Web.UI.Page
    {
        private DB_Connector myConnector
        {
            get
            {
                return (DB_Connector)Session["myConnector"];
            }
            set
            {
                Session["myConnector"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user has not logged in. 
            if (!LoggedIn())
            {
                Response.Redirect("Login.aspx"); //redirect
                return; //stop further execution
            }

            if (!this.IsPostBack)
            {
                //retrieve connection string from web.config
                string conString = WebConfigurationManager.AppSettings["ConnectionString"];
                //assign connection string to sqldatasources
                ActionList.ConnectionString = conString;
                ActivityList.ConnectionString = conString;
                InjuryLocationList.ConnectionString = conString;
                InjuryTypeList.ConnectionString = conString;
                LocationList.ConnectionString = conString;
                TreatmentList.ConnectionString = conString;

                this.Master.Title = "form";
                Master.HasSigPad = true;
                myConnector = new DB_Connector();
                
            }
            else
            {

            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            //get control with JSON data from page
            ContentPlaceHolder cph = (ContentPlaceHolder)this.Master.FindControl("MobileContent");
            HtmlInputHidden myControl = (HtmlInputHidden)cph.FindControl("output");

            //create new accident report
            AccidentReport myReport = new AccidentReport();            
            
            //populate object with values from inputs
            //myReport.SignatureJSON = output.Value;
            myReport.SignatureJSON = myControl.Value;
            myReport.Name = txtName.Text;
            myReport.Comments = txtComments.Text;
            myReport.VictimName = txtVictimName.Text;
            myReport.Address = txtAddress.Text;
            myReport.Phone = txtPhone.Text;
            myReport.Age = Convert.ToInt32(txtAge.Text);
            myReport.Male = genderMale.Selected;
            myReport.Activity = Convert.ToInt32(txtActivity.SelectedValue);
            myReport.location = Convert.ToInt32(txtLocation.SelectedValue);
            myReport.Action = Convert.ToInt32(txtAction.SelectedValue);
            myReport.InjuryType = Convert.ToInt32(txtInjuryType.SelectedValue);
            myReport.InjuryLocation = Convert.ToInt32(txtLocation.SelectedValue);
            myReport.Treatment = Convert.ToInt32(txtTreatment.SelectedValue);
            myReport.Treator = txtTreator.Text;
            myReport.FacilitiesManagemet = facManYes.Selected;
            myReport.PoliceContacted = contactedYes.Selected;
            myReport.ReportNumber = txtReportNum.Text;
            myReport.TimeCalled = Convert.ToDateTime(txtTimeCalled.Text);
            myReport.ArrivalTime = Convert.ToDateTime(txtArrivalTime.Text);
            myReport.TransportedTo = txtTransportedTo.Text;
            myReport.MedicalReport = txtMedicalReport.Text;
            myReport.PositionTitles = txtPositionTitles.Text;
            myReport.ManagerCalled = txtManagerCalled.Checked;
            myReport.WhyNot = txtNotWhy.Text;
            myReport.Description = txtDescription.Text;
            myReport.WitnessName = txtWitnessName.Text;
            myReport.WitnessPhone = txtWitnessPhone.Text;            
            //myReport.SignatureJSON = output.Value;

            //add the report to the database
            if (myConnector.AddReport(myReport, Session["AsuID"].ToString()))
                Response.Redirect("Confirmation.aspx");
            else
                Response.Write("<script>alert('Error creating form');</script>"); //if error occured, display message
        }

        protected void Page_Unload(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Checks for username stored in session. If exists; the user has logged in.
        /// </summary>
        /// <returns>Log in status for user</returns>
        private bool LoggedIn()
        {
            return (Session["Username"] != null);
        }
    }
}