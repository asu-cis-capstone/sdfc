using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.ProviderBase;
using MySql;
using MySql.Data;
using MySql.Data.MySqlClient;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using System.IO;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        { 
            Response.Redirect("Login.aspx");
        }

        //Set Title
        this.Master.Title = "Home";

        if (Request.QueryString["lastName"] != null)
        {
            string lastName = Request.QueryString["lastName"];

            try
            {
                //Create MySQL connection
                MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");

                //Open Connection
                conn.Open();

                //Declare variables
                DataTable dt = new DataTable();

                //Call stored procedure with stored procedure name and connection
                MySqlCommand cmd = new MySqlCommand("spSearchByLastName", conn);
                //SELECT top 10 FROM reports WHERE manager='this manager' ORDER BY date DESC

                //Set command as a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lastName", lastName);

                //Set data adapter and fill the data table
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(dt);

                //Close the connection
                conn.Close();

                //If SQL return rows, bind to repeater
                if (dt.Rows.Count > 0)
                {
                    rptrHome.DataSource = dt;
                    rptrHome.DataBind();
                }
                else
                {
                    //display no recent
                }
            }
            catch (Exception)
            {
                //show error
                throw;
            }

        }
        else
        {
            //This try/catch loads the 10 most recent records for the manager to display at home on page load
            try
            {
                //Create MySQL connection
                MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");

                //Open Connection
                conn.Open();

                //Declare variables
                DataTable dt = new DataTable();

                //Call stored procedure with stored procedure name and connection
                MySqlCommand cmd = new MySqlCommand("spGetRecentAccidentReport", conn);
                //SELECT top 10 FROM reports WHERE manager='this manager' ORDER BY date DESC

                //Set command as a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;

                //Set data adapter and fill the data table
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(dt);

                //Close the connection
                conn.Close();

                //If SQL return rows, bind to repeater
                if (dt.Rows.Count > 0)
                {
                    rptrHome.DataSource = dt;
                    rptrHome.DataBind();
                }
                else
                {
                    //display no recent
                }
            }
            catch (Exception)
            {
                //show error
                throw;
            }
        }

    }

    protected void exportPdf_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        string victimName = ((Label)item.FindControl("lblVictimName")).Text;
        victimName = "Showing";

        string name = ((Label)item.FindControl("lblVictimName")).Text;
        string address = ((Label)item.FindControl("lblAddress")).Text;
        string phoneNumber = ((Label)item.FindControl("lblPhone")).Text;
        string gender = ((Label)item.FindControl("lblGender")).Text;
        string age = ((Label)item.FindControl("lblAge")).Text;
        string asuID = ((Label)item.FindControl("lblAsuID")).Text;
        string status = ((Label)item.FindControl("lblVictimName")).Text;

        string activity = ((Label)item.FindControl("lblActivity")).Text;
        string location = ((Label)item.FindControl("lblLocationName")).Text;
        string actionTaken = ((Label)item.FindControl("lblActionName")).Text;
        string type = ((Label)item.FindControl("lblInjuryTypeName")).Text;
        string injuryLocation = ((Label)item.FindControl("lblInjuryLocationName")).Text;

        string treatmentPerson = ((Label)item.FindControl("lblTreatmentProvider")).Text;
        string managerCalled = ((Label)item.FindControl("lblManagerCalled")).Text;
        string emergencyCalled = ((Label)item.FindControl("lblEmergencyCalled")).Text;
        string reportNumber = ((Label)item.FindControl("lblEmergencyReportNum")).Text;
        string medicalNumber = ((Label)item.FindControl("lblMedicalReportNum")).Text;
        string treatmentMethod = ((Label)item.FindControl("lblTreatmentName")).Text;

        string position = ((Label)item.FindControl("lblPositionTitle")).Text;
        string notWhy = ((Label)item.FindControl("lblNotWhy")).Text;
        string timeCalled = ((Label)item.FindControl("lblTimeCalled")).Text;
        string arrivalTime = ((Label)item.FindControl("lblArrival")).Text;
        string transported = ((Label)item.FindControl("lblTransported")).Text;

        string description = ((Label)item.FindControl("lblDescription")).Text;
        string witnessName = ((Label)item.FindControl("lblWitnessName")).Text;
        string witnessPhone = ((Label)item.FindControl("lblWitnessPhone")).Text;



        //string time = ((Label)item.FindControl("lblVictimName")).Text;
        //string date = ((Label)item.FindControl("lblVictimName")).Text;
        //string otherActivity = ((Label)item.FindControl("lblVictimName")).Text;
        //string otherStatus = ((Label)item.FindControl("lblVictimName")).Text;
        //string otherLocation = ((Label)item.FindControl("lblVictimName")).Text;
        //string specialEvent = ((Label)item.FindControl("lblVictimName")).Text;
        //string lrc = Request.Form["lrc"];


        //string pdfTemplate = @"c:\Temp\pdfform.pdf";
        string pdfTemplate = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"Desktop\reference\accidentReport.pdf");
        string newFile = @"c:\Temp\result2.pdf";

        PdfReader pdfReader = new PdfReader(pdfTemplate);
        PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(newFile, FileMode.Create));

        AcroFields pdfFormFields = pdfStamper.AcroFields;

        //Textfields
        pdfFormFields.SetField("name", name);
        pdfFormFields.SetField("address", address);
        //pdfFormFields.SetField("time", time);
        pdfFormFields.SetField("phoneNumber", phoneNumber);
        pdfFormFields.SetField("gender", gender);
        pdfFormFields.SetField("age", age);
        //pdfFormFields.SetField("date", date);
        pdfFormFields.SetField("asuID", asuID);
        pdfFormFields.SetField("status", status);

        pdfFormFields.SetField("activity", activity);
        pdfFormFields.SetField("location", location);
        pdfFormFields.SetField("actionTaken", actionTaken);
        pdfFormFields.SetField("injuryType", type);
        pdfFormFields.SetField("injuryLocation", injuryLocation);

        pdfFormFields.SetField("treatmentPerson", treatmentPerson);
        pdfFormFields.SetField("emergencyCalled", emergencyCalled);
        pdfFormFields.SetField("managerCalled", managerCalled);
        pdfFormFields.SetField("reportNumber", reportNumber);
        pdfFormFields.SetField("medicalNumber", medicalNumber);
        pdfFormFields.SetField("treatmentMethod", treatmentMethod);

        pdfFormFields.SetField("positionTitle", position);
        pdfFormFields.SetField("timeCalled", timeCalled);
        pdfFormFields.SetField("fmWhy", notWhy);
        pdfFormFields.SetField("arrivalTime", arrivalTime);
        pdfFormFields.SetField("transportedTo", transported);

        pdfFormFields.SetField("description", description);
        pdfFormFields.SetField("witnessName", witnessName);
        pdfFormFields.SetField("witnessPhone", witnessPhone);

        // Closing Part
        pdfStamper.FormFlattening = false;

        pdfStamper.Close();

    }

}