<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationsSection.aspx.cs" Inherits="GadgetHub.Web.GHAdmin.QuotationsSection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Quotation Section</title>
    <style>
        table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; }
        .form-row { margin-bottom: 10px; }
    </style>
    <script type="text/javascript">
        function addItemRow() {
            var table = document.getElementById("itemTable");
            var row = table.insertRow(-1);

            row.innerHTML = `
                <td>
                    <select name="productId" runat="server">
                        <%= productOptionsHtml %>
                    </select>
                </td>
                <td><input type="number" name="quantity" /></td>
                <td><input type="number" name="price" step="0.01" /></td>`;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Quotations</h2>
        <asp:Repeater ID="rptQuotations" runat="server">
            <HeaderTemplate>
                <table>
                    <tr>
                        <th>Quotation ID</th>
                        <th>Distributor ID</th>
                        <th>Distributor Email</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Repeater ID="rptItems" runat="server" DataSource='<%# Eval("Items") %>'>
                    <ItemTemplate>
                        <tr>
                            <%-- Only show Quotation ID and Distributor info on first item row --%>
                            <td><%# Container.ItemIndex == 0 ? Eval("QuotationID") : "" %></td>
                            <td><%# Container.ItemIndex == 0 ? Eval("DistributorID") : "" %></td>
                            <td><%# Container.ItemIndex == 0 ? Eval("DistributorEmail") : "" %></td>
                            <td><%# Eval("ProductName") %></td>
                            <td><%# Eval("Quantity") %></td>
                            <td><%# Eval("Price") %></td>
                            <td><%# Container.ItemIndex == 0 ? Eval("Total") : "" %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <hr />

        <h3>Create Quotation</h3>
        <div class="form-row">
            Distributor:
            <asp:DropDownList ID="ddlDistributors" runat="server" />
        </div>

        <table id="itemTable">
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
        </table>

        <div class="form-row">
            <button type="button" onclick="addItemRow()">Add Item</button>
        </div>

        <asp:Button ID="btnCreate" runat="server" Text="Create Quotation" OnClick="btnCreate_Click" />
    </form>
</body>
</html>
