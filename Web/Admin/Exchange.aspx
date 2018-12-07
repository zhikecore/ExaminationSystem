<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exchange.aspx.cs" Inherits="Web.Admin.Exchange" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%; height:100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" valign="middle">
                <table style="width:512px; height:386px; background-image:url(../Images/05.jpg)" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="height:20%" class="title_14px" align="left" valign="middle">
                        　　　　　　<%=Request.QueryString["BigClass"]%>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:50%" align="center" valign="middle">
                        <span style="font-size:50px; font-family:宋体"><%=Request.QueryString["TitleType"]%></span>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:40%" class="text_12px" align="center" valign="top">--请先选择课程体系！--</td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    </div>
    </form>
</body>
</html>
