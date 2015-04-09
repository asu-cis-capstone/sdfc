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

public partial class Desktop_Desktop : System.Web.UI.MasterPage
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

    protected void btnSearchByTxt_Click(object sender, EventArgs e)
    {
        string search = "";//txtSearch.Text;
        //Create MySQL connection
        MySqlConnection conn = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");

        //Open Connection
        conn.Open();

        //Declare variables
        DataTable dt = new DataTable();

        //Call stored procedure with stored procedure name and connection
        MySqlCommand cmd = new MySqlCommand("spGetUserLogin", conn);

        //Set command as a stored procedure
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@search", search);

        //Set data adapter and fill the data table
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        da.Fill(dt);

        //Close the connection
        conn.Close();

        //if (dt.Rows.Count > 0)
        //{
        //    string pw = dt.Rows[0][0].ToString();
        //    //Test password match
        //    if (password.Equals(dt.Rows[0][0].ToString()))
        //    {
        //        Response.Redirect("Home.aspx");
        //    }
        //}
        //else
        //{
        //    lblLoginError.Visible = true;
        //    main.Style.Add("top", "600px");
        //}
    }

    protected void signOut_Click(object sender, EventArgs e)
    {
        Session["Username"] = null;
        Response.Redirect("Login.aspx");
    }
}
