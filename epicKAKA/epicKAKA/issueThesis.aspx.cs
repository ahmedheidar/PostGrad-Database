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
    public partial class issueThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connction
            SqlConnection conn = new SqlConnection(connStr);

            int serial1 = Int16.Parse(serial.Text);
            decimal amount1 = Decimal.Parse(amount.Text);
            int no1 = Int16.Parse(no.Text);
            decimal fund1 = Decimal.Parse(fund.Text);


            SqlCommand proc = new SqlCommand("AdminIssueThesisPayment", conn);
            proc.CommandType = CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@ThesisSerialNo", serial1));
            proc.Parameters.Add(new SqlParameter("@amount", amount1));
            proc.Parameters.Add(new SqlParameter("@noOfInstallments", no1));
            proc.Parameters.Add(new SqlParameter("@fundPercentage", fund1));
            SqlParameter flag = proc.Parameters.Add("@flag", SqlDbType.Int);
            flag.Direction = ParameterDirection.Output;

            conn.Open();
            proc.ExecuteNonQuery();

            if(flag.Value.ToString() == "0")
            {
                Response.Write("Incorrect Serial Number");
            }
            else if(flag.Value.ToString() == "2")
            {
                Response.Write("Thesis Payment Already Exist");
            }
            else
            {
                Response.Write("Thesis Payment Issued Successfully!");
            }

        }
    }
}