using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static epicKAKA.Util;


namespace epicKAKA
{
    public partial class SearchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String keyword = (String) Session["keyword"];
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand searchProc = new SqlCommand("searchThesis", conn);
            searchProc.CommandType = CommandType.StoredProcedure;
            searchProc.Parameters.Add(new SqlParameter("@searchkey", keyword));
            conn.Open();

            Table myTable = Table1;


            SqlDataReader rdr = searchProc.ExecuteReader();

            string[] attributes = { "THESIS_TITLE", "SUPERVISOR_NAME", "STUDENT_NAME" };
            FillTable(myTable, rdr, attributes);


            conn.Close();
            form1.Controls.Add(myTable);
        }
    }
}