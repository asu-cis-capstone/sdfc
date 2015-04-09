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
            MySqlCommand cmd = new MySqlCommand();
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