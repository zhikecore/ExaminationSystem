<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.Admin.Index" %>



<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/HrSys.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" language="javascript">
    //窗口最大化
    function winSizer()
        {
            windowWidth = window.screen.availWidth;
            windowHeight = window.screen.availHeight;
            window.moveTo(0,0);
            window.resizeTo(windowWidth, windowHeight);
            Div_Mid.style.height = window.screen.availHeight - 190;
            //alert(window.screen.availHeight);
            //加入收藏
            //window.external.AddFavorite('http://www.net717.com', '惠州众网');
        }
</script>
<body onload="winSizer()" class="A_body">
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
            <tr>
                <td style="height:56px" align="center" class="Img_top">
                <table border="0" cellpadding="0" cellspacing="0" style="width:900px; height:100%" class="text_12px">
                    <tr>
                        <td>欢迎<span style="color:Red">　</span>　您的权限是：<span style="color:Red"></span>　</td>
                        <td><asp:ImageButton ID="bt_logout" runat="server" 
                                ImageUrl="~/Images/logout.gif" onclick="bt_logout_Click" /></td>
                        <td></td>
                        <td style="width:200px" align="left"><asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></td>
                        <td>关于我们 | 服务指南 | 内容检索 | <a href="../Admin/Index.aspx">系统管理</a></td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="Div_Mid" runat="server" style="width:100%; margin-bottom:5px">
        <div id="Div_Mid_Left" runat="server" style="float:left;margin:5px; background-color:White">
            <table border="0" cellpadding="0" cellspacing="0" style="width:100%; height:100%">
                <tr>
                    <td valign="top" style="height:100%" class="A_table">
                    <iframe id="Iframe_Div_Mid_Left" name="Iframe_Div_Mid_Left" title="Iframe_Div_Mid_Left" src="Div_Mid_Left.aspx" runat="server" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
                    </td>
                </tr>
            </table>
        </div>
        <div id="Div_Mid_Mid" runat="server" style="float:left;margin-top:5px; margin-bottom:5px; margin-right:5px; background-color:White">
            <table border="0" cellpadding="0" cellspacing="0" style="width:100%; height:100%">
                <tr>
                    <td valign="top" style="height:100%" class="A_table">
                    <iframe id="Iframe_Div_Mid_Mid" name="Iframe_Div_Mid_Mid" title="Iframe_Div_Mid_Mid" src="Div_Mid_Mid.aspx" runat="server" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
                    </td>
                </tr>
            </table>
        </div>
        <div id="Div_Mid_Right" runat="server" style="margin-top:5px; margin-bottom:5px; background-color:White; float:right">
            <table border="0" cellpadding="0" cellspacing="0" style="width:100%; height:100%">
                <tr>
                    <td valign="top" style="height:100%">
                    <iframe id="Iframe_Div_Mid_Right" name="Iframe_Div_Mid_Right" title="Iframe_Div_Mid_Right" src="Div_Mid_Right.aspx" runat="server" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
            <tr>
                <td style="height:27px" align="center" class="Img_top">
                <table border="0" cellpadding="0" cellspacing="0" style="width:900px; height:100%" class="text_12px">
                    <tr>
                        <td>关于我们 | 服务指南 | 内容检索</td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>