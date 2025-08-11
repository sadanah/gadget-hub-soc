<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardCustomer.aspx.cs" Inherits="GadgetHub.Web.GHCustomer.DashboardCustomer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Orders</title>
    <style>
        .order-items {
            margin-left: 20px;
            font-size: 0.9em;
            border-collapse: collapse;
        }
        .order-items th, .order-items td {
            border: 1px solid #ccc;
            padding: 5px 8px;
        }
        .order-items th {
            background-color: #f7f7f7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>My Orders</h2>
        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" EmptyDataText="No orders found" OnRowDataBound="gvOrders_RowDataBound">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Order ID" />
                <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
                <asp:BoundField DataField="DeliveryAddress" HeaderText="Delivery Address" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                <asp:TemplateField HeaderText="Items">
                    <ItemTemplate>
                        <asp:PlaceHolder ID="phOrderItems" runat="server"></asp:PlaceHolder>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
