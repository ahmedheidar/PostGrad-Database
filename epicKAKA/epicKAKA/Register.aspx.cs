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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signupStudent(object sender, EventArgs e)
        {
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);

            String firstname = firstname1.Text;
            String lastname = lastname1.Text;
            String pass = password1.Text;
            String faculty = faculty1.Text;
            String email = email1.Text;
            String address = address1.Text;
            int gucianbit = 0;
            if (GUCIAN.Checked)
            {
                gucianbit = 1;
            }

            SqlCommand register1proc = new SqlCommand("studentRegister", conn);
            register1proc.CommandType = CommandType.StoredProcedure;
            register1proc.Parameters.Add(new SqlParameter("@first_name", firstname));
            register1proc.Parameters.Add(new SqlParameter("@last_name", lastname));
            register1proc.Parameters.Add(new SqlParameter("@password", pass));
            register1proc.Parameters.Add(new SqlParameter("@faculty", faculty));
            register1proc.Parameters.Add(new SqlParameter("@email", email));
            register1proc.Parameters.Add(new SqlParameter("@address", address));
            register1proc.Parameters.Add(new SqlParameter("@Gucian", gucianbit));

            conn.Open();
            register1proc.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }

        protected void signupSupervisor(object sender, EventArgs e)
        {
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);

            String firstname = firstname2.Text;
            String lastname = lastname2.Text;
            String pass = password2.Text;
            String faculty = faculty2.Text;
            String email = email2.Text;

            SqlCommand register2proc = new SqlCommand("supervisorRegister", conn);
            register2proc.CommandType = CommandType.StoredProcedure;
            register2proc.Parameters.Add(new SqlParameter("@first_name", firstname));
            register2proc.Parameters.Add(new SqlParameter("@last_name", lastname));
            register2proc.Parameters.Add(new SqlParameter("@password", pass));
            register2proc.Parameters.Add(new SqlParameter("@faculty", faculty));
            register2proc.Parameters.Add(new SqlParameter("@email", email));

            conn.Open();
            register2proc.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");

        }
        protected void signupExaminer(object sender, EventArgs e)
        {
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);

            String name = name3.Text;
            String pass = password3.Text;
            String email = email3.Text;
            String fieldOfWork = fieldOfWork3.Text;

            int egyptianbit = 0;
            if (Egyptian.Checked)
            {
                egyptianbit = 1;
            }


            SqlCommand register3proc = new SqlCommand("examinerRegister", conn);
            register3proc.CommandType = CommandType.StoredProcedure;
            register3proc.Parameters.Add(new SqlParameter("@ExaminerName", name));
            register3proc.Parameters.Add(new SqlParameter("@password", pass));
            register3proc.Parameters.Add(new SqlParameter("@email", email));
            register3proc.Parameters.Add(new SqlParameter("@fieldOfWork", fieldOfWork));
            register3proc.Parameters.Add(new SqlParameter("@National", egyptianbit));

            conn.Open();
            register3proc.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");

        }
    }
}