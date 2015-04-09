using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SDFC.Models;

namespace SDFC.Mobile
{
    public partial class Login : System.Web.UI.Page
    {
        private DB_Connector myConnector;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user has logged in. 
            if (LoggedIn())
            {
                Response.Redirect("Default.aspx"); //redirect
                return; //stop further execution
            }

            if (!this.IsPostBack)
            {
                //initialize connector
                myConnector = new DB_Connector();

                //set page title
                this.Master.Title = "log In";
                //hide logout button on master
                this.Master.ShowLogout = false;
            }
            else
            {
                myConnector = (DB_Connector)Session["myConnector"];
            }
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            Session["myConnector"] = myConnector;
        }

        /// <summary>
        /// Checks for username stored in session. If exists, the user has logged in.
        /// </summary>
        /// <returns>Log in status for user</returns>
        private bool LoggedIn()
        {
            return (Session["Username"] != null);
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string asuID = "";
            if (myConnector.LogIn(txtusername.Text, txtpassword.Text, ref asuID))
            {
                //store credentials in session
                Session["Username"] = txtusername.Text; 
                Session["Password"] = txtpassword.Text;
                Session["AsuID"] = asuID;

                //send to login
                Response.Redirect("Default.aspx");
            }
            else
            {
                //to do: add error messages for invalid credentials
            }
        }
    }
}