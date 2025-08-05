<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckoutPage.aspx.cs" Inherits="GadgetHub.Web.CheckoutPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout - Gadget Hub</title>
    <style>
        .order-summary { width: 60%; margin: auto; border: 1px solid #ccc; padding: 20px; }
        .product-item { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #eee; }
        .total { font-weight: bold; font-size: 1.2em; text-align: right; margin-top: 20px; }
        .checkout-btn { display: block; margin: 20px auto; padding: 10px 20px; font-size: 1.1em; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="order-summary">
            <h2>Order Summary</h2>
            <asp:Repeater ID="rptOrderItems" runat="server">
                <ItemTemplate>
                    <div class="product-item">
                        <div><%# Eval("ProductName") %> (x<%# Eval("Qty") %>)</div>
                        <div>LKR <%# Convert.ToInt32(Eval("Price")) * Convert.ToInt32(Eval("Qty")) %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="total">
                Total: LKR <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
            </div>
            <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="checkout-btn" OnClick="btnPlaceOrder_Click" />
        </div>
    </form>
</body>
</html>

