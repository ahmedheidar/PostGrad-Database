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
    public partial class Examiner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EditProfile(object sender, EventArgs e)
        {
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);

            int id = (int) Session["user"];
            String name = newName.Text;
            String fieldOfwork = newField.Text;
            String email = newEmail.Text;
            String password = newPassword.Text;
            Boolean flag = false;

            if (name.Length > 0)
            {
                SqlCommand editExaminerNameProc = new SqlCommand("editExaminerName", conn);
                editExaminerNameProc.CommandType = CommandType.StoredProcedure;
                editExaminerNameProc.Parameters.Add(new SqlParameter("@id", id));
                editExaminerNameProc.Parameters.Add(new SqlParameter("@name", name));

                conn.Open();
                editExaminerNameProc.ExecuteNonQuery();
                conn.Close();
                flag = true;
            }
            if (fieldOfwork.Length > 0)
            {
                SqlCommand editExaminerFieldProc = new SqlCommand("editExaminerField", conn);
                editExaminerFieldProc.CommandType = CommandType.StoredProcedure;
                editExaminerFieldProc.Parameters.Add(new SqlParameter("@id", id));
                editExaminerFieldProc.Parameters.Add(new SqlParameter("@fieldOfWork", fieldOfwork));

                conn.Open();
                editExaminerFieldProc.ExecuteNonQuery();
                conn.Close();
                flag = true;

            }
            if (email.Length > 0)
            {
                SqlCommand editExaminerEmailProc = new SqlCommand("editExaminerEmail", conn);
                editExaminerEmailProc.CommandType = CommandType.StoredProcedure;
                editExaminerEmailProc.Parameters.Add(new SqlParameter("@id", id));
                editExaminerEmailProc.Parameters.Add(new SqlParameter("@email", fieldOfwork));

                conn.Open();
                editExaminerEmailProc.ExecuteNonQuery();
                conn.Close();
                flag = true;

            }
            if (password.Length > 0)
            {
                SqlCommand editExaminerPasswordProc = new SqlCommand("editExaminerPassword", conn);
                editExaminerPasswordProc.CommandType = CommandType.StoredProcedure;
                editExaminerPasswordProc.Parameters.Add(new SqlParameter("@id", id));
                editExaminerPasswordProc.Parameters.Add(new SqlParameter("@password", password));

                conn.Open();
                editExaminerPasswordProc.ExecuteNonQuery();
                conn.Close();
                flag = true;

            }
            if (flag)
            {
                Response.Write("Your Profile is Updated Successfully.");
            }
        }

        protected void AddComment(object sender, EventArgs e)
        {
            Response.Redirect("AddComment.aspx");
        }

        protected void AddGrade(object sender, EventArgs e)
        {
            Response.Redirect("AddGrade.aspx");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String keyword = Keyword.Text; 
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand searchProc = new SqlCommand("searchThesis", conn);
            searchProc.CommandType = CommandType.StoredProcedure;
            searchProc.Parameters.Add(new SqlParameter("@searchkey", keyword));
            conn.Open();

            HtmlGenericControl div = new HtmlGenericControl("div");
            Table myTable = new Table();



            SqlDataReader rdr = searchProc.ExecuteReader();
            string[] attributes = { "serialNumber", "field", "type", "title", "startDate", "endDate", "defenseDate", "years", "grade", "payment_id", "noOfExtensions" };
            FillTable(myTable, rdr, attributes);


            conn.Close();
            div.Controls.Add(myTable);
            form1.Controls.Add(div);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("AttendedDefense.aspx");
        }
    }
}