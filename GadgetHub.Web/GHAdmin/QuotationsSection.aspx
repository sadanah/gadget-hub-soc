<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationsSection.aspx.cs" Inherits="GadgetHub.Web.GHAdmin.QuotationsSection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Quotations List</title>
</head>
<body>
    <form id="form1" runat="server">

<asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true"
    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
    <asp:ListItem Text="All" Value="" />
    <asp:ListItem Text="Pending" Value="Pending" />
    <asp:ListItem Text="Approved" Value="Approved" />
    <asp:ListItem Text="Rejected" Value="Rejected" />
</asp:DropDownList>

<asp:TextBox ID="txtSearch" runat="server" Placeholder="Search by distributor name or ID"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

<asp:GridView ID="gvQuotations" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="QuotationId" HeaderText="Quotation ID" />
        <asp:BoundField DataField="DistributorName" HeaderText="Distributor" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:HyperLink ID="lnkView" runat="server" Text="View" 
                    NavigateUrl='<%# Eval("QuotationId", "~/GHAdmin/QuotationDetails.aspx?id={0}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </form>
</body>
</html>
