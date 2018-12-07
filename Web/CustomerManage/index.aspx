<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web.CustomerManage.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/JS/jquery-easyui/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/JS/jquery-easyui/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/JS/jquery-easyui/demo/demo.css" />
    <link href="../JS/subNavBox/css/zzsc.css" rel="stylesheet" />
    <script src="../JS/jquery-easyui/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/JS/jquery-easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height: 60px; background: #B3DFDA; padding: 10px"><%--north region--%></div>
    <div data-options="region:'west',split:true,title:'导航'" style="width: 226px; padding: 10px;">
        <div class="subNavBox">
            <div class="subNav">客户公司管理</div>
            <ul class="navContent ">
                <li><a href="javascript:" data_url="/CustomerManage/CustomerList.aspx">公司列表</a></li>
                <li><a href="javascript:" data_url="/CustomerManage/CustomerEdit.aspx">添加公司</a></li>
            </ul>
            <div class="subNav">公司员工管理  </div>
            <ul class="navContent">
                <li><a href="javascript:" data_url="/CustomerManage/CustomerList.aspx">员工管理</a></li>
            </ul>
        </div>

    </div>
    <div id="contents" data-options="region:'center',title:'内容'">

    </div>

    <script type="text/javascript">
        $(function () {
            $(".subNav").click(function () {
                $(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd")
                $(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt")

                // 修改数字控制速度， slideUp(500)控制卷起速度
                $(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
            })

            $(".subNavBox li a").click(function () {
                //$("#contents").load($(this).attr("data_url"));
                var strHtml = "";
                var url = $(this).attr("data_url");
                var strHtml = '<iframe src="' + url + '" width="100%" height="100%" id="myiframe" scrolling="auto" frameborder="0"></iframe>';
                $("#contents iframe").remove();
                $("#contents").append(strHtml);
            })
        })
    </script>
</body>
</html>
