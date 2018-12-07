<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Web.PaperManagement.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
试卷管理：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
<a href="/PaperProduction/Add.aspx?TitleType=<%=Request.QueryString["TitleType"]%>&CourseID=<%=CourseID%>"><img alt="添加" src="../Images/Add.jpg" border="0" /></a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">
    <script language="javascript" type="text/javascript">
        function xiugroup(TitleType, CourseID, ID) {
            //theDes = "height=600,width=600,top=0,left=0,location=no,menubar=no,resizable=yes,scrollbars=yes,status=yes,titlebar=no,toolbar=no,directories=no";
            //theDes = "dialogWidth:" + window.screen.availWidth + ";dialogHeight:" + window.screen.availHeight + ";help:no;scroll:no;status:no";
            theDes = "fullscreen=yes,toolbar=no,scrollbars=no,resizable=no,location=no,status=no,menubar=no,top=0,left=0";
            newopen = window.open("Details" + TitleType + "-" + CourseID + "-" + ID + ".html", "newwindow", theDes);
        }
    </script>
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label><asp:Label ID="lb_CourseID" runat="server" Text="0" Visible="false"></asp:Label>
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
    <div style="margin:5px; float:left; width:100%">
        <asp:GridView ID="gv01" runat="server" AutoGenerateColumns="False" 
            CssClass="table_Box" Width="95.9%" DataKeyNames="ID" GridLines="Horizontal" 
            onrowdeleting="gv01_RowDeleting" ShowHeader="False" 
            onrowdatabound="gv01_RowDataBound">
            <RowStyle Height="30px" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/arrow.gif" alt="试卷名称" />&nbsp;
                    <%--<span style="cursor:hand" onclick="xiugroup('<%=Request.QueryString["TitleType"]%>',<%=CourseID%>,<%#Eval("ID") %>)"><%#Eval("Name") %></span>--%>
                    <a href="Details.aspx?TitleType=<%=Request.QueryString["TitleType"]%>&CourseID=<%=CourseID%>&ID=<%#Eval("ID") %>"><%#Eval("Name") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="hl_Lock" runat="server" CssClass="text_12px" Text='<%#Eval("Lock") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" 
                                DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定更改吗？')&quot;&gt;[更改]&lt;/div&gt; " />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_Updata" runat="server" CssClass="text_12px" Text="修改" Visible="false"></asp:HyperLink>
                        &nbsp;<asp:HyperLink ID="hl_Del" runat="server" CssClass="text_12px" Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt; " Visible="false"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
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
    <div style="margin:5px; float:left; width:100%" class="text_12px">
    <img src="../Images/Lock_OFF.jpg" alt="开锁" />：处于开放状态。可以进行修改跟删除操作！<br />
    <img src="../Images/Lock_ON.jpg" alt="锁定" />：处于锁定状态。不得进行任何操作！<br />
    任何试卷(问卷)发布成功后，系统会自动把他锁定。只有锁定后的试卷(问卷)才能交付学员进行考试！<br />
    如果你对试卷(问卷)进行“开锁”操作后，请务必再将它锁定！
    </div>
</asp:Content>
