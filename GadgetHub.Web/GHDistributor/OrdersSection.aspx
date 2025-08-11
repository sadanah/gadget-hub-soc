<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersSection.aspx.cs" Inherits="GadgetHub.Web.GHDistributor.OrdersSection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Distributor Orders</title>
    <style>
        table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f4f4f4; }
        .update-btn { padding: 5px 10px; background-color: #2980b9; color: white; border: none; cursor: pointer; }
        .update-btn:hover { background-color: #3498db; }
        .status-select { width: 120px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>My Orders</h2>
        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" OnRowCommand="gvOrders_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Order ID" />
                <asp:BoundField DataField="UserName" HeaderText="Customer" />
                <asp:BoundField DataField="Total" HeaderText="Total" />
                <asp:BoundField DataField="DeliveryAddress" HeaderText="Delivery Address" />
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-select">
                            <asp:ListItem>Received</asp:ListItem>
                            <asp:ListItem>Processing</asp:ListItem>
                            <asp:ListItem>Shipped</asp:ListItem>
                            <asp:ListItem>Delivered</asp:ListItem>
                            <asp:ListItem>Cancelled</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update Status">
                    <ItemTemplate>
                        <asp:Button ID="btnUpdateStatus" runat="server" Text="Update" CommandName="UpdateStatus" CommandArgument='<%# Eval("Id") %>' CssClass="update-btn" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="order-row" />
            <EmptyDataTemplate>No orders found.</EmptyDataTemplate>
        </asp:GridView>

        <asp:Panel ID="pnlOrderItems" runat="server" Visible="false">
            <h3>Order Items for Order ID: <asp:Label ID="lblSelectedOrderId" runat="server" /></h3>
            <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="Product ID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnCloseItems" runat="server" Text="Close" OnClick="btnCloseItems_Click" />
        </asp:Panel>
    </form>
</body>
</html>
