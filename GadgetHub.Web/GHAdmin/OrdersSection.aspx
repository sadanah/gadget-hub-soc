<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersSection.aspx.cs" Inherits="GadgetHub.Web.GHAdmin.OrdersSection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders Section</title>
    <style>
        /* Simple styling for nested order items */
        .order-items {
            margin-left: 20px;
            font-size: 0.9em;
        }
        .order-items th, .order-items td {
            padding: 3px 6px;
        }
        .order-items th {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            Search by user or status: 
            <asp:TextBox ID="txtSearch" runat="server" placeholder="User name or status"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>

        <br />

        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" EmptyDataText="No orders found" OnRowDataBound="gvOrders_RowDataBound">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Order ID" />
                <asp:BoundField DataField="UserName" HeaderText="User" />
                <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
                <asp:BoundField DataField="DeliveryAddress" HeaderText="Delivery Address" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                <asp:TemplateField HeaderText="Order Items">
                    <ItemTemplate>
                        <asp:PlaceHolder ID="phOrderItems" runat="server"></asp:PlaceHolder>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </form>
</body>
</html>
