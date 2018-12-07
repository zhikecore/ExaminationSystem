<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaperAuthorManage.aspx.cs" Inherits="Web.CustomerManage.PaperAuthorManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../JS/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../JS/jquery-1.11.2.min.js"></script>
    <script src="../JS/bootstrap/js/bootstrap.min.js"></script>
    <script src="../JS/Company_Common.js"></script>
    <style>
        html, body {
            /*height: 100%;*/
            width: 100%;
            margin: 0;
            padding: 0;
        }

        #form1 {
            /*height: 100%;*/
            width: 100%;
        }

        .content {
            /*height: 100%;*/
            width: 100%;
            border: 1px solid #ddd;
        }

        .content_left, .content_right {
            float: left;
            /*height: 100%;*/
            /*transition: all 1s;*/
        }

        .content_left {
            width: 100%;
        }

        .content_right {
            width: 0;
        }
    </style>
    <style type="text/css">
        .x-panel-header-text {
            font-size: 24px;
            font-weight: bold;
        }

        .x-btn-inner {
            color: #444;
            font-weight: bold;
            margin-left: 5px;
            cursor: pointer;
        }

        #action span:hover {
            background: #EED5B7;
        }

        .companylit {
            margin-left: 12px;
        }

        a {
            color: #D15FEE;
            cursor: pointer;
        }
    </style>

    <style type="text/css">
        table.imagetable {
            font-family: verdana,arial,sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
        }

            table.imagetable thead td {
                /*background: #b5cfd2 url('cell-blue.jpg');*/
                /*border-width: 1px;*/
                padding: 8px;
                /*border-style: solid;*/
                border-color: #999999;
                font-weight: bold;
            }

            table.imagetable tbody td {
                /*background: #dcddc0 url('cell-grey.jpg');*/
                /*border-width: 1px;*/
                padding: 8px;
                /*border-style: solid;*/
                border-color: #999999;
            }

        .imagetable tbody tr:hover {
            background: #dcddc0;
        }

        .imagetable {
            table-layout: fixed;
        }

            .imagetable td {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

        .selPaper {
            background: #dcddc0;
        }

        table.editAuthor {
            font-family: verdana,arial,sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
        }

            table.editAuthor tbody td {
                /*background: #dcddc0 url('cell-grey.jpg');*/
                /*border-width: 1px;*/
                padding: 8px;
                /*border-style: solid;*/
                border-color: #999999;
            }

        .verify {
            background: #EEB4B4;
        }

        .disabled {
            disabled: disabled;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
            <div class="content_left">
                <div style="border-bottom: 1px solid #999999; padding: 6px">
                    <span class="x-panel-header-text">已授权列表</span>
                </div>
                <div id="action" style="border-bottom: 1px solid #999999; padding: 10px">
                    <span id="addAuthor" class="x-btn-inner"><a style="text-decoration: none" href="javascript:">增加授权</a></span>
                    <span>
                        <a class="x-btn-inner">修改授权</a>
                    </span>
                    <span>
                        <a style="text-decoration: none; color: #87CEFA" href="/CustomerManage/CustomerList.aspx" class="x-btn-inner">企业列表</a>
                    </span>
                </div>
                <div style="width: 100%">
                    <table style="width: 100%" class="imagetable">
                        <thead>
                            <tr id="tr_title">
                                <td style="width: 15%">授权名称</td>
                                <td>状态</td>
                                <td>授权总数</td>
                                <td>已使用/已分配</td>
                                <td>开通时间</td>
                                <td>截止时间</td>
                                <td>创建时间</td>
                                <td>授权人</td>
                                <td>操作</td>
                            </tr>
                        </thead>
                        <tbody id="tr_List">
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="content_right" style="display: none">
                <div style="border-bottom: 1px solid #999999; padding: 6px">
                    <span class="x-panel-header-text">问卷列表</span>
                </div>
                <div style="border-bottom: 1px solid #999999; padding: 10px">
                    <span id="join" class="x-btn-inner" style="color: #D15FEE;">加入</span>
                    <span style="float: right">
                        <a class="x-btn-inner colse_btn" style="color: #87CEFA">关闭</a>
                    </span>
                </div>
                <div style="width: 100%">
                    <table style="width: 100%" class="imagetable">
                        <thead>
                            <tr>
                                <td style="width: 60%">试卷名称</td>
                                <td>类型</td>
                                <%--<td>操作</td>--%>
                            </tr>
                        </thead>
                        <tbody id="tr_paperList">
                        </tbody>
                    </table>
                </div>
            </div>
            <%--授权信息添加--%>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span id="close_modal" aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">添加授权</h4>
                        </div>
                        <div class="modal-body">
                            <table id="editAuthor" width="100%" class="editAuthor">
                                <tr>
                                    <td>产品名称:</td>
                                    <td id="Title">
                                        <input style="width: 100%" type="text" id="edit_Title" /></td>
                                </tr>
                                <tr>
                                    <td>永久授权:</td>
                                    <td id="IsLongTime">
                                        <input type="checkbox" id="edit_IsLongTime" class="checkc" /></td>
                                </tr>
                                <tr>
                                    <td>开通时间:</td>
                                    <td id="StartTime">
                                        <input style="width: 100%" type="date" id="edit_StartTime" /></td>
                                </tr>
                                <tr>
                                    <td>到期时间:</td>
                                    <td id="EndTime">
                                        <input style="width: 100%" type="date" id="edit_EndTime" /></td>
                                </tr>
                                <tr>
                                    <td>开通数量:</td>
                                    <td id="Num">
                                        <input style="width: 100%" type="number" id="edit_Num" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button id="saveAuthor" type="button" class="btn btn-primary">保存</button>
                        </div>
                    </div>
                </div>
            </div>
            <%--权限分配--%>
            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span id="close_modal1" aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel1">权限分配</h4>
                        </div>
                        <div class="modal-body">
                           <table id="employeeList" class="editAuthor">
                                <tr>
                                    <td>王五</td>
                                    <td>
                                        <input type="checkbox" class="checkc" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button id="saveEmployeeAuthor" type="button" class="btn btn-primary">保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

<script>
    var PaperID;
    $("#addAuthor").click(function () {
        $(".content_right").css({
            "width": "50%",
            "border-left": "1px solid #ddd",
            "display": "block"
        });
        $(".content_left").css("width", "50%");
    })
    $(".colse_btn").click(function () {
        $(".content_right").css({
            "width": "0%",
            "display": "none"
        });
        $(".content_left").css("width", "100%");
    })
    $("#join").click(function () {//加入授权
        PaperID = "";
        $("#tr_paperList tr").each(function (i, item) {
            if ($(this).hasClass("selPaper")) {
                PaperID = $(this).attr("id");

                var data = {
                    action: "GetPaperInfo",
                    PaperID: PaperID
                }
                var url = "/tools/ajax_CUstomerManage.ashx";
                var result = ajaxFunObj(data, url);
                if (result != null) {
                    $("#edit_Title").val(result[0].Name + "_" + formatDate(getnowtime()));
                }
            }
        })
        if (PaperID == "") {
            alert("请选择一个需要授权的问卷");
        } else {
            $("#myModal").modal();
        }
    })
</script>

<script type="text/javascript">
    var verify = false;
    var AuthorID;
    var PaperID1;
    $(function () {
        GetAuthorList();
        GetPaperList();
        selPaper();
        saveAuthor();
        IsAuthor();
        deleteAuthor();
        addEmployeeAuthor();
    })

    //获取试卷列表
    function GetPaperList() {
        var data = {
            action: "GetPaperList"
        }
        var url = "/tools/ajax_CUstomerManage.ashx";
        var result = ajaxFunObj(data, url);
        if (result != null) {
            var strHtml = "";
            $.each(result, function (i, item) {
                strHtml += '<tr id="' + item.ID + '"><td style="font-weight:bold">' + item.Name + '</td><td>调查问卷</td>';
                //strHtml += '<td><span><a href="javascript:">编辑</a></span>&nbsp;';
                //strHtml += '<span id="sp_' + item.ID + '"><a href="javascript:">删除</a></span>&nbsp;';
                //strHtml += '</td>';
                strHtml += '</tr>';
            })
            $("#tr_paperList").append(strHtml);
        }
    }

    //获取授权列表
    function GetAuthorList() {
        var data = {
            action: "GetAuthorList",
            CompanyID: getUrlParam("CompanyID")
        }
        var url = "/tools/ajax_CUstomerManage.ashx";
        var result = ajaxFunObj(data, url);
        if (result != null) {
            var strHtml = "";
            $.each(result, function (i, item) {
                strHtml += '<tr id="' + item.ID + '"><td style="font-weight:bold;">' + item.Title + '</td>';
                if (item.IsLongTime == "True") {
                    strHtml += '<td style="color:#32CD32">无限期</td>';
                } else {
                    if (checkEndTime(getnowtime(), item.EndTime)) {
                        strHtml += '<td style="color:#00FFFF">未过期</td>';
                    } else {
                        strHtml += '<td>已过期</td>';
                    }
                }

                strHtml += '<td>' + item.Num + '</td>';
                strHtml += '<td>' + item.Used + '/' + item.Assigned + '</td>';
                if (item.IsLongTime == "True") {
                    strHtml += '<td>--</td><td>--</td>';
                }
                else {
                    strHtml += '<td>' + formatDate(item.StartTime) + '</td><td>' + formatDate(item.EndTime) + '</td>';
                }
                strHtml += '<td>' + item.CreateDateTime + '</td><td></td>';
                strHtml += '<td><span><a href="javascript:">编辑</a></span>&nbsp;';
                strHtml += '<span id="del_' + item.ID + '"><a href="javascript:">删除</a></span>&nbsp;';
                strHtml += '<span id="au_' + item.ID + '" data_paper="' + item.PaperID + '"><a href="javascript:">权限分配</a></span>&nbsp;';
                strHtml += '</td>';
                strHtml += '</tr>';
            })
            $("#tr_List").append(strHtml);
        }
    }

    //试卷选择
    function selPaper() {
        $(document).on("click", "#tr_paperList tr", function () {
            $(this).addClass("selPaper").siblings().removeClass("selPaper");
        })
    }

    //删除/权限分配
    function deleteAuthor() {
        $(document).on("click", "#tr_List span[id]", function () {
            if ($(this).attr("id").split("_")[0] == "del") {//删除
                if (confirm("是否删除？")) {
                    var ID = $(this).attr("id").split("_")[1];
                    var data = {
                        action: "deleteAuthor",
                        ID: ID
                    }
                    var url = "/tools/ajax_CUstomerManage.ashx";
                    var result = ajaxFunObj(data, url);
                    if (result.status == 1) {
                        alert(result.msg);
                        $("#tr_List tr").remove();
                        GetAuthorList();
                    } else {
                        alert(result.msg);
                    }
                }
            } else {//权限分配
                var ID = $(this).attr("id").split("_")[1];
                AuthorID = ID;//试卷授权ID
                PaperID1 = $(this).attr("data_paper");//试卷ID
                var data = {
                    action: "GetEmployeeList",
                    ID: getUrlParam("CompanyID")
                }
                var url = "/tools/ajax_CUstomerManage.ashx";
                var result = ajaxFunObj(data, url);
                if (result != null) {
                    var strID = GetAuthorEmployee(ID);
                    var strHtml = "";
                    $.each(result, function (i, item) {
                        //if (strID.indexOf(item.ID)!=-1) {//判断有没有授权员工
                        //    strHtml += '<tr><td style="color:red">' + item.Name + '</td><td></td></tr>';
                        //} else {
                        //    strHtml += '<tr id="' + item.ID + '"><td>' + item.Name + '</td><td><input id="chk_' + item.ID + '" type="checkbox" class="checkc" /></td></tr>';
                        //}
                        if (strID.indexOf(item.ID) != -1) {
                            strHtml += '<tr><td style="color:red">' + item.Name + '</td><td></td></tr>';
                        }
                        strHtml += '<tr id="' + item.ID + '"><td>' + item.Name + '</td><td><input id="chk_' + item.ID + '" type="checkbox" class="checkc" /></td></tr>';
                    })
                    $("#employeeList tr").remove();
                    $("#employeeList").append(strHtml);
                }

                $("#myModal1").modal();
            }
            
        })
    }

    //获取授权员工
    function GetAuthorEmployee(AuthorID) {
        var data = {
            action: "GetAuthorEmployee",
            AuthorID: AuthorID
        }
        var url = "/tools/ajax_CUstomerManage.ashx";
        var result = ajaxFunObj(data, url);
        var arrID = new Array();
        if (result != null) {
            
            $.each(result, function (i,item) {
                arrID.push(item.EmployeeID);
            })
            return arrID;
        }
        return arrID;
    }

    //添加授权
    function saveAuthor() {

        $("#saveAuthor").click(function () {
            var CompanyID = getUrlParam("CompanyID");
            //alert(PaperID);

            var Title = $("#edit_Title").val();
            var IsLongTime = $("#edit_IsLongTime").is(':checked');
            var StartTime = $("#edit_StartTime").val();
            var EndTime = $("#edit_EndTime").val();
            var Num = $("#edit_Num").val();


            if (Title == "") {
                if (!$("#edit_Title").hasClass("verify")) {
                    $("#edit_Title").addClass("verify");
                    $("#edit_Title").focus();
                } else {
                    $("#edit_Title").focus();
                }
                return;
            } else {
                $("#edit_Title").removeClass("verify");
            }

            if (!IsLongTime) {
                if (StartTime == "") {
                    if (!$("#edit_StartTime").hasClass("verify")) {
                        $("#edit_StartTime").addClass("verify");
                        $("#edit_StartTime").focus();
                    } else {
                        $("#edit_StartTime").focus();
                    }
                    return;
                } else {
                    $("#edit_StartTime").removeClass("verify");
                }
                if (EndTime == "") {
                    if (!$("#edit_EndTime").hasClass("verify")) {
                        $("#edit_EndTime").addClass("verify");
                        $("#edit_EndTime").focus();
                    } else {
                        $("#edit_EndTime").focus();
                    }
                    return;
                } else {
                    $("#edit_EndTime").removeClass("verify");
                }
                if (!checkEndTime(StartTime, EndTime)) {
                    alert("结束日期不能小于开始日期");
                    return;
                }
            }

            if (Num == "") {
                if (!$("#edit_Num").hasClass("verify")) {
                    $("#edit_Num").addClass("verify");
                    $("#edit_Num").focus();
                } else {
                    $("#edit_Num").focus();
                }
                return;
            } else {
                $("#edit_Num").removeClass("verify");
            }

            var data = {
                action: "addPaperAuthor",
                Title: Title,
                IsLongTime: IsLongTime,
                StartTime: StartTime,
                EndTime: EndTime,
                Num: Num,
                PaperID: PaperID,
                CompanyID: CompanyID
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(data, url);
            if (result.status == 1) {
                alert(result.msg);
                $("#close_modal").click();
                $("#tr_List tr").remove();
                GetAuthorList();
            } else {
                alert(result.msg);
            }

        })
    }

    //添加员工授权
    function addEmployeeAuthor() {
        $("#saveEmployeeAuthor").click(function () {
            var arrID = new Array();
            $("#employeeList tr[id]").each(function (i,item) {
                var id=$(this).attr("id");
                if ($("#chk_" + id).is(':checked')) {
                    arrID.push(id);
                } else {
                    if (arrID.indexOf(id) != -1) {
                        for (var i = 0; i < arrID.length; i++) {
                            if (arrID[i] == id) {
                                arrID.splice(i, 1);
                            }
                        }
                    }
                }
            })

            if (arrID.length==0) {
                alert("请选择要分配的员工");
                return;
            }

            var data = {
                action: "addEmployeeAuthor",
                ID: arrID.join(),
                AuthorID: AuthorID,
                PaperID1: PaperID1
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(data, url);

            if (result.status == 1) {
                alert(result.msg);
                $("#close_modal1").click();
                $("#tr_List tr").remove();
                GetAuthorList();
            } else if (result.status == 2) {
                alert("成功:" + result.success + "条，失败：" + result.error + "条");
                $("#close_modal1").click();
                $("#tr_List tr").remove();
                GetAuthorList();
            } else {
                alert(result.msg);
            }
        })
    }

    //是否永久授权
    function IsAuthor() {
        $("#edit_IsLongTime").click(function () {
            if ($("#edit_IsLongTime").is(':checked')) {
                $("#edit_StartTime").attr("disabled", true);
                $("#edit_EndTime").attr("disabled", true);
            } else {
                $("#edit_StartTime").attr("disabled", false);
                $("#edit_EndTime").attr("disabled", false);
            }
        })
    }

    //验证
    function dataVerify() {
        $("#editAuthor td[id] input").blur(function () {
            //if($(this))
        })
    }
</script>
</html>
