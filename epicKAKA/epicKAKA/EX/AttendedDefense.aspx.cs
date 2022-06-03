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
    public partial class AttendedDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = (int)Session["user"];
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand examinerAttendedDefenseProc = new SqlCommand("examinerAttendedDefense", conn);
            examinerAttendedDefenseProc.CommandType = CommandType.StoredProcedure;
            examinerAttendedDefenseProc.Parameters.Add(new SqlParameter("@id", id));
            conn.Open();

            Table myTable = table;


            SqlDataReader rdr = examinerAttendedDefenseProc.ExecuteReader();

            string[] attributes = { "THESIS_TITLE", "SUPERVISOR_NAME", "STUDENT_NAME" };

            FillTable(myTable, rdr, attributes);


            conn.Close();
            form1.Controls.Add(myTable);
        }
    }
}