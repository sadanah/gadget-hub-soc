<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersSection.aspx.cs" Inherits="GadgetHub.Web.GHAdmin.UsersSection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Users List</title>
</head>
<body>
    <form id="form1" runat="server">

<asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="true" 
    OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
    <asp:ListItem Text="All" Value="" />
    <asp:ListItem Text="Customer" Value="Customer" />
    <asp:ListItem Text="Distributor" Value="Distributor" />
</asp:DropDownList>

<asp:TextBox ID="txtSearch" runat="server" Placeholder="Search by name, email, etc."></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

<asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="ID" />
        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
        <asp:BoundField DataField="Username" HeaderText="Username" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Role" HeaderText="Role" />
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <%# (bool)Eval("IsActive") ? "Active" : "Inactive" %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnToggle" runat="server" Text='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>'
                    CommandArgument='<%# Eval("Id") %>' OnClick="btnToggle_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </form>
</body>
</html>
