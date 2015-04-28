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
        //string victimName = ((Label)item.FindControl("lblVictimName")).Text;
        //victimName = "Showing";

        string name = ((Label)item.FindControl("lblVictimName")).Text;
        string address = ((Label)item.FindControl("lblAddress")).Text;
        string phoneNumber = ((Label)item.FindControl("lblPhone")).Text;
        string gender = ((Label)item.FindControl("lblGender")).Text;
        string age = ((Label)item.FindControl("lblAge")).Text;
        string asuID = ((Label)item.FindControl("lblAsuID")).Text;
        string status = ((Label)item.FindControl("lblVictimName")).Text;
        string reportID = ((Label)item.FindControl("lblReportID")).Text;

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

        string mgrReview = ((TextBox)item.FindControl("txtMgrReview")).Text;
        string mgrDate = Convert.ToString(System.DateTime.Now);
        string mgrPosition = ((TextBox)item.FindControl("txtMgrPosition")).Text;
        string mgrReferred = ((TextBox)item.FindControl("txtMgrReferred")).Text;
        string mgrFollowup = ((TextBox)item.FindControl("txtMgrFollowup")).Text;

        //string pdfTemplate = @"c:\Temp\pdfform.pdf";
        string pdfTemplate = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"Desktop\reference\accidentReport.pdf");

        Random rnd = new Random();
        string fileName = "report#" + reportID + "_" + rnd.Next(1, 999);
        //string newFile = @"c:\Temp\result2.pdf";
        string path = HttpRuntime.AppDomainAppPath + "\\downloads\\";
        string newFile = path + fileName + ".pdf";

        PdfReader pdfReader = new PdfReader(pdfTemplate);

        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }

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
        pdfFormFields.SetField("911Called", emergencyCalled);
        pdfFormFields.SetField("fmCalled", managerCalled);
        pdfFormFields.SetField("reportNumber", reportNumber);
        pdfFormFields.SetField("medicalReportNumber", medicalNumber);
        pdfFormFields.SetField("treatment", treatmentMethod);

        pdfFormFields.SetField("positionTitle", position);
        pdfFormFields.SetField("timeCalled", timeCalled);
        pdfFormFields.SetField("fmWhy", notWhy);
        pdfFormFields.SetField("arrivalTime", arrivalTime);
        pdfFormFields.SetField("transportedTo", transported);

        pdfFormFields.SetField("description", description);
        pdfFormFields.SetField("witnessName", witnessName);
        pdfFormFields.SetField("witnessPhone", witnessPhone);

        pdfFormFields.SetField("manageDate", mgrDate);
        pdfFormFields.SetField("manageReviewedBy", mgrReview);
        pdfFormFields.SetField("manageSign", "");
        pdfFormFields.SetField("managePosition", mgrPosition);
        pdfFormFields.SetField("manageReferredTo", mgrReferred);
        pdfFormFields.SetField("manageFollowup", mgrFollowup);

        // Closing Part
        pdfStamper.FormFlattening = false;

        pdfStamper.Close();

        StreamReader streamReader = new StreamReader(newFile);

        Stream stream = streamReader.BaseStream;

        BinaryReader binaryReader = new BinaryReader(stream);

        byte[] sendbyteArray = binaryReader.ReadBytes(Convert.ToInt32(binaryReader.BaseStream.Length));

        Response.Redirect("/downloads/" + fileName + ".pdf");
        //Response.ContentType = "application/pdf";
        //Response.AddHeader("Content-Type", "application/pdf");
        //Response.AddHeader("Content-Disposition", "inline");
        //Response.BinaryWrite(sendbyteArray);
        //Response.End(); 

    }

    protected void saveFollowup_Click(object sender, EventArgs e)
    {
        try
        {
            //Create MySQL connection
            MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");

            //Open Connection
            conn.Open();

            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            int reportID = Convert.ToInt32(((Label)item.FindControl("lblReportID")).Text);
            string mgrReview = ((TextBox)item.FindControl("txtMgrReview")).Text;
            DateTime mgrDate = System.DateTime.Now;
            string mgrPosition = ((TextBox)item.FindControl("txtMgrPosition")).Text;
            string mgrReferred = ((TextBox)item.FindControl("txtMgrReferred")).Text;
            string mgrFollowup = ((TextBox)item.FindControl("txtMgrFollowup")).Text;

            //Call stored procedure with stored procedure name and connection
            MySqlCommand cmd = new MySqlCommand("spUpdateRiskMgr", conn);
            //SELECT top 10 FROM reports WHERE manager='this manager' ORDER BY date DESC

            //Set command as a stored procedure
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@treportID", reportID);
            cmd.Parameters.AddWithValue("@tmgrReview", mgrReview);
            cmd.Parameters.AddWithValue("@tmgrDate", mgrDate);
            cmd.Parameters.AddWithValue("@tmgrPosition", mgrPosition);
            cmd.Parameters.AddWithValue("@tmgrReferred", mgrReferred);
            cmd.Parameters.AddWithValue("@tmgrFollowup", mgrFollowup);

            //Set data adapter and fill the data table
            cmd.ExecuteNonQuery();

            //Close the connection
            conn.Close();

        }
        catch (Exception)
        {
            //show error
            throw;
        }

    }

}