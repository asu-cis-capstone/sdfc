using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mobile_Mobile : System.Web.UI.MasterPage
{
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
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
