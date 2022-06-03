using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static epicKAKA.Util;

namespace epicKAKA
{
    public partial class allSup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                        String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand allSupsproc = new SqlCommand("AdminListSup", conn);
            allSupsproc.CommandType = CommandType.StoredProcedure;
            conn.Open();


            HtmlGenericControl div = new HtmlGenericControl("div");
            Table myTable = new Table();



            SqlDataReader rdr = allSupsproc.ExecuteReader();
            string[] attributes = { "id", "email", "password", "name", "faculty" };
            FillTable(myTable, rdr, attributes);


            conn.Close();
            div.Controls.Add(myTable);
            form2.Controls.Add(div);
        }
        protected void allSupervisors_Click(object sender, EventArgs e)
        {


        }

    }
}