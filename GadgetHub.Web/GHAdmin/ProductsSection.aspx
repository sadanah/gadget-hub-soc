<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsSection.aspx.cs" Inherits="GadgetHub.Web.GHAdmin.ProductsSection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products Section</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Search box -->
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by name, category, distributor..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

            <!-- Category filter dropdown -->
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                <asp:ListItem Text="All Categories" Value=""></asp:ListItem>
                <%-- Categories are loaded dynamically from code-behind --%>
            </asp:DropDownList>

            <!-- Status filter dropdown -->
            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                <asp:ListItem Text="All Status" Value=""></asp:ListItem>
                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
            </asp:DropDownList>

            <!-- Products grid -->
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="false" 
                EmptyDataText="No products found.">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Product Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:BoundField DataField="DistributorName" HeaderText="Distributor" />
                    <asp:BoundField DataField="IsActive" HeaderText="Status" 
                        DataFormatString="{0}" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
