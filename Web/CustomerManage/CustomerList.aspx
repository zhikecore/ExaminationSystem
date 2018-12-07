<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="Web.CustomerManage.CustomerList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../JS/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../JS/jquery-1.11.2.min.js"></script>
    <script src="../JS/Company_Common.js"></script>
    <script src="../JS/bootstrap/js/bootstrap.min.js"></script>
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
                <span class="x-panel-header-text">企业客户列表</span>
            </div>
            <hr />
            <div id="action">
                <span class="x-btn-inner"><a style="text-decoration: none" href="/CustomerManage/CustomerEdit.aspx">新建</a></span><span style="display: none" class="x-btn-inner">编辑</span>
                <input type="text" id="txt_seach" placeholder="公司名" />
                <span>
                    <button runat="server" type="button" onclick="search()" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off">
                        搜索
                    </button>
                </span>
            </div>
            <hr />
            <div style="width: 100%">
                <table style="width: 100%" class="imagetable">
                    <thead>
                        <tr id="tr_title">
                            <td style="width: 20%">企业名</td>
                            <td>obj_ID</td>
                            <td>公司网址</td>
                            <td>所属行业</td>
                            <td>企业性质</td>
                            <td>负责人</td>
                            <td>创建时间</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <tbody id="tr_List" runat="server">
                    </tbody>
                </table>
            </div>
        </div>
        <!--分页-->
        <div id="pageList" style="text-align: right; padding-right: 200px" runat="server">
            <%--<nav>
                <ul class="pagination">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </nav>--%>
        </div>
    </form>

    <script type="text/javascript">
        $(function () {
            //GetCompanyList();
            deleteCompany();
        })

        //页面加载时获取公司列表
        function GetCompanyList() {
            var data = {
                action: "GetCompanyList"
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(data, url);
            if (result != null) {
                var strHtml = "";
                $.each(result, function (i, item) {
                    strHtml += '<tr><td style="font-weight:bold">' + item.Name + '</td>';
                    //strHtml += '<td>'+item.obj_ID+'</td>';
                    strHtml += '<td>' + item.obj_ID + '</td><td><a href="http://' + item.Website + '" target="_blank">' + item.Website + '</a></td><td></td><td></td><td></td><td>' + formatDate(item.CreateTime) + '</td>';
                    strHtml += '<td><span><a href="/CustomerManage/CustomerEdit.aspx?ID=' + item.ID + '">编辑</a></span>&nbsp;';
                    strHtml += '<span id="sp_' + item.ID + '"><a href="javascript:">删除</a></span>&nbsp;';
                    strHtml += '<span><a href="/CustomerManage/EmployeeList.aspx?CompanyID=' + item.ID + '">员工管理</a></span>&nbsp;';
                    strHtml += '<span><a href="/CustomerManage/PaperAuthorManage.aspx?CompanyID=' + item.ID + '">授权管理</a></span></td>';
                    strHtml += '</tr>';
                })
                $("#tr_List").append(strHtml);
            }
        }

        //删除
        function deleteCompany() {
            $(document).on("click", "#tr_List span[id]", function () {
                if (confirm("是否删除？")) {
                    var ID = $(this).attr("id").split("_")[1];
                    var data = {
                        action: "deleteCompany",
                        ID: ID
                    }
                    var url = "/tools/ajax_CUstomerManage.ashx";
                    var result = ajaxFunObj(data, url);
                    if (result.status == 1) {
                        alert(result.msg);
                        $("#tr_List tr").remove();
                        GetCompanyList();
                    } else {
                        alert(result.msg);
                    }
                }
            })
        }

        //搜索
        function search() {

            var data = {
                action: "searchCompanyList",
                search:$("#txt_seach").val().trim()
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(data, url);
            if (result != null) {
                var strHtml = "";
                $.each(result, function (i, item) {
                    strHtml += '<tr><td style="font-weight:bold">' + item.Name + '</td>';
                    //strHtml += '<td>'+item.obj_ID+'</td>';
                    strHtml += '<td>' + item.obj_ID + '</td><td><a href="http://' + item.Website + '" target="_blank">' + item.Website + '</a></td><td></td><td></td><td></td><td>' + formatDate(item.CreateTime) + '</td>';
                    strHtml += '<td><span><a href="/CustomerManage/CustomerEdit.aspx?ID=' + item.ID + '">编辑</a></span>&nbsp;';
                    strHtml += '<span id="sp_' + item.ID + '"><a href="javascript:">删除</a></span>&nbsp;';
                    strHtml += '<span><a href="/CustomerManage/EmployeeList.aspx?CompanyID=' + item.ID + '">员工管理</a></span>&nbsp;';
                    strHtml += '<span><a href="/CustomerManage/PaperAuthorManage.aspx?CompanyID=' + item.ID + '">授权管理</a></span></td>';
                    strHtml += '</tr>';
                })
                $("#tr_List tr").remove();
                $("#tr_List").append(strHtml);
            }
        }
    </script>
</body>
</html>
