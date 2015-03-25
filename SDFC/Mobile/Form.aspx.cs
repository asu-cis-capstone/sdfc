using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SDFC.Models;

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
            //create new accident report
            AccidentReport myReport = new AccidentReport();            
            
            //populate object with values from inputs
            myReport.Name = txtName.Text;
            myReport.Comments = txtComments.Text;
            myReport.VictimName = txtVictimName.Text;
            myReport.Address = txtAddress.Text;
            myReport.Phone = txtPhone.Text;
            myReport.Age = Convert.ToInt32(txtAge.Text);
            myReport.Male = genderMale.Checked;
            myReport.Activity = txtActivity.SelectedIndex;
            myReport.location = txtLocation.SelectedIndex;
            myReport.Action = txtAction.SelectedIndex;
            myReport.InjuryType = txtInjuryType.SelectedIndex;
            myReport.InjuryLocation = txtLocation.SelectedIndex;
            myReport.Treatment = txtTreatment.SelectedIndex;
            myReport.Treator = txtTreator.Text;
            myReport.FacilitiesManagemet = facManYes.Checked;
            myReport.PoliceContacted = contactedYes.Checked;
            myReport.ReportNumber = txtReportNum.Text;
            myReport.TimeCalled = Convert.ToDateTime(txtTimeCalled.Text);
            myReport.TimeCalled = Convert.ToDateTime(txtArrivalTime.Text);
            myReport.TransportedTo = txtTransportedTo.Text;
            myReport.MedicalReport = txtMedicalReport.Text;
            myReport.PositionTitles = txtPositionTitles.Text;
            myReport.ManagerCalled = txtManagerCalled.Checked;
            myReport.WhyNot = txtNotWhy.Text;
            myReport.Description = txtDescription.Text;
            myReport.WitnessName = txtWitnessName.Text;
            myReport.WitnessPhone = txtWitnessPhone.Text;

            //add the report to the database
            myConnector.AddReport(myReport);
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