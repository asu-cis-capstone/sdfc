using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace exportToExcel
{
    public partial class Default : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlCommand cmd;        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindgrid();
            }
        }

        private void connection()
        {
            con = new MySqlConnection("SERVER=cis440.cj1rt5lolr7p.us-west-2.rds.amazonaws.com;DATABASE=cis440db;UID=capstone;PASSWORD=cis440clark");
            con.Open();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }

        private void Bindgrid()
        {
            connection();
            string query = "SELECT victimName, asuID, locationName, treatmentProvider, address, phone, age, description FROM injury inner join location on injury.locationID = location.locationID;";
            cmd = new MySqlCommand(query, con);
            
            //DataReader codes
            MySqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;

            //DataSet codes
            //DataSet ds = new DataSet();
            //MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            //da.Fill(ds);
            //GridView1.DataSource = dt;

            GridView1.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ExportGridToCSV();
        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Test" + DateTime.Now + ".xls";
            StringWriter writer = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(writer);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmlWriter);
            Response.Write(writer.ToString());
            Response.End();
        }

        private void ExportGridToCSV()
        {
            Response.Clear();
            Response.Buffer = true;
            string FileName = "Test" + DateTime.Now + ".csv";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            Response.Charset = "";
            Response.ContentType = "application/text";
            GridView1.AllowPaging = false;            

            StringBuilder st = new StringBuilder();
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                st.Append(GridView1.Columns[i].HeaderText + ",");
            }

            st.Append("\r\n");
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                for (int k = 0; k < GridView1.Columns.Count; k++)
                {
                    st.Append(GridView1.Rows[i].Cells[k].Text + ".");
                }
                st.Append("\r\n");
            }

            Response.Output.Write(st.ToString());
            Response.Flush();
            Response.End();
        }

    }
}