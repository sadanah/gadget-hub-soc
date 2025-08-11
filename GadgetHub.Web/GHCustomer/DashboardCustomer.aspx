<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardCustomer.aspx.cs" Inherits="GadgetHub.Web.GHCustomer.DashboardCustomer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Orders</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 20px;
            padding: 0;
        }

        h2 {
            color: #2980b9;
            font-weight: 700;
            margin-bottom: 25px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Main gridview styling */
        .orders-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgb(41 128 185 / 0.15);
            font-size: 14px;
        }

        /* Header styles */
        .orders-grid thead th,
        .grid-header {
            background-color: #2980b9 !important;
            color: white !important;
            font-weight: 600;
            border-bottom: 3px solid #1c5980;
            padding: 12px 15px;
            text-align: left;
            user-select: none;
        }

        .orders-grid thead th:first-child {
            border-top-left-radius: 8px;
        }

        .orders-grid thead th:last-child {
            border-top-right-radius: 8px;
        }

        /* Row styles */
        .orders-grid tbody tr {
            transition: background-color 0.3s ease;
            cursor: default;
        }
        .orders-grid tbody tr:nth-child(even) {
            background-color: #f9faff;
        }
        .orders-grid tbody tr:hover {
            background-color: #d6e6fb;
        }

        /* Cells */
        .orders-grid tbody td {
            padding: 12px 15px;
            border-bottom: 1px solid #e1e8f0;
            vertical-align: middle;
        }

        /* Order items table inside placeholder */
        .order-items {
            margin-top: 10px;
            font-size: 0.9em;
            border-collapse: collapse;
            width: 100%;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgb(0 0 0 / 0.1);
        }
        .order-items th, .order-items td {
            border: 1px solid #ccc;
            padding: 6px 10px;
            text-align: left;
        }
        .order-items th {
            background-color: #2980b9;
            color: white;
            font-weight: 600;
        }
        header { display: flex; justify-content: space-between; align-items: center; padding: 10px 20px; background: #f0f0f0; }
nav { width: 250px; padding: 20px; border-right: 1px solid #ddd; }
main { flex-grow: 1; padding: 20px; }
        .layout { display: flex; min-height: 80vh; }
#cartArea { display: flex; align-items: center; gap: 15px; }

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
        /* Responsive */
        @media (max-width: 700px) {
            .orders-grid, .orders-grid thead, .orders-grid tbody, .orders-grid th, .orders-grid td, .orders-grid tr {
                display: block;
            }
            .orders-grid thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            .orders-grid tbody tr {
                margin-bottom: 20px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgb(41 128 185 / 0.15);
                padding: 15px;
            }
            .orders-grid tbody td {
                border: none;
                position: relative;
                padding-left: 50%;
                text-align: right;
                font-size: 13px;
            }
            .orders-grid tbody td::before {
                position: absolute;
                left: 15px;
                top: 12px;
                width: 45%;
                white-space: nowrap;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 12px;
                color: #2980b9;
                content: attr(data-label);
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="companyName" style="font-weight:bold; font-size:1.5em;">Gadget Hub</div>

            <div id="cartArea">
                <asp:Button ID="btnHome" runat="server" Text="Back to Store" OnClick="btnHome_Click" CssClass="button-link" />
            </div>
        </header>
        <h2>My Orders</h2>
        <asp:GridView 
            ID="gvOrders" 
            runat="server" 
            AutoGenerateColumns="false" 
            EmptyDataText="No orders found" 
            CssClass="orders-grid"
            OnRowDataBound="gvOrders_RowDataBound">
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
