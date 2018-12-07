<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="Web.ResultsManagement.Students" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/HrSys.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#EFEFEF">
    <form id="form1" runat="server">
    <div style="margin-bottom:10px; float:left; width:100%">
        <table style="width:100%; background-color:#CCCCCC" border="0" cellpadding="1" cellspacing="1">
            <tr style="height:22px; background-image:url(/Images/bg_h_19px.jpg)">
                <td class="title_14px">
                    　 按学员查 
                </td>
            </tr>
            <tr>
                <td style="background-color:#FFFFFF" valign="top">
                    <table style="width:100%">
                        <tr>
                            <td>
                                <asp:TextBox ID="tb_UserName" runat="server" CssClass="table_Box" 
                                    MaxLength="30" Height="30px" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="tb_UserName" CssClass="text_12px" ErrorMessage="*" 
                                    ValidationGroup="op"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="bt_Yes" runat="server" Text="查询" CssClass="table_Box" 
                                    Height="30px" onclick="bt_Yes_Click" ValidationGroup="op" Width="60px" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lb_Msg" runat="server" CssClass="text_12px" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-bottom:10px; float:left; width:100%">
        <table style="width:100%; background-color:#CCCCCC" border="0" cellpadding="1" cellspacing="1">
            <tr style="height:22px; background-image:url(/Images/bg_h_19px.jpg)">
                <td class="title_14px">
                    　 学员列表 
                </td>
            </tr>
            <tr>
                <td style="background-color:#FFFFFF" valign="top">
                    <asp:GridView ID="gv_01" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" CssClass="text_12px" ForeColor="#333333" GridLines="None" 
                        Width="100%">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="cnName" HeaderText="中文名" />
                            <asp:BoundField DataField="enName" HeaderText="英文名" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    [<a href="/R-M/L_S<%#Eval("ID") %>-按学员查.html" target="Iframe_Div_Mid_Mid">查询成绩</a>]
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
