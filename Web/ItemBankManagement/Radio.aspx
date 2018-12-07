<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Radio.aspx.cs" enableEventValidation="false" Inherits="Web.ItemBankManagement.Radio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:5px">
        <script src="../JS/jquery-1.11.2.min.js"></script>
        <script src="../JS/Company_Common.js"></script>
    <script type="text/javascript" language="javascript">
        function addWorkExp() {
            <%--var inputList = document.getElementsByTagName('input');

            for (var item = 0; item < inputList.length; item++) {
                var inputitem = inputList[item];
                inputitem.setAttribute("value", "");
            }--%>

            var num = document.getElementById("WorkExpNum").value;
            num = parseInt(num) + 1;
            document.getElementById("WorkExpNum").value = num;
            var txtWorkExp = "";
            txtWorkExp = "<table id='T_table" + num + "' class='text_12px'>";
            txtWorkExp = txtWorkExp + "<tr><td>&nbsp;" + num + ",&nbsp;</td>";
            txtWorkExp = txtWorkExp + "<td><input name='Name" + num + "' type='text' id='Name" + num + "' style='width:350px; height:22px' class='table_Bottom' maxlength='200'/></td>";
            txtWorkExp = txtWorkExp + "<td>&nbsp;<input type='radio' name='radio' id='radio' value='" + num + "' class='text_12px' />答案</td>";
//            txtWorkExp = txtWorkExp + "<td>&nbsp;<input type='radio' name='radio" + num + "' id='radio" + num + "' value='F' class='text_12px' />错误答案</td>";
            txtWorkExp = txtWorkExp + "<td><input type=button value=删除 class='table_Box' onclick=delFile(T_table" + num + "," + num + ") /></td></tr>";
            txtWorkExp = txtWorkExp + "</table>";
            var obj = document.getElementById("divWorkExp");
            var html = obj.innerHTML;
            obj.innerHTML = html + txtWorkExp;
        }
        function delFile(ID, ID2) {
            //ID.removeNode(true);
            document.getElementById("divWorkExp").removeChild(ID);
            var del_num = document.getElementById("del_Work").value;
            del_num = del_num + "," + ID2;
            document.getElementById("del_Work").value = del_num;
            //alert(del_num);
        }
    </script>

        <script type="text/javascript">
            $(function () {
                //selCategory();
            })

            //类别选择
            function selCategory() {
                $("#ddl_category").change(function () {
                    var type = $(this).val();
                    if (type != "") {
                        var url = "/tools/GetTitleList_ajax.ashx";
                        var data={
                            action:"GetCategory",
                            type: type
                        }
                        var result = ajaxFunObj(data, url);
                        if (result != null) {
                            var strHtml = "";
                            $.each(result, function (i, item) {
                                if (i == 0) {
                                    strHtml += '<option value="' + item.YS_ID + '" selected="true">' + item.YS_DESC + '</option>';
                                } else {
                                    strHtml += '<option value="' + item.YS_ID + '">' + item.YS_DESC + '</option>';
                                }
                            })
                            $("#ddl_category1 option").remove();
                            $("#ddl_category1").append(strHtml);
                        }
                    } else {
                        $("#ddl_category1 option").remove();
                        $("#ddl_category1").append("<option value=''>-- 请选择 --</option>");S
                    }
                })
            }
        </script>
    <input type="hidden" name="WorkExpNum" id="WorkExpNum" value="1"/><input type="hidden" name="del_Work" id="del_Work" value="0"/> 
    <table class="text_12px">
        <tr>
            <td>
            </td>
            <td>
                <asp:RadioButtonList ID="rbl_Extent" runat="server" CssClass="text_12px" 
                    RepeatColumns="3">
                    <asp:ListItem Selected="True">简单</asp:ListItem>
                    <asp:ListItem>适中</asp:ListItem>
                    <asp:ListItem>困难</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>题目：</td>
            <td>
                <asp:TextBox ID="tb_Title" CssClass="table_Bottom" runat="server" MaxLength="500" 
                    Width="600px" Height="45px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tb_Title" CssClass="text_12px" ErrorMessage="*" 
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
            <div id="divWorkExp" > 
            <table class="text_12px">
                <tr>
                    <td>&nbsp;1,&nbsp;</td>
                    <td><input type="text" id="Name1" name="Name1" style="width:350px; height: 22px;" class="table_Bottom" maxlength="200"/></td>
                    <td>
                    &nbsp;<input type="radio" name="radio" id="radio" value="1" class="text_12px" />答案
                    <%--&nbsp;<input type="radio" name="radio1" id="radio2" value="F" class="text_12px" />错误答案--%>
                    </td>
                    <td></td>
                </tr>
            </table>
            </div>
            <input id="add_txt" type="button" value="增加" class="table_Box"  OnClick="addWorkExp()"/>
            </td>
        </tr>
        <tr>
            <td>分析：</td>
            <td>
                <asp:TextBox ID="tb_Analysis" runat="server" CssClass="table_Box" 
                    Height="175px" TextMode="MultiLine" Width="446px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>类别选择：</td>
        </tr>
        <tr>
            
            <td>
                <asp:DropDownList ID="ddl_category" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddl_category1" runat="server"></asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td></td>
            <td align="right">
                <asp:Label ID="lb_msg" runat="server" ForeColor="Red" CssClass="text_12px"></asp:Label>
                <asp:Button ID="bt_Yes" runat="server" Text="添加" CssClass="table_Box" 
                    Width="60px" Height="30px" onclick="bt_Yes_Click" ValidationGroup="2" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
