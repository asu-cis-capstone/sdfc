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
    protected void Page_PreInit(object sender, EventArgs e)
    {
        //retrieve the user agent string
        string userAgent = Request.UserAgent.ToString().ToLower();

        //perform a variety of tests to ensure user is not mobile
        if (Request.Browser.IsMobileDevice ||
            userAgent.Contains("iphone") ||
            userAgent.Contains("blackberry") ||
            userAgent.Contains("mobile") ||
            userAgent.Contains("ce") ||
            userAgent.Contains("opera mini") ||
            userAgent.Contains("palm") ||
            userAgent.Contains("htc") ||
            userAgent.Contains("android"))
        {
            //if user is mobile, redirect to mobile site
            Response.Redirect("../Mobile/Login.aspx");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //Set Title
        this.Master.Title = "Home";

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



        string time = ((Label)item.FindControl("lblVictimName")).Text;
        string date = ((Label)item.FindControl("lblVictimName")).Text;
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
        pdfFormFields.SetField("time", time);
        pdfFormFields.SetField("phoneNumber", phoneNumber);
        pdfFormFields.SetField("age", age);
        pdfFormFields.SetField("date", date);
        pdfFormFields.SetField("asuID", asuID);
        pdfFormFields.SetField("treatmentPerson", treatmentPerson);
        pdfFormFields.SetField("positionTitle", position);
        pdfFormFields.SetField("timeCalled", timeCalled);
        pdfFormFields.SetField("arrivalTime", arrivalTime);
        pdfFormFields.SetField("reportNumber", reportNumber);
        pdfFormFields.SetField("medicalNumber", medicalNumber);
        pdfFormFields.SetField("transportedTo", transported);
        pdfFormFields.SetField("description", description);
        pdfFormFields.SetField("witnessName", witnessName);
        pdfFormFields.SetField("witnessPhone", witnessPhone);



        switch (gender)
        {
            case "Male":
                gender = "1";
                break;
            case "Female":
                gender = "2";
                break;
        }
        pdfFormFields.SetField("gender", gender);

        switch (status)
        {
            case "Student":
                status = "1";
                break;
            case "Faculty":
                status = "2";
                break;
            case "Staff":
                status = "3";
                break;
            case "Guest":
                status = "4";
                break;
            case "sdfs":
                status = "5";
                break;
            case "otherStatus":
                status = "6";
                //pdfFormFields.SetField("otherStatus", otherStatus);
                break;
        }
        pdfFormFields.SetField("status", status);
        
        switch (activity)
        {
            case "Intramurals":
                activity = "1";
                break;
            case "Informal Rec":
                activity = "2";            
                break;
            case "Kid's Camp":
                activity = "3";
                break;
            case "Sport Clubs":
                activity = "4";
                break;
            case "Group Fitness":
                activity = "5";
                break;
            case "Swim Rental":
                activity = "6";
                break;
            case "Special Event":
                activity = "7";
                //pdfFormFields.SetField("specialEvent", specialEvent);
                break;
            case "Other":
                activity = "8";
                //pdfFormFields.SetField("otherActivity", otherActivity);
                break;            
        }
        pdfFormFields.SetField("activity", activity);
                
        switch (location)
        {
            case "assessmentlab":
                location = "1";
                break;
            case "Field":
                location = "2";
                break;
            case "Gold Gym":
                location = "3";
                break;
            case "Green Gym":
                location = "4";
                break;
            case "Indoor Track":
                location = "5";
                break;
            case "Locker Room":
                location = "6";
                break;
            case "Mac Gym":
                location = "7";
                break;
            case "Maroon Gym":
                location = "8";
                break;
            case "Outdoor Track":
                location = "9";
                break;
            case "PE":
                location = "10";
                break;
            case "Pool":
                location = "11";
                break;
            case "Racquetball/Squash Crts":
                location = "12";
                break;
            case "Small Gym":
                location = "13";
                break;
            case "Three-Bay Gym":
                location = "14";
                break;
            case "Two-Bay Gym":
                location = "15";
                break;
            case "Upstairs Loft/Cardio E or W":
                location = "16";
                break;
            case "Weight Room E or W":
                location = "17";
                break;
            case "Wellness Suite":
                location = "18";
                break;
            case "Other":
                location = "19";                
                //pdfFormFields.SetField("otherLocation", otherLocation);
                break;
        }
        pdfFormFields.SetField("location", location);

        //ListBox Selection
        switch (gender)
        {
            case "Male":
                gender = "1";
                break;
            case "Female":
                gender = "2";
                break;
        }
        pdfFormFields.SetField("gender", gender);

        switch (status)
        {
            case "Student":
                status = "1";
                break;
            case "Faculty":
                status = "2";
                break;
            case "Staff":
                status = "3";
                break;
            case "Guest":
                status = "4";
                break;
            case "sdfs":
                status = "5";
                break;
            case "otherStatus":
                status = "6";
                //pdfFormFields.SetField("otherStatus", otherStatus);
                break;
        }
        pdfFormFields.SetField("status", status);
        
        switch (activity)
        {
            case "Intramurals":
                activity = "1";
                break;
            case "Informal Rec":
                activity = "2";            
                break;
            case "Kid's Camp":
                activity = "3";
                break;
            case "Sport Clubs":
                activity = "4";
                break;
            case "Group Fitness":
                activity = "5";
                break;
            case "Swim Rental":
                activity = "6";
                break;
            case "Special Event":
                activity = "7";
                //pdfFormFields.SetField("specialEvent", specialEvent);
                break;
            case "Other":
                activity = "8";
                //pdfFormFields.SetField("otherActivity", otherActivity);
                break;            
        }
        pdfFormFields.SetField("activity", activity);
                
        switch (location)
        {
            case "assessmentlab":
                location = "1";
                break;
            case "Field":
                location = "2";
                break;
            case "Gold Gym":
                location = "3";
                break;
            case "Green Gym":
                location = "4";
                break;
            case "Indoor Track":
                location = "5";
                break;
            case "Locker Room":
                location = "6";
                break;
            case "Mac Gym":
                location = "7";
                break;
            case "Maroon Gym":
                location = "8";
                break;
            case "Outdoor Track":
                location = "9";
                break;
            case "PE":
                location = "10";
                break;
            case "Pool":
                location = "11";
                break;
            case "Racquetball/Squash Crts":
                location = "12";
                break;
            case "Small Gym":
                location = "13";
                break;
            case "Three-Bay Gym":
                location = "14";
                break;
            case "Two-Bay Gym":
                location = "15";
                break;
            case "Upstairs Loft/Cardio E or W":
                location = "16";
                break;
            case "Weight Room E or W":
                location = "17";
                break;
            case "Wellness Suite":
                location = "18";
                break;
            case "Other":
                location = "19";                
                //pdfFormFields.SetField("otherLocation", otherLocation);
                break;
        }
        pdfFormFields.SetField("location", location);

        switch (actionTaken)
        {
            case "1":
                actionTaken = "1";
                break;
            case "2":
                actionTaken = "2";
                break;
            case "3":
                actionTaken = "3";
                break;
            case "4":
                actionTaken = "4";
                break;
            case "5":
                actionTaken = "5";
                break;
            case "6":
                actionTaken = "6";
                break;
            case "otherAction":
                actionTaken = "7";
                //pdfFormFields.SetField("otherAction", actionTaken);
                break;
        }
        //pdfFormFields.SetField("actionTaken", actionTaken);

        switch (type)
        {
            case "1":
                type = "1";
                break;
            case "2":
                type = "2";
                break;
            case "3":
                type = "3";
                break;
            case "4":
                type = "4";
                break;
            case "5":
                type = "5";
                break;
            case "6":
                type = "6";
                break;
            case "7":
                type = "7";
                break;
            case "8":
                type = "8";
                break;
            case "othertype":
                type = "9";
                //pdfFormFields.SetField("otherType", type);
                break;
        }
        //pdfFormFields.SetField("injuryType", type);

        // Closing Part
        pdfStamper.FormFlattening = false;

        pdfStamper.Close();

    }

}