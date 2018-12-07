<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Web.ResultsManagement.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
成绩管理：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
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
    <div id="div_Course" visible="false" runat="server" style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
    <div style="margin:5px; float:left; width:100%">
        <asp:GridView ID="gv01" runat="server" 
            CssClass="table_Box" Width="95.9%" GridLines="Horizontal" 
            onrowdatabound="gv01_RowDataBound" AutoGenerateColumns="False">
            <RowStyle Height="30px" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="姓名" />
                <asp:BoundField DataField="PapersName" HeaderText="试卷名" />
                <asp:BoundField DataField="Score" HeaderText="得分" />
                <asp:BoundField DataField="SysScore" HeaderText="总分" />
                <asp:BoundField DataField="Percentage" HeaderText="成绩" ItemStyle-ForeColor="Red" />
                <asp:BoundField DataField="Time" HeaderText="考试时间" />
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
    </div>
</asp:Content>