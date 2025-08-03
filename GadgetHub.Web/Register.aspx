<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GadgetHub.Web.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>User Registration</h2>

            <asp:Label ID="lblFirstName" runat="server" Text="First Name: " />
            <asp:TextBox ID="txtFirstName" runat="server" /><br /><br />

            <asp:Label ID="lblLastName" runat="server" Text="Last Name: " />
            <asp:TextBox ID="txtLastName" runat="server" /><br /><br />

            <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number: " />
            <asp:TextBox ID="txtPhoneNumber" runat="server" /><br /><br />

            <asp:Label ID="lblUsername" runat="server" Text="Username: " />
            <asp:TextBox ID="txtUsername" runat="server" /><br /><br />

            <asp:Label ID="lblPassword" runat="server" Text="Password: " />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /><br /><br />

            <asp:Label ID="lblEmail" runat="server" Text="Email: " />
            <asp:TextBox ID="txtEmail" runat="server" /><br /><br />

            <!-- Registration Button -->
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" /><br /><br />

            <!-- Status Label -->
            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red" />

        </div>
    </form>
</body>
</html>
