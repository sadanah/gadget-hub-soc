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
        protected void Page_Load(object sender, EventArgs e)
        {
            litRegisterText.Text = "Don't have an account? ";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            GadgetHubServiceClient client = new GadgetHubServiceClient();
            var user = client.Login(txtEmail.Text, txtPassword.Text);

            if (user != null)
            {
                Session["UserId"] = user.Id;
                Session["Role"] = user.Role;

                lblStatus.Text = "Login successful!";

                // Redirect to Home Page
                Response.Redirect("GHCustomer/HomePage.aspx");
            }
            else
            {
                lblStatus.Text = "Invalid credentials!";
            }
        }
    }
}