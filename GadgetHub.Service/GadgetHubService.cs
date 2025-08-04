using System.Data.SqlClient;

namespace GadgetHub.Service
{
    public class GadgetHubService : IGadgetHubService
    {
        public bool RegisterUser(string firstName, string lastName, string phoneNumber, string username, string password, string email, string role)
        {
            // Simple DB insert logic (this will be refactored later to DAL)
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\SOC\\GadgetHub\\GadgetHubDB.mdf;Integrated Security=True;Connect Timeout=30;Encrypt=False";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (FirstName, LastName, PhoneNumber, Username, Password, Email, Role) VALUES (@FirstName, @LastName, @PhoneNumber, @Username, @Password, @Email, @Role)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Role", role);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
        }

        public string Login(string email, string password)
        {
            // Simple DB select logic (this will be refactored later to DAL)
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\SOC\\GadgetHub\\GadgetHubDB.mdf;Integrated Security=True;Connect Timeout=30;Encrypt=False";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Role FROM Users WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                object result = cmd.ExecuteScalar();
                return result != null ? result.ToString() : null;
            }
        }
    }
}