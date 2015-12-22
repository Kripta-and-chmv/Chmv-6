<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="Registration.aspx.cs" Inherits="chmv4.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 149px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 25px;
        }
    </style>
</head>
<body background="Images/tumblr_static_grey_tumblr_background__2_.jpg">
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Назад" ValidationGroup="VG2"/>
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VG1" />
        </div>
        <div></div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>Логин:</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" width="150">
                            <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLogin" Display="Dynamic" ErrorMessage="Введите логин" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style3">
                            <asp:Literal ID="ltRegText" runat="server" Text="Ещё не зарегистрированы?"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td>Пароль:</td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:Button ID="btnChangeTable" runat="server" OnClick="btnChangeTable_Click" Text="Регистрация" ValidationGroup="VG2" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                            <td class="auto-style2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPass" ErrorMessage="Введите пароль" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
                            </td>
                        </td>
                    </tr>
                </table>
        <br />
                <div>
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" OnInit="MultiView1_Init">
                        <asp:View ID="View1" runat="server">
                            <table>
                                <tr>
                                    <td wirdth="150">Повторите пароль: </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtRepeatPas" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRepeatPas" Display="Dynamic" ErrorMessage="Повторите пароль" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Электронная почта: </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Емаил введён неправильно" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VG1">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Введите емаил" ForeColor="#CC0000" ValidationGroup="VG1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <p align="center" class="auto-style1">
                    <asp:Label ID="Label1" runat="server" ForeColor="#CC0000"></asp:Label>
                </p>
            </ContentTemplate>
        </asp:UpdatePanel>
        <p align="center" class="auto-style1"><asp:Button ID="btnEnterReg" runat="server" Text="Вход" OnClick="btnEnterReg_Click" ValidationGroup="VG1" /></p>
    </form>
</body>
</html>
