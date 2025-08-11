<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessagesSection.aspx.cs" Inherits="GadgetHub.Web.GHUser.MessagesSection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Messages</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .no-messages {
            margin-top: 20px;
            font-style: italic;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>My Contact Messages</h2>
        <asp:PlaceHolder ID="phMessages" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
