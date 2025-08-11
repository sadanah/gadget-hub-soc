<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="GadgetHub.Web.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gadget Hub - Home</title>
    <style>
        .product-card { border: 1px solid #ccc; padding: 10px; cursor: pointer; }
        .product-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 20px; }
        header { display: flex; justify-content: space-between; align-items: center; padding: 10px 20px; background: #f0f0f0; }
        nav { width: 250px; padding: 20px; border-right: 1px solid #ddd; }
        main { flex-grow: 1; padding: 20px; }
        .layout { display: flex; min-height: 80vh; }

        #searchBar { flex-grow: 1; display: flex; justify-content: center; }
        #cartArea { display: flex; align-items: center; gap: 15px; }

        .cart-icon { position: relative; cursor: pointer; }
        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
        }

        .button-link {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
        }
        .button-link:hover {
            cursor: pointer; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="companyName" style="font-weight:bold; font-size:1.5em;">Gadget Hub</div>

            <div id="searchBar">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search products..." />
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </div>

            <div id="cartArea">
                <div class="cart-icon" onclick="location.href='CartPage.aspx'">
                    🛒
                    <span id="cartCount" class="cart-count"><%= CartCount %></span>
                </div>
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" CssClass="button-link" />
                <asp:Button ID="btnDashboard" runat="server" Text="Dashboard" OnClick="btnDashboard_Click" CssClass="button-link" />
            </div>
        </header>
        <div class="layout">
            <nav>
                <h3>Filter by Category</h3>
                <asp:Repeater ID="rptCategories" runat="server">
                    <ItemTemplate>
                        <div>
                            <asp:CheckBox ID="chkCategory" runat="server" Text='<%# Eval("Name") %>' />
                            <asp:HiddenField ID="hfCategoryId" runat="server" Value='<%# Eval("Id") %>' />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Button ID="btnFilter" runat="server" Text="Apply Filter" OnClick="btnFilter_Click" />
            </nav>

            <main>
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="product-card">
                            <a href='<%# "ProductDetails.aspx?id=" + Eval("Id") %>' style="text-decoration:none; color:inherit;">
                                <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' style="width:100%; height:150px; object-fit:contain;" />
                                <h4><%# Eval("Name") %></h4>
                                <p>Price: LKR <%# Eval("Price") %></p>
                            </a>
                            <asp:Button ID="btnAddToCart" runat="server" CommandArgument='<%# Eval("Id") %>' Text="Add to Cart" OnClick="btnAddToCart_Click" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </main>
        </div>
    </form>
</body>
</html>
