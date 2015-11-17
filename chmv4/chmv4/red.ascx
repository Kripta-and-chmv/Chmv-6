<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="red.ascx.cs" Inherits="chmv4.red" %>
<style type="text/css">
    .auto-style1 {
        height: 23px;
    }
</style>
<table>
    <tr>
        <td align="center"><strong>Добавить категорию</strong></td>

    </tr>
    <tr>
        <td align="center">
            <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryName" Display="Dynamic" ErrorMessage="Введите категорию" ForeColor="#CC0000" ValidationGroup="VG2">Введите категорию</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnAddcategory" runat="server" Text="Добавить" OnClick="btnAddcategory_Click" ValidationGroup="VG2" /></td>
    </tr>
    <tr>
        <td></td>
    </tr>
    <tr>
        <td align="center"><strong>Добавить товар</strong></td>
    </tr>
    <tr ><td align="center">Название товара:</td></tr>
    <tr>
        <td align="center" class="auto-style1">
            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProductName" Display="Dynamic" ErrorMessage="Введите название товара" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtProductName" Display="Dynamic" ErrorMessage="Товар с таким названием уже существует" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="VG1"></asp:CustomValidator>
        </td>
    </tr>
    <tr ><td align="center">Стоимость товара:</td></tr>
    <tr>
        <td align="center">
            <asp:TextBox ID="txtProductPrice" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProductPrice" Display="Dynamic" ErrorMessage="Введите цену товара" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:DropDownList ID="ddlCategories" runat="server">
                <asp:ListItem>Книги</asp:ListItem>
                <asp:ListItem>Кольца</asp:ListItem>
                <asp:ListItem>Стулья</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnAddProduct" runat="server" Text="Добавить" OnClick="btnAddProduct_Click" ValidationGroup="VG1" /></td>
    </tr>
</table>
<asp:Label ID="Label1" runat="server" Font-Size="15pt" ForeColor="#CC0000"></asp:Label>

