using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDFC.Mobile
{
    public partial class Confirmation : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user has not logged in. 
            if (!LoggedIn())
            {
                Response.Redirect("Login.aspx"); //redirect
                return; //stop further execution
            }
            Master.Title = "thanks";
            //add meta tag to master page to redirect in 4 seconds
            Master.Metas = "<meta http-equiv=\"refresh\" content=\"4;URL=Login.aspx\"/>";
        }
        /// <summary>
        /// Checks for username stored in session. If exists; the user has logged in.
        /// </summary>
        /// <returns>Log in status for user</returns>
        private bool LoggedIn()
        {
            return (Session["Username"] != null);
        }
    }
}