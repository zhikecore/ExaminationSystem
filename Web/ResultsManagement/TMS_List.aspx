<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TMS.Master" AutoEventWireup="true"
    CodeBehind="TMS_List.aspx.cs" Inherits="Web.ResultsManagement.TMS_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    成绩管理：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
        // 鼠标经过改变行的颜色
        var _oldColor;
        function SetNewColor(source) {
            _oldColor = source.style.backgroundColor;
            source.style.backgroundColor = '#EFEFEF';
        }
        function SetOldColor(source) {
            source.style.backgroundColor = _oldColor;
        }   
    </script>

    <div id="div_Course" visible="false" runat="server" style="margin: 5px; float: left;
        width: 100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
        <tr>
            <td>
                <asp:GridView ID="gv01" runat="server" AllowSorting="True" CssClass="table_Box" Width="100%"
                    GridLines="Horizontal" OnRowDataBound="gv01_RowDataBound" onsorting="gv_01_Sorting" AutoGenerateColumns="False">
                    <RowStyle Font-Names="宋体" Font-Size="12px" ForeColor="#666666" Height="20px" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="姓名" />
                        <asp:BoundField DataField="PapersName" HeaderText="试卷名" />
                        <asp:BoundField DataField="Score" HeaderText="得分" />
                        <asp:BoundField DataField="SysScore" HeaderText="总分" />
                        <asp:BoundField DataField="Percentage" HeaderText="成绩" ItemStyle-ForeColor="Red" />
                        <asp:BoundField DataField="Time" SortExpression="Time" HeaderText="考试时间" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lb_UserID" runat="server" Text='<%#Eval("UserID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lb_PapersID" runat="server" Text='<%#Eval("PapersID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lb_Time" runat="server" Text='<%#Eval("Time") %>' Visible="false"></asp:Label>
                                [<a href="/ResultsManagement/Details.aspx?TitleType=<%=Request.QueryString["TitleType"]%>&UserID=<%#Eval("UserID") %>&PapersID=<%#Eval("PapersID") %>&Time=<%#Eval("Time")%>">详细</a>]
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle Height="30px" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="background-color: #EAEEF7; border-style: none groove groove groove; border-width: 1px;
                border-color: #999999; height: 30px" valign="middle">
                <asp:TextBox ID="tb_Search" runat="server" CssClass="text_12px" Height="14px" Width="120px"></asp:TextBox>
                <asp:DropDownList ID="ddl_Search" runat="server" CssClass="text_12px">
                    <asp:ListItem Value="Time">时间</asp:ListItem>
                    <asp:ListItem Value="Score">成绩</asp:ListItem>
                    <asp:ListItem Value="UserID">学员</asp:ListItem>
                </asp:DropDownList>
                <asp:ImageButton ID="img_Search" runat="server" ImageUrl="~/Images/Search.gif" OnClick="img_Search_Click"
                    ToolTip="搜索" />
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color: #EAEEF7; border-style: none groove groove groove;
                border-width: 1px; border-color: #999999;">
                <table border="0" cellpadding="2" cellspacing="2" class="text_12px">
                    <tr>
                        <td>
                            <asp:ImageButton ID="imgbtFirs" runat="server" CommandArgument="First" onmouseover="this.src='/Images/FirstPage_bg.gif';"
                                onmouseout="this.src='/Images/FirstPage.gif';" OnClick="imgbtFirst_Click" ImageUrl="~/Images/FirstPage.gif"
                                ToolTip="第一页" />
                        </td>
                        <td>
                            <asp:ImageButton ID="imgbtPiev" runat="server" CommandArgument="Prev" onmouseover="this.src='/Images/PievPage_bg.gif';"
                                onmouseout="this.src='/Images/PievPage.gif';" OnClick="imgbtFirst_Click" ImageUrl="~/Images/PievPage.gif"
                                ToolTip="上一页" />
                        </td>
                        <td>
                            转到：<asp:DropDownList ID="DrpGoAge" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrpGoAge_SelectedIndexChanged"
                                CssClass="text_12px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="labAlert" runat="server" Text="labAlert"></asp:Label>
                        </td>
                        <td>
                            <asp:ImageButton ID="imgbtNext" runat="server" CommandArgument="Next" onmouseover="this.src='/Images/NextPage_bg.gif';"
                                onmouseout="this.src='/Images/NextPage.gif';" OnClick="imgbtFirst_Click" ImageUrl="~/Images/NextPage.gif"
                                ToolTip="下一页" />
                        </td>
                        <td>
                            <asp:ImageButton ID="imgbtLast" runat="server" CommandArgument="Last" onmouseover="this.src='/Images/LastPage_bg.gif';"
                                onmouseout="this.src='/Images/LastPage.gif';" OnClick="imgbtFirst_Click" ImageUrl="~/Images/LastPage.gif"
                                ToolTip="最后一页" />
                        </td>
                        <td>
                            <img src="../Images/link.gif" />
                        </td>
                        <td>
                            <asp:ImageButton ID="imgF5" runat="server" onmouseover="this.src='/Images/F5_bg.gif';"
                                onmouseout="this.src='/Images/F5.gif';" ImageUrl="~/Images/F5.gif" ToolTip="刷新"
                                OnClick="imgF5_Click" />
                        </td>
                        <td>
                            <img src="../Images/link.gif" />
                        </td>
                        <td>
                            <asp:Literal ID="LitTotal" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:Literal ID="LitCurrAge" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
