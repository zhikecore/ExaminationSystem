<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Div_Mid_Right.aspx.cs" Inherits="Web.Admin.Div_Mid_Right" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/HrSys.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#EFEFEF">
    <form id="form1" runat="server">
    <div style="margin-bottom:10px">
        <table style="width:100%; background-color:#CCCCCC" border="0" cellpadding="1" cellspacing="1">
            <tr style="height:22px; background-image:url(/Images/bg_h_19px.jpg)">
                <td class="title_14px">
                    　课程体系
                </td>
            </tr>
            <tr>
                <td style="background-color:#FFFFFF" valign="top">
                    <asp:TreeView ID="TreeView1" runat="server" onselectednodechanged="TreeView1_SelectedNodeChanged">
                    </asp:TreeView>
                    <asp:Label ID="lb_Msg" runat="server" Text="" CssClass="text_12px"></asp:Label>                
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-bottom:10px">
        <table style="width:100%; background-color:#CCCCCC" border="0" cellpadding="1" cellspacing="1">
            <tr style="height:22px; background-image:url(/Images/bg_h_19px.jpg)">
                <td class="title_14px">
                    　您选择的课程是：<asp:Label ID="lb_CourseLbName" runat="server" CssClass="title_14px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color:#FFFFFF" valign="top">
                    <asp:GridView ID="gv01" runat="server" AutoGenerateColumns="False" 
                        GridLines="None" CssClass="text_12px" ShowHeader="False">
                        <Columns>
                            <asp:TemplateField HeaderText="课程名称">
                                <ItemTemplate>
                                    &nbsp;<img src="../Images/arrow.gif" alt='<%# Eval("Title") %>' />
                                    &nbsp;<a href="../<%=URL %>&CourseID=<%# Eval("ID") %>" target="Iframe_Div_Mid_Mid"><%# Eval("Title") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="background-color:#FFFFFF">
    <div id="div_Navigation" style="margin:5px" class="text_12px" runat="server">
    <asp:Literal ID="LitTotal" runat="server"></asp:Literal>
    <asp:Literal ID="LitCurrAge" runat="server"></asp:Literal>
    <asp:Label ID="labAlert" runat="server" Text="labAlert"></asp:Label>
    <asp:LinkButton ID="lnkFirst" runat="server" CommandArgument="First" OnClick="lnkFirst_Click">首页</asp:LinkButton>
    <asp:LinkButton ID="lnkPrev" runat="server" CommandArgument="Prev" OnClick="lnkFirst_Click">上页</asp:LinkButton>
    <asp:LinkButton ID="lnkNext" runat="server" CommandArgument="Next" OnClick="lnkFirst_Click">下页</asp:LinkButton>
    <asp:LinkButton ID="lnkLast" runat="server" CommandArgument="Last" OnClick="lnkFirst_Click">尾页</asp:LinkButton>
    转到：<asp:DropDownList ID="DrpGoAge" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="DrpGoAge_SelectedIndexChanged" CssClass="table_Box">
    </asp:DropDownList>
    </div>                                            
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
