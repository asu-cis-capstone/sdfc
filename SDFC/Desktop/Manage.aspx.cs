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
    }
}