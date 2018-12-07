<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setup4.aspx.cs" Inherits="Web.Setup.Setup4" %>
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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/setup_01.gif" /></td>
                    </tr>
                    <tr>
                        <td rowspan="2" style="background-image: url(/Images/setup_02.gif); width:283px" valign="middle" align="center">
                            <div style="margin:20px" class="title_14px">
                            &nbsp;</div>
                        </td>
                        <td style="height:60px; width:369px"><asp:Image ID="Image3" runat="server" ImageUrl="~/Images/setup_03.gif" /></td>
                    </tr>
                    <tr>
                        <td style="background-image: url(/Images/setup_04.gif); height:350px" valign="top" class="text_12px">
                            设置考试系统：
                            <div style="margin:10px" class="table_Box">
                                <table class="text_12px">
                                    <tr>
                                        <td>系统管理员：</td>
                                        <td>sAdmin</td>
                                    </tr>
                                    <tr>
                                        <td>密码：</td>
                                        <td>
                                            <asp:TextBox ID="tb_Password" runat="server" CssClass="table_Box" 
                                                TextMode="Password" MaxLength="20"></asp:TextBox>(<20)
                                        </td>
                                    </tr>
                                </table>                                                    
                            </div>
                            <asp:Button ID="bt_Yes" runat="server" Text="完成" CssClass="table_Box" 
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
