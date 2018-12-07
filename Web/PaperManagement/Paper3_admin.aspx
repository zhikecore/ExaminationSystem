﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paper3_admin.aspx.cs" Inherits="Web.PaperManagement.Paper3_admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../JS/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../JS/papercss.css" rel="stylesheet" />
    <script src="../JS/jquery-1.11.2.min.js"></script>
    <script src="../JS/bootstrap/js/bootstrap.min.js"></script>
    <script src="../JS/Company_Common.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="txt_userid" runat="server"/>
        <input type="hidden" id="txt_paperid" runat="server"/>
        <input type="hidden" id="txt_companyid" runat="server"/>
    <div class="question_survey">
        <div class="tab-content">
            <div class="tab-pane active" id="personal_diagnosis">
                
                <div class="personal_diagnosis_header">
                    <div class="personal_header_detail">
                        <h3 class="survey_header">
                            基于顶层设计的股权激励定制方案》辅导班
                        </h3>
                        <p class="survey_header2">
                            申请参课审核表
                        </p>
                        <div class="survey_demand">
                            <p>申请企业要求：</p>
                            <p>（1）拟上市、挂牌或已上市、挂牌企业；领军人才、专精特新、省市龙头、高新技术与规模以上企业均可申请；</p>
                            <p>（2）每家申请企业限报2人（其中1人须是企业最高负责人），经审核通过后方可参加。</p>
                            <p>收到本审核表后3个工作日内反馈审核结果，如果您通过《基于顶层设计的股权激励定制方案》辅导班审核组审核，我们将向您发送《入学通知函》。</p>
                        </div>
                        <div class="survey_demand">
                            <p>特别提醒：第25期辅导班审核报名截止时间： 12月20日。</p>
                            <p>特别说明：课程须持本人身份证签到，学习资料由企业最高负责人统一领取。</p>
                            <p>特别申明：签到时或学习过程中，如发现实际情况与本表信息不一致，将即时取消参课资格。</p>	
                        </div>
                    </div>
                </div>
                <div class="text-center bbs_pull_content">
                    <span class="bbs_pull_down">
                        <i class="glyphicon glyphicon-chevron-down"></i>
                    </span>
                </div>
                <div id="TitleContent" class="survey_content" runat="server">
                    
                </div>
                <div id="sortNum" class="survey_footer" runat="server">
                    
                </div>
             </div>   
        </div>
    </div>
    </form>
</body>

    <script type="text/javascript">
        $(".tab-all>.tabs_left").click(function () {
            $(this).addClass("this_tab").siblings("li").removeClass("this_tab");
            $("#content" + this.value).show().siblings("div").hide();
            window.parent.iframe_height();
        });
        $(".tab-all1>.tabs_left").click(function () {
            $(this).addClass("this_tab").siblings("li").removeClass("this_tab");
            $("#section" + this.value).show().siblings("div").hide();
            window.parent.iframe_height();
        });

        //选中答案
        $(".company_radio>img").click(function () {
            var str_Utype = getUrlParam("Utype");//用户类型 1.老师，0.客户

            if (str_Utype == "1") {//老师可以对题目进行修改
                updateTitle(this);
            } else if (str_Utype == "0") {
                //判断是否可以选择
                var str_paperID = $("#txt_paperid").val();//试卷ID
                var str_companyID = $("#txt_companyid").val();//公司id
                var obj_data = {
                    action: "isCanTest",
                    str_paperID: str_paperID,
                    str_companyID: str_companyID
                }
                var url = "/tools/ajax_CUstomerManage.ashx";
                var result = ajaxFunObj(obj_data, url);
                if (result.status == 1) {//可以做题
                    updateTitle(this);
                }
            }
            
        });

        //题目修改|做题
        function updateTitle(obj) {
            $(obj).attr("src", "/img/company_true.png");
            $(obj).attr("data_checked", "1");
            $(obj).parent().siblings(".company_radio").children("img").attr("src", "/img/company_false.png");
            $(obj).parent().siblings(".company_radio").children("img").attr("data_checked", "0");

            var str_paperID = $("#txt_paperid").val();//试卷ID
            var str_userID = $("#txt_userid").val();//用户ID
            var str_companyID = $("#txt_companyid").val();//公司id
            var str_titleID = $(obj).attr("id").split("_")[1];//题目ID
            var str_answerID = $(obj).attr("id").split("_")[2];//答案ID

            //保存选中数据
            if (str_userID == "0") {//没有用户id的话使用公司id
                var objData = {
                    action: "addPaperResult",
                    PaperID: str_paperID,
                    TitleID: str_titleID,
                    AnswerID: str_answerID,
                    UserID: str_companyID
                }
            } else {
                var objData = {
                    action: "addPaperResult",
                    PaperID: str_paperID,
                    TitleID: str_titleID,
                    AnswerID: str_answerID,
                    UserID: str_userID
                }
            }
            var url = "/tools/ajax_CUstomerManage.ashx";
            var result = ajaxFunObj(objData, url);
            if (result.status == 1) {
                //alert(result.msg);
            } else {
                alert(result.msg);
            }
        }

        $(".question_survey>.nav-pills>li").click(function () {
            setTimeout(function () {
                window.parent.iframe_height();
            }, 50);
        });
        $(".my_line>img").click(function () {
            if ($(this).attr("checked") == "checked") {
                $(this).attr("src", "/img/company_false.png");
                $(this).removeAttr("checked");
                if ($(this).hasClass("it_checked")) {
                    $(this).parent().children(".it_select").css("visibility", "hidden");
                    $(this).parent().children(".it_select").val("");
                }
            } else {
                $(this).attr("checked", "checked");
                $(this).attr("src", "img/company_checkbox.png");
                if ($(this).hasClass("it_checked")) {
                    $(this).parent().children(".it_select").css("visibility", "visible");
                }
            }
            
        });
    
</script>
    <script type="text/javascript">
        $(function () {
            //提交验证
            $(document).on("click", "#div_submitPaper", function () {
                var str_paperID = $("#txt_paperid").val();//试卷ID
                var str_userID = $("#txt_userid").val();//用户ID
                var str_companyID = $("#txt_companyid").val();//公司id

                var str_Utype = getUrlParam("Utype");//用户类型 1.老师，0.客户

                //判断是否可以提交
                //var str_paperID = $("#txt_paperid").val();//试卷ID
                //var str_companyID = $("#txt_companyid").val();//公司id
                if ($(this).attr("disabled") == "disabled") {
                    return;
                } else {
                    //禁用提交按钮
                    $(this).attr("disabled", true);
                    var obj_data = {
                        action: "isCanTest",
                        str_paperID: str_paperID,
                        str_companyID: str_companyID
                    }
                    var url = "/tools/ajax_CUstomerManage.ashx";
                    var result = ajaxFunObj(obj_data, url);

                    if (str_Utype == "1") {//老师可以对题目进行修改
                        submitPaper(this, result, 1);
                    } else if (str_Utype == "0") {

                        if (result.status == 1) {//可以提交
                            submitPaper(this, result, 0);
                        } else {
                            alert(result.msg);
                        }
                        //else if (result.status == 2) {
                        //    alert("你上次考试时间是：" + result.datetime + ",半个小时后再来");
                        //}
                    }
                }
                
            })
        })


        //提交试卷
        function submitPaper(obj, result,type) {
            var str_titleID = new Array();//没有选择的题目id
            var str_seltitleID = new Array();//选择的题目id
            var str_paperID = $("#txt_paperid").val();//试卷ID
            var str_companyID = $("#txt_companyid").val();//公司id
            var str_msg;
            if (type == 1) {
                str_msg = "确认提交吗?";
            } else if (type == 0) {
                str_msg = "该试卷共" + result.count + "道题，已提交" + result.subcount + "道题，确定交卷吗？";
            }

            if (confirm(str_msg)) {
                $("#TitleContent img").each(function (i, item) {//取得剩余没有提交的数据
                    if ($(this).attr("data_checked") == 0) {
                        str_titleID.push($(this).attr("id").split("_")[1])
                    } else {
                        str_seltitleID.push($(this).attr("id").split("_")[1])
                    }
                })

                //去除已经选择的题目
                str_titleID = uniq(str_titleID);
                if (str_seltitleID.length > 0) {
                    for (i = 0; i < str_seltitleID.length; i++) {
                        if (str_titleID.indexOf(str_seltitleID[i]) != -1) {//存在则移除(移除已经提交题目)
                            for (var j = 0; j < str_titleID.length; j++) {
                                if (str_titleID[j] == str_seltitleID[i]) {
                                    str_titleID.splice(j, 1);
                                }
                            }
                        }
                    }
                }

                var str_gapID = new Array();//保存填空题id
                var str_gapValue = new Array(); //保存填空题答案
                $("#TitleContent textarea").each(function (i, item) {//取得填空题答案
                    str_gapID.push($(this).attr("id").split("_")[1]);
                    str_gapValue.push($(this).val());
                })
                var objdata = {
                    action: "subPapers",
                    str_titleID: str_titleID.join(),
                    str_paperID: str_paperID,
                    str_companyID: str_companyID,
                    str_gapID: str_gapID.join(),
                    str_gapValue: str_gapValue.join()
                }
                var url = "/tools/ajax_CUstomerManage.ashx";
                var result = ajaxFunObj(objdata, url);
                if (result.status == 1) {
                    $(obj).attr("disabled", false);

                    alert(result.msg);
                } else if (result.status == 2) {
                    $(obj).attr("disabled", false);

                    alert("提交成功：" + result.success + "条，失败：" + result.error);
                } else {
                    $(obj).attr("disabled", false);
                }
            } else {
                $(obj).attr("disabled", false);
            }
        }


        $(".bbs_pull_down").click(function () {
            if ($(this).children("i").hasClass("glyphicon-chevron-down")) {
                $(".personal_diagnosis_header").slideDown(500);
                $(this).children("i").removeClass("glyphicon-chevron-down")
                $(this).children("i").addClass("glyphicon-chevron-up");
            } else {
                $(".personal_diagnosis_header").slideUp(500);
                $(this).children("i").addClass("glyphicon-chevron-down")
                $(this).children("i").removeClass("glyphicon-chevron-up");
            }
        });
    </script>
</html>
