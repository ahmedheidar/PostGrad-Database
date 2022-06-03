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
    public partial class AddGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int thesisSerialNo = Int16.Parse(SerialNo.Text);
            String defensedate1 = Calendar2.SelectedDate.ToShortDateString();
            float defenseGrade = float.Parse(Grade.Text);
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addGradeProc = new SqlCommand("addDefenseGrade", conn);
            addGradeProc.CommandType = CommandType.StoredProcedure;
            addGradeProc.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesisSerialNo));
            addGradeProc.Parameters.Add(new SqlParameter("@DefenseDate", defensedate1));
            addGradeProc.Parameters.Add(new SqlParameter("@grade", defenseGrade));


            SqlCommand checkDefense = new SqlCommand("CheckDefense", conn);
            checkDefense.CommandType = CommandType.StoredProcedure;
            checkDefense.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesisSerialNo));
            checkDefense.Parameters.Add(new SqlParameter("@DefenseDate", defensedate1));
            SqlParameter success = checkDefense.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            checkDefense.ExecuteNonQuery();
            conn.Close();



            if (success.Value.ToString() == "1")
            {
                conn.Open();
                addGradeProc.ExecuteNonQuery();
                conn.Close();
                Response.Write("Grade has been Added Successully.");
            }
            else if (success.Value.ToString() == "0")
            {
                Response.Write("Invalid Serial Number Or Date. Please Try Again!");
            }

        }
    }
}