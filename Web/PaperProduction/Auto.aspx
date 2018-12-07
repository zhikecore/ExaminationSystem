<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="Auto.aspx.cs" Inherits="Web.PaperProduction.Auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
试卷制作：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
<a href="Add.aspx?TitleType=<%=Request.QueryString["TitleType"]%>&CourseID=<%=CourseID%>"><img alt="返回" src="../Images/Back.jpg" border="0" /></a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_Name" runat="server" CssClass="title_14px">名称：</asp:Label><asp:Label ID="lb_CourseID" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:TextBox ID="tb_Name" runat="server" CssClass="table_Bottom" Width="500px" Height="22px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="*" ControlToValidate="tb_Name" CssClass="text_12px" 
            ValidationGroup="2"></asp:RequiredFieldValidator>
    </div>
    <div style="margin:5px; width:100%">
    <asp:RadioButtonList ID="rbl_Extent" runat="server" CssClass="text_12px" 
        RepeatColumns="3" AutoPostBack="True" 
            onselectedindexchanged="rbl_Extent_SelectedIndexChanged">
        <asp:ListItem>简单</asp:ListItem>
        <asp:ListItem>适中</asp:ListItem>
        <asp:ListItem>困难</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <div style="margin:5px; float:left; width:100%">
    <table class="table_Box" style="background-color:#EFEFEF">
        <tr>
            <td>类型</td>
            <td>是否选择</td>
            <td>总数</td>
            <td align="center">选择条数<br /><span style="font-size:10px; color:Blue">小于总数</span></td>
            <td>每条分值</td>
        </tr>
        <tr>
            <td>单选</td>
            <td><asp:CheckBox ID="CheckBox1" runat="server" CssClass="text_12px" /></td>
            <td><asp:Label ID="Label1" runat="server" CssClass="text_12px" Text="(先选择难易度)" ForeColor="Red"></asp:Label></td>
            <td><asp:TextBox ID="tb_1" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
            <td><asp:TextBox ID="tb_1_1" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>多选</td>
            <td><asp:CheckBox ID="CheckBox2" runat="server" CssClass="text_12px" /></td>
            <td><asp:Label ID="Label2" runat="server" CssClass="text_12px" Text="(先选择难易度)" ForeColor="Red"></asp:Label></td>
            <td><asp:TextBox ID="tb_2" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
            <td><asp:TextBox ID="tb_2_2" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>不定项选</td>
            <td><asp:CheckBox ID="CheckBox3" runat="server" CssClass="text_12px" /></td>
            <td><asp:Label ID="Label3" runat="server" CssClass="text_12px" Text="(先选择难易度)" ForeColor="Red"></asp:Label></td>
            <td><asp:TextBox ID="tb_3" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
            <td><asp:TextBox ID="tb_3_3" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>判断题</td>
            <td><asp:CheckBox ID="CheckBox4" runat="server" CssClass="text_12px"/></td>
            <td><asp:Label ID="Label4" runat="server" CssClass="text_12px" Text="(先选择难易度)" ForeColor="Red"></asp:Label></td>
            <td><asp:TextBox ID="tb_4" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
            <td><asp:TextBox ID="tb_4_4" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>值选项</td>
            <td><asp:CheckBox ID="CheckBox5" runat="server" CssClass="text_12px" /></td>
            <td><asp:Label ID="Label5" runat="server" CssClass="text_12px" Text="(先选择难易度)" ForeColor="Red"></asp:Label></td>
            <td><asp:TextBox ID="tb_5" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
            <td><asp:TextBox ID="tb_5_5" runat="server" CssClass="table_Box" Height="20px" ValidationGroup="5" Width="40px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="5"><asp:Label ID="lb_Msg" runat="server" CssClass="text_12px" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="5" align="right">
                <asp:Button ID="bt_Che" runat="server" Text="检查" CssClass="table_Box" Width="60px" Height="30px" onclick="bt_Che_Click" ValidationGroup="5" />
                <asp:Button ID="bt_Yes" runat="server" Text="添加" CssClass="table_Box" Width="60px" Height="30px" onclick="bt_Yes_Click" Visible="false" />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>