<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<script type="text/javascript" language="javascript">
    //窗口最大化
    function winSizer() {
        windowWidth = window.screen.availWidth;
        //        location.href = "Login.aspx?MyWidth=" + windowWidth;
        //location.href = "/sAdmin/Index.html";
        location.href = "/Admin/Jump.aspx";
    }
</script>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
</body>
</html>
