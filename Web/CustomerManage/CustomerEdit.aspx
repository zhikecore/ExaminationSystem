<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerEdit.aspx.cs" Inherits="Web.CustomerManage.CustomerEdit" %>

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
            background:#EEB4B4;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <span class="x-panel-header-text">新建企业客户</span>
            </div>
            <hr />
            <div id="action">
                <span id="save_btn" class="x-btn-inner">保存</span><span class="x-btn-inner"><a style="text-decoration:none" href="/CustomerManage/CustomerList.aspx">查看列表</a></span>
            </div>
            <hr />
            <div>
                <div>
                    <table width="100%" class="imagetable">
                        <tr>
                            <td width="90"><span>企业名称:</span></td>
                            <td id="Name"><input id="edit_Name" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>网址:</span></td>
                            <td id="Website"><input id="edit_Website" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>地址:</span></td>
                            <td id="Address"><input id="edit_Address" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>联系电话:</span></td>
                            <td id="Tel"><input id="edit_Tel" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>所属行业:</span></td>
                            <td id="Industry"><input id="edit_Industry" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>企业性质:</span></td>
                            <td id="EnterpriseType"><input id="edit_EnterpriseType" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>负责人:</span></td>
                            <td id="Principal"><input id="edit_Principal" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <tr>
                            <td width="90"><span>对象ID:</span></td>
                            <td id="obj_ID"><input id="edit_obj_ID" onblur="value=value.replace(/[^ \d]/g,'')" type="text" style="width:100%" size="1" /></td>
                        </tr>
                        <%--<tr>
                            <td width="90"><span>创建时间:</span></td>
                            <td id="CreateTime"><input id="edit_CreateTime" type="date" style="width:100%" size="1" /></td>
                        </tr>--%>
                    </table>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(function () {

            var ID=getUrlParam("ID");
            if(ID!=null){
                editCompany(ID);
            }
            saveData(ID);
        })

        //编辑
        function editCompany(ID) {
            var data = {
                action: "GetCompanyInfo",
                ID: ID
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(data, url);
            if (result != null) {
                $("#edit_Name").val(result[0].Name);
                $("#edit_Website").val(result[0].Website);
            }
        }

        //保存数据
        function saveData(ID) {
            $("#save_btn").click(function () {
                var Name = $("#edit_Name").val();
                //var CreateTime = $("#edit_CreateTime").val();
                var Website = $("#edit_Website").val();
                var obj_ID = $("#edit_obj_ID").val();
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
                if (Website == "") {
                    if (!$("#edit_Website").hasClass("verify")) {
                        $("#edit_Website").addClass("verify");
                        $("#edit_Website").focus();
                    } else {
                        $("#edit_Website").focus();
                    }
                    return;
                } else {
                    $("#edit_Website").removeClass("verify");
                }
                if (obj_ID == "") {
                    if (!$("#edit_obj_ID").hasClass("verify")) {
                        $("#edit_obj_ID").addClass("verify");
                        $("#edit_obj_ID").focus();
                    } else {
                        $("#edit_obj_ID").focus();
                    }
                    return;
                } else {
                    $("#edit_obj_ID").removeClass("verify");
                }
                if (ID == null) {//新增
                    var data = {
                        action: "addCompany",
                        Name: Name,
                        Website: Website,
                        obj_ID: obj_ID
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
                        action: "updateCompany",
                        ID:ID,
                        Name: Name,
                        Website: Website
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
