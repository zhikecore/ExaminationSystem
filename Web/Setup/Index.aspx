<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.Setup.Index" %>
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
                            <asp:GridView ID="gv01" runat="server" CssClass="text_12px">
                            </asp:GridView>
                            请输入授权码：
                            CD-Key：<br />
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="table_Box" MaxLength="8" 
                                    Width="75px"></asp:TextBox>-
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="table_Box" MaxLength="8" 
                                    Width="75px"></asp:TextBox>-
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="table_Box" MaxLength="8" 
                                    Width="75px"></asp:TextBox>-
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="table_Box" MaxLength="8" 
                                    Width="75px"></asp:TextBox>
                                    <br/>
                            <asp:Button ID="bt_Yes" runat="server" Text="下一步" CssClass="table_Box" 
                                onclick="bt_Yes_Click" /><br />
                            <asp:Label ID="lb_Msg" runat="server" CssClass="text_12px" ForeColor="Red"></asp:Label>
                            <br />
                            CD-Key：3D1BCD1C-29849747-C623CAE5-CFBDDCF4
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