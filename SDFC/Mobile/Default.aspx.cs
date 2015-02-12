using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mobile_Default : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        //check if user has not logged in. 
        if (!LoggedIn())
        {
            Response.Redirect("Login.aspx"); //redirect
            return; //stop further execution
        }

        if (!this.IsPostBack)
        {            
            this.Master.Title = "select a form";
            welcomeLabel.Text = string.Format("Welcome, {0}!", (string)Session["Username"]);
        }
        else
        {

        }
    }

    protected void Page_Unload(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// Checks for username stored in session. If exists, the user has logged in.
    /// </summary>
    /// <returns>Log in status for user</returns>
    private bool LoggedIn()
    {
        return (Session["Username"] != null);
    }
}