using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace GadgetHubService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class GadgetHubService1 : System.Web.Services.WebService
    {
        [WebMethod]
        public bool Login(string email, string password)
        {
            bool isAuthenticated = false;

            // Get the SQL Server connection string from Web.config
            string connStr = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Login WHERE email = @Email AND password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password); // plaintext for now

                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        isAuthenticated = (count == 1);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Database error: " + ex.Message);
                }
            }

            return isAuthenticated;
        }
    }
}
