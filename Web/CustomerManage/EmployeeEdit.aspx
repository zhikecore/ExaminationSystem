<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeEdit.aspx.cs" Inherits="Web.CustomerManage.EmployeeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="../JS/jquery-1.11.2.min.js"></script>
    <script src="../JS/Company_Common.js"></script>
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

            table.imagetable th {
                /*background: #b5cfd2 url('cell-blue.jpg');*/
                /*border-width: 1px;*/
                padding: 8px;
                /*border-style: solid;*/
                border-color: #999999;
            }

            table.imagetable td {
                /*background: #dcddc0 url('cell-grey.jpg');*/
                /*border-width: 1px;*/
                padding: 8px;
                /*border-style: solid;*/
                border-color: #999999;
            }

        .verify {
            background: #EEB4B4;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <span class="x-panel-header-text">新建企业员工</span>
            </div>
            <hr />
            <div id="action">
                <span id="save_btn" class="x-btn-inner">保存</span><span class="x-btn-inner"><a style="text-decoration: none" href="/CustomerManage/EmployeeList.aspx?CompanyID=<%=Request.QueryString["CompanyID"]%>">查看列表</a></span>
            </div>
            <hr />
            <div>
                <div>
                    <table width="100%" class="imagetable">
                        <tr>
                            <td width="90"><span>员工名称:</span></td>
                            <td id="Name">
                                <input id="edit_Name" type="text" style="width: 100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>联系电话:</span></td>
                            <td id="Tel">
                                <input id="edit_Tel" type="text" style="width: 100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>备注:</span></td>
                            <td id="Remark">
                                <input id="edit_Remark" type="text" style="width: 100%" size="1" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        var ID = getUrlParam("ID");//员工ID
        var CompanyID = getUrlParam("CompanyID");//公司ID
        $(function () {

            if (ID != null) {
                editEmployee(ID);
            }
            saveData(ID);
        })

        //编辑
        function editEmployee(ID) {
            var data = {
                action: "GetEmployeeInfo",
                ID: ID
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(data, url);
            if (result != null) {
                $("#edit_Name").val(result[0].Name);
                $("#edit_Tel").val(result[0].Tel);
                $("#edit_Remark").val(result[0].Remark);
            }
        }

        //保存数据
        function saveData(ID) {
            $("#save_btn").click(function () {
                var Name = $("#edit_Name").val();
                var Tel = $("#edit_Tel").val();
                var Remark = $("#edit_Remark").val();
                if (Name == "") {
                    if (!$("#edit_Name").hasClass("verify")) {
                        $("#edit_Name").addClass("verify");
                        $("#edit_Name").focus();
                    } else {
                        $("#edit_Name").focus();
                    }
                    return;
                } else {
                    $("#edit_Name").removeClass("verify");
                }
                if (Tel == "") {
                    if (!$("#edit_Tel").hasClass("verify")) {
                        $("#edit_Tel").addClass("verify");
                        $("#edit_Tel").focus();
                    } else {
                        $("#edit_Tel").focus();
                    }
                    return;
                } else {
                    $("#edit_Tel").removeClass("verify");
                }
                if (Remark == "") {
                    if (!$("#edit_Remark").hasClass("verify")) {
                        $("#edit_Remark").addClass("verify");
                        $("#edit_Remark").focus();
                    } else {
                        $("#edit_Remark").focus();
                    }
                    return;
                } else {
                    $("#edit_Remark").removeClass("verify");
                }
                if (ID == null) {//新增
                    var data = {
                        action: "addEmployee",
                        Name: Name,
                        Tel:Tel,
                        Remark: Remark,
                        CompanyID: CompanyID
                    }
                    var url = "/tools/ajax_CUstomerManage.ashx";
                    var result = ajaxFunObj(data, url);
                    if (result.status == 1) {
                        alert(result.msg);
                    } else {
                        alert(result.msg);
                    }
                } else {//修改
                    var data = {
                        action: "updateEmployee",
                        ID: ID,
                        Name: Name,
                        Tel:Tel,
                        Remark: Remark
                    }
                    var url = "/tools/ajax_CUstomerManage.ashx";
                    var result = ajaxFunObj(data, url);
                    if (result.status == 1) {
                        alert(result.msg);
                    } else {
                        alert(result.msg);
                    }
                }
            })
        }
    </script>
</body>
</html>
