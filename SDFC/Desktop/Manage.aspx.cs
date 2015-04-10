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
    public partial class WebForm2 : System.Web.UI.Page
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

            try
            {
                //Create MySQL connection
                MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");

                //Open Connection
                conn.Open();

                //Declare variables
                DataTable dt = new DataTable();

                //Call stored procedure with stored procedure name and connection
                MySqlCommand cmd = new MySqlCommand("spSelectAllEmployee", conn);
                //SELECT top 10 FROM reports WHERE manager='this manager' ORDER BY date DESC

                //Set command as a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;
                string asuid = (string)Session["asuid"];
                cmd.Parameters.AddWithValue("@asuid", asuid);

                //Set data adapter and fill the data table
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(dt);

                //Close the connection
                conn.Close();

                //If SQL return rows, bind to repeater
                if (dt.Rows.Count > 0)
                {
                    rptrEmp.DataSource = dt;
                    rptrEmp.DataBind();
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

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                RepeaterItem item = (RepeaterItem)btn.NamingContainer;

                string asuID = ((TextBox)item.FindControl("txtAsuID")).Text;
                string asurite = ((TextBox)item.FindControl("txtAsurite")).Text;
                string password = ((TextBox)item.FindControl("txtPassword")).Text;

                string firstName = ((TextBox)item.FindControl("txtFirstName")).Text;
                string lastName = ((TextBox)item.FindControl("txtLastName")).Text;
                string position = ((TextBox)item.FindControl("txtPosition")).Text;

                string active = ((TextBox)item.FindControl("txtActive")).Text;
                string manager = ((TextBox)item.FindControl("txtManager")).Text;


                //Create MySQL connection
                MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");

                //Open Connection
                conn.Open();

                //Declare variables
                DataTable dt = new DataTable();

                //Call stored procedure with stored procedure name and connection
                MySqlCommand cmd = new MySqlCommand("spUpdateEmployee", conn);
                //SELECT top 10 FROM reports WHERE manager='this manager' ORDER BY date DESC

                //Set command as a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nasuID", asuID);
                cmd.Parameters.AddWithValue("@nasurite", asurite);
                cmd.Parameters.AddWithValue("@npassword", password);
                cmd.Parameters.AddWithValue("@nfirstName", firstName);
                cmd.Parameters.AddWithValue("@nlastName", lastName);
                cmd.Parameters.AddWithValue("@nposition", position);
                cmd.Parameters.AddWithValue("@nactive", active);
                cmd.Parameters.AddWithValue("@nmanager", manager);

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

            //e.Item.FindControl("txtAsuID");
        }
    }
}