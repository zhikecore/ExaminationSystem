<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertDB.aspx.cs" Inherits="Web.Setup.InsertDB" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%; height:100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" valign="middle">
                <table style="width:652px" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/admin_01.gif" /></td>
                    </tr>
                    <tr>
                        <td rowspan="2" style="background-image: url(/Images/setup_02.gif); width:283px" valign="top">
                            <div style="margin:20px" class="title_14px">
                            安装说明：
                            </div>
                        </td>
                        <td style="height:60px; width:369px"><asp:Image ID="Image3" runat="server" ImageUrl="~/Images/setup_03.gif" /></td>
                    </tr>
                    <tr>
                        <td style="background-image: url(/Images/admin_04.gif);" valign="top">
                            <div style="margin:10px">
                                <table class="text_12px" runat="server">
                                    <tr>
                                        <td>服务器地址：</td>
                                        <td>
                                        
                                            <asp:TextBox ID="tb_Server_UserSys" runat="server" CssClass="table_Box" 
                                                ValidationGroup="UserSysList"></asp:TextBox>
                                        
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                ControlToValidate="tb_Server_UserSys" CssClass="text_12px" 
                                                ErrorMessage="*" ValidationGroup="UserSysList"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>实例名：</td>
                                        <td>
                                        
                                            <asp:TextBox ID="tb_Instance_UserSys" runat="server" CssClass="table_Box" 
                                                ValidationGroup="UserSysList">MSSQLSERVER</asp:TextBox>
                                        
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                ControlToValidate="tb_Instance_UserSys" CssClass="text_12px" 
                                                ErrorMessage="*" ValidationGroup="UserSysList"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>端口号：</td>
                                        <td>
                                        
                                            <asp:TextBox ID="tb_Port_UserSys" runat="server" CssClass="table_Box" 
                                                ValidationGroup="UserSysList">1433</asp:TextBox>
                                        
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ControlToValidate="tb_Port_UserSys" CssClass="text_12px" ErrorMessage="*" 
                                                ValidationGroup="UserSysList"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>数据库名称：</td>
                                        <td>
                                        
                                            <asp:TextBox ID="tb_Database_UserSys" runat="server" CssClass="table_Box" 
                                                ValidationGroup="UserSysList" Enabled="False">TMS</asp:TextBox>
                                        
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ControlToValidate="tb_Database_UserSys" CssClass="text_12px" 
                                                ErrorMessage="*" ValidationGroup="UserSysList"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>用户名：</td>
                                        <td>
                                        
                                            <asp:TextBox ID="tb_User_UserSys" runat="server" CssClass="table_Box" 
                                                ValidationGroup="UserSysList"></asp:TextBox>
                                        
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ControlToValidate="tb_User_UserSys" CssClass="text_12px" ErrorMessage="*" 
                                                ValidationGroup="UserSysList"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>密码：</td>
                                        <td>
                                        
                                            <asp:TextBox ID="tb_Password_UserSys" runat="server" CssClass="table_Box" 
                                                ValidationGroup="UserSysList"></asp:TextBox>
                                        
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="tb_Password_UserSys" CssClass="text_12px" 
                                                ErrorMessage="*" ValidationGroup="UserSysList"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>标识：</td>
                                        <td>
                                            <asp:Label ID="lb_Key_UserSys" runat="server" Text="培训管理系统"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="bt_Test_UserSys" runat="server" Text="测试" CssClass="table_Box" 
                                                OnClick="bt_Test_UserSys_Click" ValidationGroup="UserSysList" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                            <asp:Button ID="bt_Yes" runat="server" Text="下一步" CssClass="table_Box" 
                                onclick="bt_Yes_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/setup_05.gif" /></td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    </div>
    </form>
</body>
</html>