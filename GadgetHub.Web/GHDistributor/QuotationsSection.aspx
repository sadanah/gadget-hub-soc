<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationsSection.aspx.cs" Inherits="GadgetHub.Web.GHDistributor.QuotationsSection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Distributor Quotations</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 30px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="number"], input[type="text"] {
            width: 80px;
        }
        .btn-update {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn-update:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function updateQuotationItem(quotationId, productId) {
            var qtyInput = document.getElementById('qty_' + quotationId + '_' + productId);
            var priceInput = document.getElementById('price_' + quotationId + '_' + productId);
            
            var qty = qtyInput.value;
            var price = priceInput.value;

            __doPostBack('UpdateItem', quotationId + ',' + productId + ',' + qty + ',' + price);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <asp:PlaceHolder ID="phQuotations" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
