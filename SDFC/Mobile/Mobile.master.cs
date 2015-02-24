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
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
