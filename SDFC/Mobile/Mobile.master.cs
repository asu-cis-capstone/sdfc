using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mobile_Mobile : System.Web.UI.MasterPage
{
    private bool hasSigPad;
    
    /// <summary>
    /// Title of webpage
    /// </summary>
    public string Title
    {
        get
        {
            //return literal value within page title
            return PageTitle.Text;
        }
        set
        {
            //set literal value within page title
            PageTitle.Text = value;
            PageTitleDisplay.Text = value;
        }
    }
    
    /// <summary>
    /// Inserts meta tag into master page
    /// </summary>
    public string Metas
    {
        set
        {
            metaTags.Text = value;
        }
    }
    /// <summary>
    /// Used to set css class of form to enable sigpad
    /// </summary>
    public bool HasSigPad
    {
        get
        {
            return hasSigPad;
        }
        set
        {
            //set new value
            hasSigPad = value;

            //set css class accordingly
            if (hasSigPad)
                myForm.Attributes.Add("class", "sigPad");
            else
                myForm.Attributes.Remove("class");
                
        }
    }

    //used to show or hide the logout button
    public bool ShowLogout
    {
        set
        {
            LogoutButton.Visible = value;
        }
        get
        {
            return LogoutButton.Visible;
        }
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        //retrieve the user agent string
        string userAgent = Request.UserAgent.ToString().ToLower();

        //perform a variety of tests to ensure user is mobile
        if (!Request.Browser.IsMobileDevice ||
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
            //commented out for testing
            //Response.Redirect("../Desktop/Login.aspx");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Logout_Click(object sender, ImageClickEventArgs e)
    {
        //log the user out
        Session["Username"] = null;

        //redirect them to the login page
        Response.Redirect("Login.aspx");
    }
}
