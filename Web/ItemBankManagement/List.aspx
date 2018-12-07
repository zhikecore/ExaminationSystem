<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Web.ItemBankManagement.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
题库管理：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
<%--<a href="Add<%=Request.QueryString["TitleType"]%>-<%=Request.QueryString["CourseID"]%>.html"><img alt="添加" src="../Images/Add.jpg" border="0" /></a>--%>
    <a href="Add.aspx?TitleType=<%=Request.QueryString["TitleType"]%>&CourseID=<%=Request.QueryString["CourseID"]%>"><img alt="添加" src="../Images/Add.jpg" border="0" /></a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
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
    <div style="margin:5px; width:100%">
        <asp:RadioButtonList ID="rbl_Extent" runat="server" CssClass="text_12px" 
            RepeatColumns="3" AutoPostBack="true">
            <asp:ListItem>简单</asp:ListItem>
            <asp:ListItem>适中</asp:ListItem>
            <asp:ListItem>困难</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div style="margin:5px; float:left; width:100%">
        <asp:GridView ID="gv01" runat="server" AutoGenerateColumns="False" 
            CssClass="table_Box" Width="95.9%" DataKeyNames="ID" GridLines="Horizontal" 
            onrowdeleting="gv01_RowDeleting" ShowHeader="False" 
            onrowdatabound="gv01_RowDataBound">
            <RowStyle Height="30px" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/arrow.gif" alt="题目" />&nbsp;<a href="Details.aspx?TitleType=<%=Request.QueryString["TitleType"]%>&CourseID=<%=Request.QueryString["CourseID"]%>&ID=<%#Eval("ID") %>"><%#Eval("Title") %></a>
                        (<%#Eval("Extent")%>)
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" 
                                DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;[删除]&lt;/div&gt; " />
            </Columns>
        </asp:GridView>
    </div>
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
    <br />
    
    <span class="text_12px">* 删除题目时也删除该题目下的选项！</span>
    </div>
</asp:Content>