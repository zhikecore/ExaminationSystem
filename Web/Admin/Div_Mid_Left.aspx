<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Div_Mid_Left.aspx.cs" Inherits="Web.Admin.Div_Mid_Left" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/HrSys.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%; height:100%">
        <tr style="height:26px">
            <td align="center" class="Img_bg">题库管理</td>
        </tr>
        <tr>
            <td style="height:1px" class="A_td"></td>
        </tr>
        <tr>
            <td>
                <div style="margin:5px">
                <asp:TreeView ID="tv_Cms" runat="server" ImageSet="Arrows" CssClass="text_12px">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="选择题" Value="选择题" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=题库管理&TitleType=单选" Target="Iframe_Div_Mid_Mid">
                            <asp:TreeNode Text="单选" Value="单选" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=题库管理&TitleType=单选" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                            <asp:TreeNode Text="多选" Value="多选" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=题库管理&TitleType=多选" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                            <asp:TreeNode Text="不定项选" Value="不定项选" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=题库管理&TitleType=不定项选" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="判断题" Value="判断题" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=题库管理&TitleType=判断题" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        <asp:TreeNode Text="值选项" Value="值选项" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=题库管理&TitleType=值选项" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
                </div>
            </td>
        </tr>
        <tr style="height:26px">
            <td class="Img_bg" align="center">试卷制作</td>
        </tr>
        <tr>
            <td style="height:1px" class="A_td"></td>
        </tr>
        <tr>
            <td>
                <div style="margin:5px">
                <asp:TreeView ID="TreeView2" runat="server" ImageSet="Arrows" CssClass="text_12px">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="问卷" Value="问卷" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=试卷制作&TitleType=问卷" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        <asp:TreeNode Text="试卷" Value="试卷" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=试卷制作&TitleType=试卷" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
                </div>
            </td>
        </tr>
        <tr style="height:26px">
            <td class="Img_bg" align="center">试卷管理</td>
        </tr>
        <tr>
            <td style="height:1px" class="A_td"></td>
        </tr>
        <tr>
            <td>
                <div style="margin:5px">
                <asp:TreeView ID="TreeView3" runat="server" ImageSet="Arrows" CssClass="text_12px">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="问卷" Value="问卷" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=试卷管理&TitleType=问卷" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        <asp:TreeNode Text="试卷" Value="试卷" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=试卷管理&TitleType=试卷" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
                </div>
            </td>
        </tr>
        <tr style="height:26px">
            <td class="Img_bg" align="center">成绩管理</td>
        </tr>
        <tr>
            <td style="height:1px" class="A_td"></td>
        </tr>
        <tr>
            <td>
                <div style="margin:5px">
                <asp:TreeView ID="TreeView4" runat="server" ImageSet="Arrows" CssClass="text_12px">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="按时间查" Value="按时间查" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=试卷管理&TitleType=按时间查" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        <asp:TreeNode Text="按学员查" Value="按学员查" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=试卷管理&TitleType=按学员查" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        <asp:TreeNode Text="按课程查" Value="按课程查" NavigateUrl="~/Admin/Div_Mid_Right.aspx?BigClass=成绩管理&TitleType=按课程查" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
                </div>
            </td>
        </tr>
        <%--<tr style="height:26px">
            <td class="Img_bg" align="center">系统管理</td>
        </tr>
        <tr>
            <td style="height:1px" class="A_td"></td>
        </tr>
        <tr>
            <td>
                <div style="margin:5px">
                <asp:TreeView ID="TreeView1" runat="server" ImageSet="Arrows" CssClass="text_12px">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="用户系统" Value="用户系统" NavigateUrl="" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        <asp:TreeNode Text="课程系统" Value="课程系统" NavigateUrl="" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                        <asp:TreeNode Text="考试系统" Value="考试系统" NavigateUrl="" Target="Iframe_Div_Mid_Mid"></asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
                </div>
            </td>
        </tr>--%>
    </table>
    </div>
    </form>
</body>
</html>
