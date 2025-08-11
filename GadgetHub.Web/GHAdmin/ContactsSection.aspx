<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactsSection.aspx.cs" Inherits="GadgetHub.Web.GHAdmin.ContactsSection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Messages</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Search by user or subject:
            <asp:TextBox ID="txtSearch" runat="server" placeholder="User or subject"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>

        <br />

        <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="false" EmptyDataText="No messages found">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                <asp:BoundField DataField="UserName" HeaderText="User" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                <asp:TemplateField HeaderText="Message">
                    <ItemTemplate>
                        <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("Message") %>' 
                            ToolTip='<%# Eval("Message") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
