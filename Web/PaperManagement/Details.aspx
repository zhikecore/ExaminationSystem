<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Web.PaperManagement.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
<%=Request.QueryString["TitleType"]%>详细内容
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
<a href="List<%=Request.QueryString["TitleType"]%>-<%=Request.QueryString["CourseID"]%>.html"><img id="imgid" runat="server" alt="返回" src="../Images/Back.jpg" border="0" /></a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
    <script language="javascript" type="text/javascript">
        function xiugroup(ID) {
            theDes = "width=" + window.screen.availWidth + ",height=" + window.screen.availHeight + ",channelmode,status=no,scrollbars=yes,copyhistory=yes,fullscreen=yes,top=0,left=0,location=no,menubar=no,resizable=yes,titlebar=no,toolbar=no,directories=no";
            //newopen = window.showModalDialog("Test.aspx?ID=" + ID, "在线考试...", "dialogWidth='" + window.screen.availWidth + "';dialogHeight='" + window.screen.availHeight + "'");
            newopen = window.open("Test.aspx?ID=" + ID + "&U=1", "newwindow", theDes);
        }
    </script>
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
    <div style="margin:5px; width:100%; text-align: center;">
        <asp:Label ID="lb_Name" runat="server" CssClass="title_14px"></asp:Label>
        <span id="spanid" runat="server"><span style="cursor:hand" onclick="xiugroup('<%=Request.QueryString["ID"]%>')">[考试卷预览]</span></span>
    </div>
    <div style="margin:5px; float:left; width:100%">
    <iframe id="myIframe" runat="server" scrolling="auto" frameborder="0" width="95%" height="600px"></iframe>
    </div>
</asp:Content>