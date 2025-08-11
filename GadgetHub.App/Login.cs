using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using GadgetHub.App.GHServiceRef; // Adjust the namespace according to your service reference

namespace GadgetHub.App
{
    public partial class Login : Form
    {
        private GadgetHubServiceClient client = new GadgetHubServiceClient();

        public Login()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            // This method can be used for any additional actions when the label is clicked
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            // Your code here, or leave empty if not needed
        }

        private void btnLogin_Click_1(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            try
            {
                var user = client.Login(email, password);

                if (user != null)
                {
                    lblStatus.ForeColor = Color.Green;
                    lblStatus.Text = $"Welcome {user.FirstName} {user.LastName}, Role: {user.Role}";
                    // TODO: Proceed to main app window
                }
                else
                {
                    lblStatus.ForeColor = Color.Red;
                    lblStatus.Text = "Invalid email or password";
                }
            }
            catch (Exception ex)
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Error: " + ex.Message;
            }
        }
    }
}
