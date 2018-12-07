<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Web.PaperManagement.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .title {
            font-weight:bold
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 5px; text-align: center;" class="text_12px">
            <asp:Label ID="lb_U" runat="server" Visible="true"></asp:Label>
            总分：<asp:Label ID="Label1" runat="server"></asp:Label>
            时间：90分钟
    <asp:Button ID="bt_Yes" runat="server" Text="交卷" CssClass="table_Box" Height="30px"
        OnClick="bt_Yes_Click" Width="60px" />
            <div style="text-align: center;">
                <table>
                <tr>
                    <td style="font-weight: bold">选项</td>
                    <td style="font-weight: bold">解释</td>
                </tr>
                <tr>
                    <td>A.非常赞同</td>
                    <td>表示您对该项内容持完全肯定并持积极支持的态度</td>
                </tr>
                <tr>
                    <td>B.赞同</td>
                    <td>表示您认可此项内容</td>
                </tr>
                <tr>
                    <td>C.不置可否</td>
                    <td>表示您对此项内容不肯定、不否定或不了解</td>
                </tr>
                <tr>
                    <td>D.不赞同</td>
                    <td>表示此项内容基本不能反映实际情况</td>
                </tr>
                <tr>
                    <td>E.非常不赞同</td>
                    <td>表示此项内容完全不能反映实际情况</td>
                </tr>
            </table>
            </div>
        </div>
        <div class="text_12px">
            <table>

                <tr>
                    <asp:GridView ID="gv_1" runat="server" GridLines="None" ShowHeader="False" AutoGenerateColumns="False" OnRowDataBound="gv_1_RowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lb_Num1" runat="server"><%#Exchange(int.Parse(Eval("YS_SEQ").ToString())) %></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lb_Type1" runat="server"><%#Eval("YS_DESC") %></asp:Label>
                                            </td>
                                            <td></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:GridView ID="gv_01" runat="server" GridLines="None" ShowHeader="False" OnRowDataBound="gv_01_RowDataBound" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <table>
                                                                    <tr>
                                                                        <td style="width: 2%" valign="top" align="center"><%#Eval("Num")%>、</td>
                                                                        <td style="width: 90%" valign="top" align="left"><%#Eval("Title") %></td>
                                                                        <td style="width: 8%" valign="top" align="right">(<%#Eval("Score") %>分)</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td>
                                                                            <asp:GridView ID="gv_01_1" runat="server" GridLines="None" ShowHeader="False" AutoGenerateColumns="False">
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <table>
                                                                                                <tr>
                                                                                                    <td><%#Common.Function.ToString(Eval("Num").ToString()+",")%>、</td>
                                                                                                    <td><%#Eval("Name") %></td>
                                                                                                    <td><%#Eval("T_F") %></td>
                                                                                                    <td>
                                                                                                        <input type="radio" name='radio<%#Eval("TitleListID")%>' id='radio<%#Eval("TitleListID")%>' value='<%#Eval("ID") %>' class="text_12px" /></td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td>
                                                                            <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <td></td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("YS_ID") %>' Visible="false"></asp:Label>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </tr>
            </table>

        </div>
    </form>

</body>
</html>
