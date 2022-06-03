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
    public partial class AddComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int thesisSerialNo = Int16.Parse(SerialNo.Text);
            String date = Calendar1.SelectedDate.ToShortDateString();
            String defenseComment = Comment.Text;
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addCommentProc = new SqlCommand("addCommentsGrade", conn);
            addCommentProc.CommandType = CommandType.StoredProcedure;
            addCommentProc.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesisSerialNo));
            addCommentProc.Parameters.Add(new SqlParameter("@DefenseDate", date));
            addCommentProc.Parameters.Add(new SqlParameter("@comments", defenseComment));
           

            SqlCommand checkDefense = new SqlCommand("CheckDefense", conn);
            checkDefense.CommandType = CommandType.StoredProcedure;
            checkDefense.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesisSerialNo));
            checkDefense.Parameters.Add(new SqlParameter("@DefenseDate", date));
            SqlParameter success = checkDefense.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            checkDefense.ExecuteNonQuery();
            conn.Close();



            if(success.Value.ToString() == "1")
            {
                conn.Open();
                addCommentProc.ExecuteNonQuery();
                conn.Close();
                Response.Write("Comment has been Added Successully.");
            }
            else if(success.Value.ToString() == "0")
            {
                Response.Write("Invalid Serial Number Or Date. Please Try Again!");
            }

        }
    }
}