<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="Web.CustomerManage.EmployeeList" %>

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
            background: #dcddc0 url('cell-grey.jpg');
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <span class="x-panel-header-text">企业员工列表</span>
            </div>
            <hr />
            <div id="action">
                <span class="x-btn-inner"><a style="text-decoration: none" href="/CustomerManage/EmployeeEdit.aspx?CompanyID=<%=Request.QueryString["CompanyID"]%>">新建</a></span><span style="display: none" class="x-btn-inner">编辑</span>
                <input type="text" id="txt_seach" placeholder="员工名" />
                <span>
                    <a class="x-btn-inner">搜索</a>
                </span>
                <span>
                    <a style="text-decoration: none" href="/CustomerManage/CustomerList.aspx" class="x-btn-inner">企业列表</a>
                </span>
            </div>
            <hr />
            <div style="width: 100%">
                <table style="width: 100%" class="imagetable">
                    <thead>
                        <tr id="tr_title">
                            <td style="width: 8%">姓名</td>
                            <td style="width: 15%">电话</td>
                            <td style="width: 15%">备注</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <tbody id="tr_List">
                    </tbody>
                </table>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(function () {
            GetEmployeeList();
            deleteEmployee();
        })

        //获取员工
        function GetEmployeeList() {
            var data = {
                action: "GetEmployeeList",
                ID: getUrlParam("CompanyID")
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(data, url);
            if (result != null) {
                var strHtml = "";
                $.each(result, function (i, item) {
                    strHtml += '<tr><td style="font-weight:bold">' + item.Name + '</td><td>' + item.Tel + '</td><td>' + item.Remark + '</td>';
                    strHtml += '<td><span><a href="/CustomerManage/EmployeeEdit.aspx?CompanyID=<%=Request.QueryString["CompanyID"]%>&ID=' + item.ID + '">编辑</a></span>&nbsp;';
                    strHtml += '<span id="sp_' + item.ID + '"><a href="javascript:">删除</a></span>&nbsp;';
                    strHtml += '</td>';
                    strHtml += '</tr>';
                })
                $("#tr_List").append(strHtml);
            }
        }

        //删除
        function deleteEmployee() {
            $(document).on("click", "#tr_List span[id]", function () {
                if (confirm("是否删除？")) {
                    var ID = $(this).attr("id").split("_")[1];
                    var data = {
                        action: "deleteEmployee",
                        ID: ID
                    }
                    var url = "/tools/ajax_CUstomerManage.ashx";
                    var result = ajaxFunObj(data, url);
                    if (result.status == 1) {
                        alert(result.msg);
                        $("#tr_List tr").remove();
                        GetEmployeeList();
                    } else {
                        alert(result.msg);
                    }
                }
            })
        }
    </script>
</body>
</html>
