﻿using System;
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //Create MySQL connection
                MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=");

                //Open Connection
                conn.Open();

                //Declare variables
                DataTable dt = new DataTable();
                string asurite = tbxUsername.Text;
                string password = tbxPassword.Text;

                //Call stored procedure with stored procedure name and connection
                MySqlCommand cmd = new MySqlCommand("spGetUserLogin", conn);

                //Set command as a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@asuriteLog", asurite);

                //Set data adapter and fill the data table
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(dt);

                string pw = dt.Rows[0][0].ToString();

                //Close the connection
                conn.Close();

                //Test password match
                if (password.Equals(dt.Rows[0][0].ToString()))
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    
                }

            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}