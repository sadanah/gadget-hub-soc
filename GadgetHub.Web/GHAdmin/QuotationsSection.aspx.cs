using GadgetHub.Web.GHServiceRef;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GadgetHub.Web.GHAdmin
{
    public partial class QuotationsSection : System.Web.UI.Page
    {
        protected string productOptionsHtml = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDistributors();
                LoadProductOptions();
                LoadQuotations();
            }
        }

        private void LoadDistributors()
        {
            var client = new GadgetHubServiceClient();
            var distributors = client.GetAllDistributors();
            ddlDistributors.DataSource = distributors;
            ddlDistributors.DataTextField = "Email";
            ddlDistributors.DataValueField = "Id";
            ddlDistributors.DataBind();
        }

        private void LoadProductOptions()
        {
            var client = new GadgetHubServiceClient();
            var products = client.GetAllProducts();

            foreach (var p in products)
            {
                productOptionsHtml += $"<option value='{p.Id}'>{p.Name}</option>";
            }
        }

        private void LoadQuotations()
        {
            var client = new GadgetHubServiceClient();
            var quotations = client.GetAllQuotations(); // returns enriched quotation list

            var data = quotations.Select(q => new
            {
                QuotationID = q.QuotationId,
                DistributorID = q.DistributorId,
                //DistributorEmail = q.DistributorEmail,
                Items = q.Items.Select(i => new
                {
                    ProductName = i.ProductName,
                    Quantity = i.Quantity,
                    Price = i.Price
                }).ToList(),
                Total = q.Items.Sum(i => i.Quantity * i.Price)
            }).ToList();

            rptQuotations.DataSource = data;
            rptQuotations.DataBind();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            int distributorId = int.Parse(ddlDistributors.SelectedValue);
            var items = new List<QuotationItemDTO>();

            string[] productIds = Request.Form.GetValues("productId");
            string[] quantities = Request.Form.GetValues("quantity");
            string[] prices = Request.Form.GetValues("price");

            for (int i = 0; i < productIds.Length; i++)
            {
                if (int.TryParse(productIds[i], out int productId) &&
                    int.TryParse(quantities[i], out int qty) &&
                    decimal.TryParse(prices[i], out decimal price))
                {
                    items.Add(new QuotationItemDTO
                    {
                        ProductId = productId,
                        Quantity = qty,
                        Price = price
                    });
                }
            }

            var client = new GadgetHubServiceClient();
            if (client.CreateQuotation(distributorId, items.ToArray()))
            {
                LoadQuotations(); // Refresh display
            }
        }

    }
}