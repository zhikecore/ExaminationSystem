<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Web.ResultsManagement.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
成绩管理：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
    <asp:ImageButton ID="imgbt_Back" runat="server" ImageUrl="~/Images/Back.jpg" 
        onclick="imgbt_Back_Click" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
    <div style="margin:5px; float:left; width:100%">
        <asp:GridView ID="gv01" runat="server" 
            CssClass="table_Box" Width="95.9%" GridLines="None" 
            AutoGenerateColumns="False" ShowHeader="False">
            <RowStyle Height="30px" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table class="text_12px" style="width:100%">
                            <tr>
                                <td align="right">姓名：</td>
                                <td><%#Eval("UserName")%></td>
                            </tr>
                            <tr>
                                <td align="right">试卷名：</td>
                                <td><%#Eval("PapersName")%></td>
                            </tr>
                            <tr>
                                <td align="right">考试时间：</td>
                                <td><%=Request.QueryString["Time"] %></td>
                            </tr>
                            <tr>
                                <td align="right">得分：</td>
                                <td><%#Eval("Score")%></td>
                            </tr>
                            <tr>
                                <td align="right">总分：</td>
                                <td><%#Eval("SysScore")%></td>
                            </tr>
                            <tr>
                                <td align="right">成绩：</td>
                                <td><%#Eval("Percentage")%></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
