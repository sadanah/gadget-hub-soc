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

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblStatus.Text = "Please enter both email and password.";
                return;
            }

            try
            {
                using (GadgetHubService1SoapClient client = new GadgetHubService1SoapClient())
                {
                    bool isAuthenticated = client.Login(email, password);

                    if (isAuthenticated)
                    {
                        Session["Email"] = email;
                        Response.Redirect("~/Pages/Dashboard.aspx");
                    }
                    else
                    {
                        lblStatus.Text = "Invalid email or password.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Service error: " + ex.Message;
            }
        }

    }
}
