using GadgetHub.Web.GHServiceRef;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GadgetHub.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            GadgetHubServiceClient client = new GadgetHubServiceClient();
            string userRole = client.Login(
                txtEmail.Text,
                txtPassword.Text);

            if (userRole=="admin")
                lblStatus.Text = "Admin Login";
            else if (userRole=="staff")
                lblStatus.Text = "Customer Login";
            else if (userRole=="customer")
                lblStatus.Text = "Customer Login";
            else
                lblStatus.Text = "Login failed! Please check your credentials.";
        }
    }
}