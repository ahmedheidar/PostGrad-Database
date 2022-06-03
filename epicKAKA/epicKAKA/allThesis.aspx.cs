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
    public partial class allThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand allThesesproc = new SqlCommand("AdminViewAllTheses", conn);
            allThesesproc.CommandType = CommandType.StoredProcedure;
            conn.Open();


            HtmlGenericControl div = new HtmlGenericControl("div");
            Table myTable = new Table();



            SqlDataReader rdr = allThesesproc.ExecuteReader();
            string[] attributes = { "serialNumber", "field", "type", "title", "startDate","endDate","defenseDate","years","grade","payment_id","noOfExtensions" };
            FillTable(myTable, rdr, attributes);


            conn.Close();
            div.Controls.Add(myTable);
            form1.Controls.Add(div);
        }
    }
}