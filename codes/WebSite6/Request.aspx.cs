using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillForm();        
    }

    private void FillForm()
    {
        string pdfTemplate = @"c:\Temp\pdfform.pdf";
        string newFile = @"c:\Temp\result.pdf";

        PdfReader pdfReader = new PdfReader(pdfTemplate);
        PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(newFile, FileMode.Create));

        AcroFields pdfFormFields = pdfStamper.AcroFields;

        string name = Request.Form["name"];
        string address = Request.Form["address"];
        string phoneNumber = Request.Form["phoneNumber"];
        string time = Request.Form["time"];
        string age = Request.Form["age"];
        string gender = Request.Form["gender"];
        string date = Request.Form["date"];
        string asuID = Request.Form["asuID"];
        string activity = Request.Form["activity"];
        string otherActivity = Request.Form["otherActivity"];
        string status = Request.Form["status"];
        string otherStatus = Request.Form["otherStatus"];
        string location = Request.Form["location"];
        string otherLocation = Request.Form["otherLocation"];
        string specialEvent = Request.Form["specialEvent"];
        string actionTaken = Request.Form["action"];
        string type = Request.Form["type"];
        //string lrc = Request.Form["lrc"];
        //string injuryLocation = Request.Form["vals"];
        string treatmentPerson = Request.Form["treatment"];
        string position = Request.Form["position"];
        string timeCalled = Request.Form["timeCalled"];
        string arrivalTime = Request.Form["arrivalTime"];
        string reportNumber = Request.Form["reportNumber"];
        string medicalNumber = Request.Form["medicalNumber"];
        string transported = Request.Form["transported"];
        string description = Request.Form["description"];
        string witnessName = Request.Form["witnessName"];
        string witnessPhone = Request.Form["witnessPhone"];

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

        //ListBox Selection
        switch (gender)
        {
            case "male":
                gender = "1";
                break;
            case "female":
                gender = "2";
                break;
        }
        pdfFormFields.SetField("gender", gender);

        switch (status)
        {
            case "student":
                status = "1";
                break;
            case "faculty":
                status = "2";
                break;
            case "staff":
                status = "3";
                break;
            case "guest":
                status = "4";
                break;
            case "sdfs":
                status = "5";
                break;
            case "otherStatus":
                status = "6";
                pdfFormFields.SetField("otherStatus", otherStatus);
                break;
        }
        pdfFormFields.SetField("status", status);
        
        switch (activity)
        {
            case "Intramurals":
                activity = "1";
                break;
            case "informalRec":
                activity = "2";            
                break;
            case "kidcamp":
                activity = "3";
                break;
            case "sportclubs":
                activity = "4";
                break;
            case "groupfit":
                activity = "5";
                break;
            case "swimrental":
                activity = "6";
                break;
            case "special":
                activity = "7";
                pdfFormFields.SetField("specialEvent", specialEvent);
                break;
            case "other":
                activity = "8";
                pdfFormFields.SetField("otherActivity", otherActivity);
                break;            
        }
        pdfFormFields.SetField("activity", activity);
                
        switch (location)
        {
            case "assessmentlab":
                location = "1";
                break;
            case "field":
                location = "2";
                break;
            case "goldgym":
                location = "3";
                break;
            case "greengym":
                location = "4";
                break;
            case "indoortrack":
                location = "5";
                break;
            case "locker":
                location = "6";
                break;
            case "macgym":
                location = "7";
                break;
            case "maroongym":
                location = "8";
                break;
            case "outdoortrack":
                location = "9";
                break;
            case "pe":
                location = "10";
                break;
            case "pool":
                location = "11";
                break;
            case "racquetball":
                location = "12";
                break;
            case "smallgym":
                location = "13";
                break;
            case "threebay":
                location = "14";
                break;
            case "twobay":
                location = "15";
                break;
            case "loft":
                location = "16";
                break;
            case "weightroom":
                location = "17";
                break;
            case "wellness":
                location = "18";
                break;
            case "otherLocation":
                location = "19";                
                pdfFormFields.SetField("otherLocation", otherLocation);
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
                pdfFormFields.SetField("otherAction", actionTaken);
                break;
        }
        pdfFormFields.SetField("actionTaken", actionTaken);

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
                pdfFormFields.SetField("otherType", type);
                break;
        }
        pdfFormFields.SetField("injuryType", type);
        
        //Checkbox Selection NOT COMPLETED
        //Left/Right/Center NOT COMPLETED
        //if (lrc == "2")
        //{
        //    pdfFormFields.SetField("right", "1");
        //}
        
        
        //pdfFormFields.SetField("injuryLocation", injuryLocation);
        

        // Closing Part
        pdfStamper.FormFlattening = false;

        pdfStamper.Close();
    }
}