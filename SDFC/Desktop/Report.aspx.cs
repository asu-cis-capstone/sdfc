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

namespace SDFC.Desktop
{
    public partial class WebForm1 : System.Web.UI.Page
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

        }

        protected void report_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime startDate = Convert.ToDateTime(txtStartDate.Value);
                DateTime endDate = Convert.ToDateTime(txtEndDate.Value);

                int[] activites = new int[8];
                foreach (ListItem a in multActivity.Items)
                {
                    if (a.Selected)
	                {
                        activites[(Convert.ToInt16(a.Value)-1)] = Convert.ToInt16(a.Value);
	                }
                }

                int[] location = new int[20];
                foreach (ListItem a in multLocation.Items)
                {
                    if (a.Selected)
                    {
                        location[(Convert.ToInt16(a.Value)-1)] = Convert.ToInt16(a.Value);
                    }
                }

                string sort = rdoSort.SelectedValue;


                //Create MySQL connection
                MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");

                //Open Connection
                conn.Open();

                //Declare variables
                DataTable dt = new DataTable();

                //Call stored procedure with stored procedure name and connection
                MySqlCommand cmd = new MySqlCommand("spReportAllParms", conn);
                //SELECT top 10 FROM reports WHERE manager='this manager' ORDER BY date DESC

                //Set command as a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@startdate", startDate);
                cmd.Parameters.AddWithValue("@enddate", endDate);
                cmd.Parameters.AddWithValue("@activity1", activites[0]);
                cmd.Parameters.AddWithValue("@activity2", activites[1]);
                cmd.Parameters.AddWithValue("@activity3", activites[2]);
                cmd.Parameters.AddWithValue("@activity4", activites[3]);
                cmd.Parameters.AddWithValue("@activity5", activites[4]);
                cmd.Parameters.AddWithValue("@activity6", activites[5]);
                cmd.Parameters.AddWithValue("@activity7", activites[6]);
                cmd.Parameters.AddWithValue("@activity8", activites[7]);

                cmd.Parameters.AddWithValue("@location1", location[0]);
                cmd.Parameters.AddWithValue("@location2", location[1]);
                cmd.Parameters.AddWithValue("@location3", location[2]);
                cmd.Parameters.AddWithValue("@location4", location[3]);
                cmd.Parameters.AddWithValue("@location5", location[4]);
                cmd.Parameters.AddWithValue("@location6", location[5]);
                cmd.Parameters.AddWithValue("@location7", location[6]);
                cmd.Parameters.AddWithValue("@location8", location[7]);
                cmd.Parameters.AddWithValue("@location9", location[8]);
                cmd.Parameters.AddWithValue("@location10", location[9]);
                cmd.Parameters.AddWithValue("@location11", location[10]);
                cmd.Parameters.AddWithValue("@location12", location[11]);
                cmd.Parameters.AddWithValue("@location13", location[12]);
                cmd.Parameters.AddWithValue("@location14", location[13]);
                cmd.Parameters.AddWithValue("@location15", location[14]);
                cmd.Parameters.AddWithValue("@location16", location[15]);
                cmd.Parameters.AddWithValue("@location17", location[16]);
                cmd.Parameters.AddWithValue("@location18", location[17]);
                cmd.Parameters.AddWithValue("@location19", location[18]);
                cmd.Parameters.AddWithValue("@location20", location[19]);

                cmd.Parameters.AddWithValue("@sort", sort);

                //Set data adapter and fill the data table
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(dt);

                //Close the connection
                conn.Close();

                //If SQL return rows, bind to repeater
                if (dt.Rows.Count > 0)
                {
                    gvReportResults.DataSource = dt;
                    gvReportResults.DataBind();
                }
                else
                {
                    //display no recent
                }


            }
            catch (Exception)
            {
                
                throw;
            }
        }

    }
}