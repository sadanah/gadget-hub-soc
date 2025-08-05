<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="GadgetHub.Web.CartPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Cart - Gadget Hub</title>
    <style>
        .cart-container { max-width: 800px; margin: auto; padding: 20px; }
        .cart-item { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #ddd; padding: 10px 0; }
        .cart-details { flex-grow: 1; margin-left: 20px; }
        .cart-actions button { margin-left: 10px; }
        .button-group {display:flex; flex-direction:row; justify-content:space-between;}
        .checkout-btn,.continue-shopping-btn { margin-top: 20px; color: white; padding: 10px 20px; border: none; cursor: pointer; }
        .checkout-btn {background: #4CAF50;}
        .continue-shopping-btn {background: #666;}
        .empty-cart { text-align: center; font-size: 1.2em; color: #666; padding: 40px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cart-container">
            <h1>Your Shopping Cart</h1>

            <asp:Repeater ID="rptCartItems" runat="server">
                <ItemTemplate>
                    <div class="cart-item">
                        <img src='<%# Eval("Image") %>' alt='<%# Eval("ProductName") %>' style="width:100px; height:100px; object-fit:contain;" />
                        <div class="cart-details">
                            <h3><%# Eval("ProductName") %></h3>
                            <p>Price: LKR <%# Eval("Price") %></p>
                            <p>Quantity: <%# Eval("Qty") %></p>
                        </div>
                        <div class="cart-actions">
                            <asp:Button ID="btnIncreaseQty" runat="server" Text="+" CommandArgument='<%# Eval("ProductId") %>' OnClick="btnIncreaseQty_Click" />
                            <asp:Button ID="btnDecreaseQty" runat="server" Text="-" CommandArgument='<%# Eval("ProductId") %>' OnClick="btnDecreaseQty_Click" />
                            <asp:Button ID="btnRemoveItem" runat="server" Text="Remove" CommandArgument='<%# Eval("ProductId") %>' OnClick="btnRemoveItem_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                <div class="empty-cart">Your cart is empty!</div>
            </asp:Panel>

            <div class="button-group">
                <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="continue-shopping-btn" OnClick="btnContinueShopping_Click" />
                <asp:Button ID="btnProceedCheckout" runat="server" Text="Proceed to Checkout" CssClass="checkout-btn" OnClick="btnProceedCheckout_Click" />
            </div>
        </div>
    </form>
</body>
</html>
