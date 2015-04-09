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

        }
    }
}