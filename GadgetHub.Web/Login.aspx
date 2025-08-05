<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GadgetHub.Web.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Login</h2>

            <asp:Label ID="lblEmail" runat="server" Text="Email: " />
            <asp:TextBox ID="txtEmail" runat="server" /><br /><br />

            <asp:Label ID="lblPassword" runat="server" Text="Password: " />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /><br /><br />

            <!-- Login Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br /><br />

            <!-- Status Label -->
            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red" />

            <asp:Literal runat="server" ID="litRegisterText"></asp:Literal>
            <asp:HyperLink runat="server" ID="hlRegister" NavigateUrl="~/Register.aspx" Text="Register Now" />

        </div>
    </form>
</body>
</html>
