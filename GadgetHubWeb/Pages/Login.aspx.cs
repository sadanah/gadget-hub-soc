using System;
using System.Web.UI;
using GadgetHubWeb.GHServiceRef; // This is your service reference namespace

namespace GadgetHubWeb.Pages
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can leave this empty for now
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            GadgetHubService1SoapClient client = new GadgetHubService1SoapClient();

            bool isAuthenticated = client.Login(email, password);

            if (isAuthenticated)
            {
                // Redirect to dashboard or home
                Response.Redirect("~/Pages/Dashboard.aspx");
            }
            else
            {
                lblStatus.Text = "Invalid email or password.";
            }
        }
    }
}
