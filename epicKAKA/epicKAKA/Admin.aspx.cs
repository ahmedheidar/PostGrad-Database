using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace epicKAKA
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void allSupervisors_Click(object sender, EventArgs e)
        {
            Response.Redirect("allSup.aspx");
        }

        protected void allThesis_Click(object sender, EventArgs e)
        {
            Response.Redirect("allThesis.aspx");
        }

        protected void onGoingThesis_Click(object sender, EventArgs e)
        {
            //Response.Redirect("onGoingTheses.aspx");
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand proc = new SqlCommand("AdminViewOnGoingTheses", conn);
            proc.CommandType = CommandType.StoredProcedure;
            SqlParameter count = proc.Parameters.Add("@thesesCount", SqlDbType.Int);
            count.Direction = ParameterDirection.Output;
            conn.Open();
            proc.ExecuteNonQuery();
            String s = count.Value.ToString();
            Label1.Text = s;
            
        }

        protected void IssueThesisP_Click(object sender, EventArgs e)
        {
            Response.Redirect("issueThesis.aspx");
        }
    }
}