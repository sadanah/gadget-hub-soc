<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GadgetHubWeb.Pages.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Gadget Hub</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Poppins, Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 50px;
        }
        .login-container {
            background-color: white;
            padding: 20px 30px 20px 30px;
            border-radius: 8px;
            width: 350px;
            margin: 0 auto;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
.login-container label {
    margin-top: 15px;
    margin-bottom: 10px;
}

.login-container input,
.login-container button {
    width: 100%;
    padding: 10px 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-top: 5px;
    margin-bottom: 20px;
}

.login-container input:focus,
.login-container button:focus {
    outline: none;
    border-color: #007BFF;
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
