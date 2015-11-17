<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="PersonalManagement.aspx.cs" Inherits="chmv4.PersonalMenegment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 131px;
            height: 200px;
        }
        .auto-style2 {
            width: 598px;
            height: 200px;
        }
        .auto-style3 {
            height: 200px;
            width: 205px;
        }
    </style>
</head>
<body background="Images/tumblr_static_grey_tumblr_background__2_.jpg">
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="btnToMain" runat="server" Text="На главную" OnClick="btnToMain_Click" />

            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Введите имя пользователя:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="VG1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Введите имя пользователя" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
            <br />
            <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Поиск" ValidationGroup="VG1" />
                        <table>
                            <tr>
                                <td class="auto-style3">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="Users" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="4">
                                        <Columns>
                                            <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                                            <asp:BoundField DataField="Rights" HeaderText="Rights" SortExpression="Rights" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:KKK %>" SelectCommand="SELECT [Username], [Rights] FROM [Users]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KKK %>" SelectCommand="SELECT [Имя], [Категория] FROM [Users]"></asp:SqlDataSource>
                                </td>
                                <td class="auto-style1"></td>
                                <td class="auto-style2">
                                    <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
                                    <br />
                                    <br />
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Изменить категорию на" Width="181px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Rights" DataTextField="Rights" DataValueField="Rights">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Rights" runat="server" ConnectionString="<%$ ConnectionStrings:KKK %>" SelectCommand="SELECT [Rights] FROM [Rights]"></asp:SqlDataSource>
                                    <asp:Label ID="Label2" runat="server" ForeColor="#CC0000"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />

        </div>
    </form>
</body>
</html>
