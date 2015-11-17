<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="default.aspx.cs"
    Inherits="chmv4._default" %>


<%@ Register Src="~/red.ascx" TagPrefix="My" TagName="Editor" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        
        body {
            margin: 0;
        }

        #sidebar, #content {
            position: absolute;
        }

        #sidebar, #content {
            overflow: auto;
        }

        #header {
            height: 80px; /* Высота слоя */
            background: #FEDFC0;
            border-bottom: 2px solid #7B5427;
        }

        #editor {
            top: 82px; /* Расстояние от верхнего края */
            left: 170px; /* Расстояние от левого края */
            bottom: 0;
            right: 0;
        }

        .auto-style36 {
            width: 216px;
        }

        .auto-style37 {
            width: 161px;
        }
    
        .auto-style1 {
            height: 23px;
        }

        .auto-style7 {
            height: 23px;
        }

        .auto-style13 {
            width: 613px;
        }

        .auto-style24 {
            width: 120px;
            height: 42px;
        }

        .auto-style27 {
            width: 77px;
            height: 42px;
        }

        .auto-style4 {
            width: 13px;
            height: 42px;
        }

        .auto-style3 {
            width: 1px;
            height: 42px;
        }

        .auto-style2 {
            width: 67px;
            height: 42px;
        }

        .auto-style19 {
            width: 7px;
            height: 42px;
        }

        .auto-style18 {
            width: 11px;
            height: 42px;
        }

        .auto-style23 {
            width: 34px;
            height: 42px;
        }

        .auto-style21 {
            height: 23px;
            width: 120px;
        }

        .auto-style26 {
            height: 23px;
            width: 77px;
        }

        .auto-style8 {
            width: 13px;
            height: 23px;
        }

        .auto-style9 {
            width: 1px;
            height: 23px;
        }

        .auto-style29 {
            width: 120px;
            height: 29px;
        }

        .auto-style30 {
            width: 77px;
            height: 29px;
        }

        .auto-style31 {
            height: 29px;
        }

        .auto-style32 {
            width: 67px;
            height: 29px;
        }

        .auto-style33 {
            width: 7px;
            height: 29px;
        }

        .auto-style34 {
            width: 11px;
            height: 29px;
        }

        .auto-style35 {
            width: 34px;
            height: 29px;
        }

        </style>
</head>
<body background="Images/tumblr_static_grey_tumblr_background__2_.jpg">

    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="auto-style37">
                    <asp:Label ID="Label2" runat="server" Text="Вы не зашли в систему"></asp:Label>
                </td>
                <td class="auto-style36">
                    <asp:Button ID="btnToManagement" runat="server" Text="Управление персоналом" OnClick="Button2_Click" /></td>
            </tr>
            <tr>
                <td class="auto-style37">
                    <asp:Button ID="btnEnterance" runat="server" OnClick="btnEnterance_Click" Text="Вход" /></td>
                <td class="auto-style36">&nbsp;</td>

            </tr>
        </table>
        <br />
        <br />
        <br />
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VG1" />
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" OnActiveViewChanged="MultiView1_ActiveViewChanged" OnInit="MultiView1_Init">
                        <asp:View ID="view1" runat="server">
                            <table>
                                <tr>
                                    <td align="center"><strong>Добавить категорию</strong></td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCategoryName" Display="Dynamic" ErrorMessage="Введите категорию" ForeColor="#CC0000" ValidationGroup="VG2">Введите категорию</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnAddcategory" runat="server" OnClick="btnAddcategory_Click" Text="Добавить" ValidationGroup="VG2" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td align="center"><strong>Добавить товар</strong></td>
                                </tr>
                                <tr>
                                    <td align="center">Название товара:</td>
                                </tr>
                                <tr>
                                    <td align="center" class="auto-style1">
                                        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtProductName" Display="Dynamic" ErrorMessage="Введите название товара" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="auto-style7">Стоимость товара:</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="txtProductPrice" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtProductPrice" Display="Dynamic" ErrorMessage="Введите цену товара" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtProductPrice" Display="Dynamic" ErrorMessage="Цена задана некорректно" ForeColor="#CC0000" MaximumValue="99999999999999" MinimumValue="0" ValidationGroup="VG1"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" DataSourceID="categories" DataTextField="Categories">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCategories" Display="Dynamic" ErrorMessage="Введите категорию" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnAddProduct" runat="server" OnClick="btnAddProduct_Click" Text="Добавить" ValidationGroup="VG1" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Label ID="Label1" runat="server" Font-Size="15pt" ForeColor="#CC0000"></asp:Label>
                        </asp:View>
                        <asp:View ID="view2" runat="server">
                            <table class="auto-style13">
                                <tr>
                                    <td class="auto-style24">
                                        <p>
                                            <strong>Название товара</strong>
                                        </p>
                                    </td>
                                    <td class="auto-style27">
                                        <asp:TextBox ID="txtName" runat="server" OnTextChanged="name_TextChanged" Width="141px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td class="auto-style3"></td>
                                    <td class="auto-style2">
                                        <p>
                                            <strong>Категория</strong>
                                        </p>
                                    </td>
                                    <td class="auto-style19">
                                        <asp:DropDownList ID="ddlFindCategory" runat="server" AutoPostBack="True" DataSourceID="categories" DataTextField="Categories" OnSelectedIndexChanged="ddlFindCategory_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="categories" runat="server" ConnectionString="<%$ ConnectionStrings:KKK %>" SelectCommand="SELECT [Categories] FROM [Categories]"></asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style18"></td>
                                    <td class="auto-style23"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style21"></td>
                                    <td class="auto-style26"></td>
                                    <td class="auto-style8"></td>
                                    <td class="auto-style9"></td>
                                    <td class="auto-style7" colspan="4">
                                        <p align="left">
                                            <strong>Ценовой диапазон</strong>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style29"></td>
                                    <td class="auto-style30">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Поиск" ValidationGroup="VG1" Width="101px" />
                                    </td>
                                    <td class="auto-style31"></td>
                                    <td class="auto-style31"><strong>от</strong></td>
                                    <td class="auto-style32">
                                        <asp:TextBox ID="txtFrom" runat="server" Width="60px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style33"><strong>до</strong></td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="txtTo" runat="server" Width="60px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style35"><strong>
                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtFrom" Display="Dynamic" ErrorMessage="некорректная начальная цена" ForeColor="#CC0000" MaximumValue="999999999999" MinimumValue="0" ValidationGroup="VG1"></asp:RangeValidator>
                                        <br />
                                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtTo" Display="Dynamic" ErrorMessage="некорректная конечная цена" ForeColor="#CC0000" MaximumValue="999999999999" MinimumValue="0" ValidationGroup="VG1"></asp:RangeValidator>
                                        </strong></td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                    <br />
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="редактировать" />
                    <table>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Результат поиска: </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataMember="DefaultView" DataSourceID="Product" OnPageIndexChanged="GridView1_PageIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="3">
                                    <Columns>
                                        <asp:BoundField DataField="Categories" HeaderText="Categories" SortExpression="Categories" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td></td>
                            <td>
                                <asp:ListBox ID="ListBox1" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <strong>Получение данных...</strong>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
        </div>



        <div>


            <asp:SqlDataSource ID="Product" runat="server" ConnectionString="<%$ ConnectionStrings:KKK %>" SelectCommand="SELECT [Categories], [Name], [Price] FROM [Product]"></asp:SqlDataSource>


            <asp:SqlDataSource ID="Products" runat="server" ConnectionString="<%$ ConnectionStrings:KKK %>" SelectCommand="SELECT [Категория], [Название], [Стоимость] FROM [Products]"></asp:SqlDataSource>
        </div>

    </form>
</body>
</html>
