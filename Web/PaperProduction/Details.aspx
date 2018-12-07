﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Web.PaperProduction.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
试题浏览：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
    <div style="margin:5px; float:left; width:100%">
        <table class="text_12px" cellpadding="3" cellspacing="3">
            <tr>
                <td style="width:40px" valign="top">题目：</td>
                <td>　　<asp:Label ID="lb_Title" runat="server" CssClass="table_Bottom"></asp:Label></td>
                <td>　<asp:Label ID="lb_T_F" runat="server" CssClass="text_12px" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:GridView ID="gv_01" runat="server" CssClass="table_Box" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="选项" />
                            <asp:BoundField DataField="T_F" HeaderText="标识" />
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td valign="top">分析：</td>
                <td><asp:Label ID="lb_Analysis" runat="server" CssClass="text_12px"></asp:Label></td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>