<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Web.ItemBankManagement.Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
题库管理：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
<a href="List.aspx?TitleType=<%=Request.QueryString["TitleType"]%>&CourseID=<%=Request.QueryString["CourseID"]%>"><img alt="返回" src="../Images/Back.jpg" border="0" /></a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
    <div style="margin:5px; float:left; width:100%">
    <iframe id="myIframe" runat="server" scrolling="auto" frameborder="0" width="97%" height="600px"></iframe>
    </div>
</asp:Content>
