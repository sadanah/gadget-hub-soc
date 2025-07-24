<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GadgetHubWeb.Pages.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Gadget Hub</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f0f0f0;
            padding: 50px;
        }
        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            width: 300px;
            margin: 0 auto;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
        }
        .login-container h2 {
            text-align: center;
        }
        .login-container label {
            display: block;
            margin-top: 10px;
        }
        .login-container input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        .login-container button {
            margin-top: 15px;
            width: 100%;
            padding: 10px;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login</h2>

            <asp:Label runat="server" Text="Email" AssociatedControlID="txtEmail" />
            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" />

            <asp:Label runat="server" Text="Password" AssociatedControlID="txtPassword" />
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />

            <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" />
            
            <asp:Label runat="server" ID="lblStatus" CssClass="error-message" EnableViewState="false" />
        </div>
    </form>
</body>
</html>
