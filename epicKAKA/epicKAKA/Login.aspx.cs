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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);

            String email = username.Text;
            String pass = password.Text;


            SqlCommand IDproc = new SqlCommand("getIDbyEmail", conn);
            IDproc.CommandType = CommandType.StoredProcedure;
            IDproc.Parameters.Add(new SqlParameter("@email", email));
            SqlParameter id = IDproc.Parameters.Add("@id", SqlDbType.Int);
            id.Direction = ParameterDirection.Output;

            conn.Open();
            IDproc.ExecuteNonQuery();

            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@id", id.Value));
            loginproc.Parameters.Add(new SqlParameter("@password",pass));
            SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            
            loginproc.ExecuteNonQuery();
        
            Response.Write(id.Value);
            Response.Write(pass);
         
          
            
                if (success.Value.ToString() == "1")
                {
                SqlCommand profileproc = new SqlCommand("checkId", conn);
                profileproc.CommandType = CommandType.StoredProcedure;
                profileproc.Parameters.Add(new SqlParameter("@id", id.Value));
                SqlParameter pro = profileproc.Parameters.Add("@profile", SqlDbType.Int);
                pro.Direction = ParameterDirection.Output;
                profileproc.ExecuteNonQuery();
                Session["user"] = id.Value;
                Session["password"] = pass;
               if (pro.Value.ToString() == "1")
               {
                   Response.Redirect("GucianProfile.aspx");
               }
                else if(pro.Value.ToString() == "2")
               {
                  Response.Redirect("NonGucianProfile.aspx");
               }
                if (pro.Value.ToString() == "3")
                {
                    Response.Redirect("SupervisorProfile.aspx");
                }
                else if (pro.Value.ToString() == "4")
                {
                    Response.Redirect("Examiner.aspx");
                }
                else if (pro.Value.ToString() == "0")
                {
                    Response.Redirect("Admin.aspx");
                }

                else
                {
                    Response.Write("Error");
                }
             
                conn.Close();
            }

            else {
                Response.Write("Error");
            }

        }
    }
}