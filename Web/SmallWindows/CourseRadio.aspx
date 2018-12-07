<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseRadio.aspx.cs" Inherits="Web.SmallWindows.CourseRadio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>课程</title>

    <script type="text/javascript">

        function pageLoad() {
        }

        function MyClose(str) {
            window.returnValue = str;
            self.close();
        }

        function fn_gv_01_checkbox(ID) {
            //alert(ID);
            window.returnValue = ID;
            self.close();
        }
    </script>

    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table class="text_12px" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="../Images/PNG/folder.png" alt="课程" />
            </td>
            <td class="title_14px">
                课程课程
            </td>
        </tr>
    </table>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>        
            <table border="0" cellpadding="0" cellspacing="2" class="table_Box" style="width: 100%">
                <tr>
                    <td align="left" valign="top" style="width: 25px">
                        <asp:TreeView ID="TreeView1" runat="server" CssClass="text_12px" CollapseImageUrl="~/Images/folders.gif"
                            ExpandImageUrl="~/Images/folder.gif" ShowLines="True" Width="100%" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                            <ParentNodeStyle ImageUrl="~/Images/folders.gif" />
                            <HoverNodeStyle BorderStyle="None" BackColor="#CCDDEE" />
                            <RootNodeStyle ImageUrl="~/Images/folders.gif" />
                            <NodeStyle HorizontalPadding="8px" ImageUrl="~/Images/folder.gif" />
                        </asp:TreeView>
                        <asp:Label ID="lb_Msg" runat="server" CssClass="text_12px" ForeColor="Red"></asp:Label>
                    </td>
                    <td align="center" valign="middle">
                        <img src="../Images/15.jpg" />
                    </td>
                    <td align="left" valign="top" style="width: 75%">
                        <table style="width: 100%" class="text_12px">
                            <tr>
                                <td>
                                    <asp:Label ID="lb_Title" runat="server" CssClass="title_14px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="gv_01" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                        DataKeyNames="ID" Width="100%" BorderColor="#999999" BorderWidth="1px"
                                        OnRowDataBound="gv_01_RowDataBound">
                                        <RowStyle Font-Names="宋体" Font-Size="12px" ForeColor="#666666" Height="20px" />
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                SortExpression="ID" Visible="False" />
                                            <asp:TemplateField >
                                                <ItemTemplate>
                                                    <input type="checkbox" value='<%# Eval("ID")%>' runat="server" onclick="fn_gv_01_checkbox(this.value)" id="gv_01_checkbox" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="序号">
                                                <ItemTemplate>
                                                        <%# (Container.DataItemIndex+1).ToString()%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="9%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="名称">
                                                <ItemTemplate>
                                                        <%# Eval("Title")%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="65%" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Money" HeaderText="费用">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="12%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Credit" HeaderText="学分">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="9%" />
                                            </asp:BoundField>
                                        </Columns>
                                        <FooterStyle Font-Names="宋体" Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle BackColor="#EAEEF7" Font-Names="宋体" Font-Size="14px" Height="25px" HorizontalAlign="Center"
                                            VerticalAlign="Middle" />
                                        <EditRowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#999999" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="center"><img src="../Images/23.jpg" /></td>
                            </tr>
                            <tr>
                                <td class="text_12px">已选择：</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="gv_02" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                        DataKeyNames="ID" Width="100%" BorderColor="#999999" BorderWidth="1px"
                                        OnRowDataBound="gv_01_RowDataBound">
                                        <RowStyle Font-Names="宋体" Font-Size="12px" ForeColor="#666666" Height="20px" />
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                SortExpression="ID" Visible="False" />
                                            <asp:TemplateField >
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="gv_02_ImageButton1" runat="server" ImageUrl="~/Images/del.gif" ToolTip='<%# Eval("ID")%>' onclick="gv_02_ImageButton1_Click" />
                                                    <%--<input type="radio" name="r1" id="id" onclick="MyClose('<%# Eval("Title")%>','<%# Eval("ID")%>')" />--%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="序号">
                                                <ItemTemplate>
                                                        <%# (Container.DataItemIndex+1).ToString()%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="9%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="名称">
                                                <ItemTemplate>
                                                        <%# Eval("Title")%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="65%" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Money" HeaderText="费用">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="12%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Credit" HeaderText="学分">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="9%" />
                                            </asp:BoundField>
                                        </Columns>
                                        <FooterStyle Font-Names="宋体" Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle BackColor="#EAEEF7" Font-Names="宋体" Font-Size="14px" Height="25px" HorizontalAlign="Center"
                                            VerticalAlign="Middle" />
                                        <EditRowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#999999" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" id="submit1" title='<%=str_returnValue %>' value="完成" style="width:60px; height:30px" class="table_Box" onclick="MyClose('<%=str_returnValue %>')" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div style="display:none">
     <asp:Label ID="lb_CourseID" runat="server" Text=""></asp:Label>
    <asp:Button ID="bt_fn_gv_01_checkbox" runat="server" Text="Button" 
                onclick="bt_fn_gv_01_checkbox_Click" />             
            <asp:Label ID="lb_wen" runat="server"></asp:Label>
            </div>
          
        </ContentTemplate>
    </asp:UpdatePanel>  

    </form>
</body>
</html>
