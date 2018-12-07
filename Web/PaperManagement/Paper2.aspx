<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paper2.aspx.cs" Inherits="Web.PaperManagement.Paper2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../JS/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../JS/jquery-1.11.2.min.js"></script>
    <script src="../JS/bootstrap/js/bootstrap.min.js"></script>
    <script src="../JS/Company_Common.js"></script>
    <style>
        body {
            background:#f7f8fc;
        }
        * {
            font-family:'Microsoft YaHei';
            list-style:none;
        }
        .nav-pills > li {
            border:1px solid #ccc;
            border-left:none;
            background: -ms-linear-gradient(bottom, #f2f9fc,  #ffffff);/* IE 10 */
            background:-moz-linear-gradient(bottom, #f2f9fc,#ffffff);/*火狐*/ 
            background: -webkit-linear-gradient(bottom,  #f2f9fc, #ffffff);   /*Safari5.1 Chrome 10+*/
            background: -o-linear-gradient(bottom,  #f2f9fc, #ffffff);  /*Opera 11.10+*/
        }
        .nav-pills > li{
            border-left:1px solid #ccc;
            border-top-left-radius:5px;
            border-top-right-radius:5px;
        }
        .nav-pills > li > a {
            border-radius:0;
            color:#000;
            font-weight:bold;
        }
        .nav > li > a:hover, .nav > li > a:focus {
            background: -ms-linear-gradient(bottom, #f2f9fc,  #ffffff);/* IE 10 */
            background:-moz-linear-gradient(bottom, #f2f9fc,#ffffff);/*火狐*/ 
            background: -webkit-linear-gradient(bottom,  #f2f9fc, #ffffff);   /*Safari5.1 Chrome 10+*/
            background: -o-linear-gradient(bottom,  #f2f9fc, #ffffff);  /*Opera 11.10+*/
        }
        .nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
            background:#3bb9ef;
        }
        .tab-content {
            background:#fff;
            padding-bottom:10px;
            border-bottom-left-radius:5px;
            border-bottom-right-radius:5px;
        }
        .personal_diagnosis_header {
            background:#3bb9ef;
            color:#fff;
            padding:10px;
            padding-bottom:30px;
            display:none;
        }
        .personal_header_detail {
            width:1000px;
            margin:auto;
        }
        .survey_header {
            text-align:center;
            font-weight:bold;
            font-size:30px;
        }
        .survey_header2, .survey_header3 {
            text-align:center;
            font-weight:bold;
        }
        .survey_table {
            background:#7ed1f5;
            width:1000px;
            margin:auto;
            -webkit-box-shadow:0 0 10px 10px rgba(255, 255, 255, .2);  
            -moz-box-shadow:0 0 10px 10px rgba(255, 255, 255, .2);  
            box-shadow:0 0 10px 10px rgba(255, 255, 255, .2);  
            margin-top:30px;
        }
        .survey_table td{
            border-color:#cbedfb!important;
            padding-left:30px!important;
            font-weight:bold;
        }
        .survey_content > div {
            display:none;
            padding:10px;
        }
        .survey_footer {
            position:relative;
            margin-top:20px;
            margin-bottom:20px;
        }
            .survey_content > div:first-child {
                display:block;
            }
        .tab-all {
            overflow:hidden;
            position:absolute;
            right:20px;
            bottom:-10px;
        }
        .tab-all > li {
            float:left;
            height:30px;
            width:30px;
            background:#f3f3f3;
            border-radius:50%;
            text-align:center;
            line-height:30px;
            font-weight:bold;
            margin-left:10px;
            cursor:pointer;
        }
        .tab-all1 {
            overflow:hidden;
            position:absolute;
            right:20px;
            bottom:-10px;
        }
        .tab-all1 > li {
            float:left;
            height:30px;
            width:30px;
            background:#f3f3f3;
            border-radius:50%;
            text-align:center;
            line-height:30px;
            font-weight:bold;
            margin-left:10px;
            cursor:pointer;
        }
        .my_submit {
            padding:10px;
            width:150px;
            text-align:center;
            border-radius:5px;
            background:#3bb9ef;
            color:#fff;
            margin:auto;
        }
        .survey_one {
            width:1000px;
            margin:auto;
            padding-top:10px;
        }
        .survey_content > div h4 {
            font-weight:bold;
                
                width:1000px;
                margin:auto;
                margin-bottom:20px;
        }
            .survey_one p {
                font-size:15px;
                font-weight:bold;
                margin-bottom:15px;
            }
        .order_head {
            display:inline-block;
             height:30px;
            width:30px;
            background:#f3f3f3;
            border-radius:50%;
            text-align:center;
            line-height:30px;
            font-weight:bold;
            margin-right:10px;
            font-size:13px;
        }
        .company_radio {
            margin-left:10px;
        }
        .company_radio>img {
            height:15px;
            width:auto;
            position:relative;
            top:-1px;
            margin-left:10px;
            cursor:pointer;
        }
        .survey_select {
            padding-left:25px;
            overflow:hidden;
        }
            .survey_select > textarea {
                width:600px;
                height:150px;
                padding:10px;
                resize:none;
            }
        #personal_examine .survey_header2 {
            font-size:22px;
        }
        .survey_demand {
            background:#7ed1f5;
            width:1000px;
            margin:auto;
            padding:20px 30px;
            -webkit-box-shadow:0 0 10px 10px rgba(255, 255, 255, .2);  
            -moz-box-shadow:0 0 10px 10px rgba(255, 255, 255, .2);  
            box-shadow:0 0 10px 10px rgba(255, 255, 255, .2);  
            margin-top:30px;
        }
        .survey_table_head {
            height:40px;
            width:1000px;
            margin:auto;
            line-height:40px;
            text-align:center;
            background: -ms-linear-gradient(bottom, #f2f9fc,  #ffffff);/* IE 10 */
            background:-moz-linear-gradient(bottom, #f2f9fc,#ffffff);/*火狐*/ 
            background: -webkit-linear-gradient(bottom,  #f2f9fc, #ffffff);   /*Safari5.1 Chrome 10+*/
            background: -o-linear-gradient(bottom,  #f2f9fc, #ffffff);  /*Opera 11.10+*/
            border:1px solid #ddd;
            border-bottom:none;
        }
        .survey_mytable {
            width:1000px;
            margin:auto;
            margin-bottom:20px;
        }
            .survey_mytable td {
                height:37px;
                vertical-align:middle!important;
                padding:0!important;
            }
                .survey_mytable td .form-control {
                    border:none;
                    outline:none;
                }
            .survey_mytable td:nth-child(odd) {
                width:150px;
                text-align:center;
                background: -ms-linear-gradient(bottom, #f2f9fc,  #ffffff);/* IE 10 */
                background:-moz-linear-gradient(bottom, #f2f9fc,#ffffff);/*火狐*/ 
                background: -webkit-linear-gradient(bottom,  #f2f9fc, #ffffff);   /*Safari5.1 Chrome 10+*/
                background: -o-linear-gradient(bottom,  #f2f9fc, #ffffff);  /*Opera 11.10+*/
            }
                .survey_mytable td:nth-child(even) {
                    width:350px;
                }
        .specail_Td {
            height:80px!important;
        }
            .specail_Td > textarea {
                display:block;
                height:80px;
                width:100%;
                border:none;
                outline:none;
                resize:none;
            }
        .specail_Tr {
            background: -ms-linear-gradient(bottom, #f2f9fc,  #ffffff);/* IE 10 */
                background:-moz-linear-gradient(bottom, #f2f9fc,#ffffff);/*火狐*/ 
                background: -webkit-linear-gradient(bottom,  #f2f9fc, #ffffff);   /*Safari5.1 Chrome 10+*/
                background: -o-linear-gradient(bottom,  #f2f9fc, #ffffff);  /*Opera 11.10+*/
        }
        .my_specTd {
            background:#fff!important;
        }
        .specail_span {
            display:block;
            float:left;
            height:37px;
            width:440px;
            border-left:1px solid #ddd;
            padding-top:5px;
        }
        .my_specTd > .specail_span:first-child {
            border-left:none;
        }
        .specil_background {
            background:#fff!important;
        }
        .specil_input {
            width:50px!important;
            border:none;
            height:25px!important;
            border-bottom:1px solid #ccc!important;
            box-shadow:none;
            outline:none;
            text-align:center;
        }
        .my_line {
            display:block;
            float:left;
            padding-left:10px;
            margin-bottom:10px;
        }
        .my_line>img {
            height:15px;
            width:auto;
            position:relative;
            top:-1px;
            cursor:pointer;
        }
        .more_select {
            padding-left:35px;
        }
        .it_select {
            width:200px!important;
            border:none;
            height:25px!important;
            border-bottom:1px solid #ccc!important;
            box-shadow:none;
            outline:none;
            visibility:hidden;            
        }
        .bbs_pull_down {
            cursor:pointer;
            width: 50px;
            height: 30px;
            background: #fff;
            display: block;
            margin: auto;
            padding-top: 8px;
            position: relative;
            cursor: pointer;
            color: #a6a6a6;
            box-shadow: 0 0 0 #ccc, /*左边阴影*/          0 0 0 #ccc, /*右边阴影*/          0 0 0 #ccc, /*顶部阴影*/          0 1px 1px #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="txt_userid" runat="server"/>
        <input type="hidden" id="txt_paperid" runat="server"/>
        <input type="hidden" id="txt_companyid" runat="server"/>
    <div class="question_survey">
        <%--<ul class="nav nav-pills">
            <li class="active"><a href="#personal_diagnosis" data-toggle="tab">诊断问卷</a></li>
            <li class="my_personal_record"><a href="#personal_examine" data-toggle="tab">审查问卷</a></li>
        </ul>--%>
        <div class="tab-content">
            <div class="tab-pane active" id="personal_diagnosis">
                <div class="personal_diagnosis_header">
                    <div class="personal_header_detail">
                        <h3 class="survey_header">
                            员工调查问卷
                        </h3>
                        <p class="survey_header2">
                            （本问卷只针对公司员工，本调研问卷采取不记名方式进行）
                        </p>
                        <p class="survey_header3">
                            填写说明：调查问题共分以下5种情况，请根据您的实际想法从选项中选择一项：
                        </p>
                        <table class="table table-bordered survey_table">
                            <tr>
                                <td class="text-center">选项</td>
                                <td class="text-center">解释</td>
                            </tr>
                            <tr>
                                <td>A.非常赞同</td>
                                <td>表示您对该项内容持完全肯定并持积极支持的态度</td>
                            </tr>
                            <tr>
                                <td>B.赞同</td>
                                <td>表示您认可此项内容</td>
                            </tr>
                            <tr>
                                <td>C.不置可否</td>
                                <td>表示您对此项内容不肯定、不否定或不了解</td>
                            </tr>
                            <tr>
                                <td>D.不赞同</td>
                                <td>表示此项内容基本不能反映实际情况</td>
                            </tr>
                            <tr>
                                <td>E.非常不赞同</td>
                                <td>表示此项内容完全不能反映实际情况</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="text-center bbs_pull_content">
                    <span class="bbs_pull_down">
                        <i class="glyphicon glyphicon-chevron-down"></i>
                    </span>
                </div>
                <div id="TitleContent" class="survey_content" runat="server">
                    <%--<div id="content1">
                        <h4>一、商业模式</h4>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">1</span>
                                公司有清晰的商业模式和价值主张?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                    </div>
                    <div id="content2">
                        <h4>二、战略规划</h4>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">1</span>
                                公司有非常清晰的战略规划?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                    </div>
                    <div id="content3">
                        <h4>三、公司治理</h4>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">1</span>
                                公司有清晰的商业模式和价值主张?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                    </div>--%>
                </div>
                <div id="sortNum" class="survey_footer" runat="server">
                    <%--<ul class="tab-all">
                        <li class="tabs_left this_tab" value="1">
                            1
                        </li>
                        <li class="tabs_left" value="2">
                            2
                        </li>
                        <li class="tabs_left" value="3">
                            3
                        </li>
                    </ul>
                    <div class="my_submit">
                        提交问卷
                    </div>--%>
                </div>
             </div>   
            <div class="tab-pane" id="personal_examine">
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
                <div class="survey_content">
                    <div id="section1">
                        <div class="survey_table_head">
                            申请企业最高负责人信息
                        </div>
                        <table class="table table-bordered survey_mytable">
                            <tr>
                                <td>姓名</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>性别</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>职务</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>手机号码</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>社会职务</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>微信号</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>类似培训经历</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>邮箱</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                        </table>
                        <div class="survey_table_head">
                            申请企业参课高管信息
                        </div>
                        <table class="table table-bordered survey_mytable">
                            <tr>
                                <td>姓名</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>性别</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>职务</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>手机号码</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>                           
                        </table>
                        <div class="survey_table_head">
                            申请企业基本信息
                        </div>
                        <table class="table table-bordered survey_mytable">
                            <tr>
                                <td>公司名称</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>所属行业</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>公司网址</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>公司成立时间</td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">公司规模</td>
                                <td class="text-center">
                                    总<input type="text" class="specil_input"/>人数
                                </td>
                                <td class="specil_background text-center">
                                    管理<input type="text" class="specil_input" />人数
                                </td>
                                <td class="text-center">
                                    技术<input type="text" class="specil_input" />人数
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="my_specTd">
                                    <span class="specail_span text-center">
                                        分公司<input type="text" class="specil_input" />家
                                    </span>
                                    <span class="specail_span text-center">
                                        子公司<input type="text" class="specil_input" />家
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="specail_Td">公司营业范围及产品或服务</td>
                                <td colspan="3" class="specail_Td">
                                    <textarea class="form-control">

                                    </textarea>
                                </td>                               
                            </tr>
                            <tr class="specail_Tr">
                                <td rowspan="4">公司业绩</td>
                                <td class="text-center">
                                    时间(年)
                                </td>
                                <td class="text-center">营业额(万)</td>
                                <td class="text-center">
                                    净利润(万)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2015
                                </td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2014
                                </td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2013
                                </td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                                <td>
                                    <input type="type" class="form-control" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="section2">
                        <h4 class="text-center">申请企业简况</h4>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">1</span>
                                企业所在行业未来的发展速度预估?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    <span>X≥100%</span>
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    <span>50%≤X<100%</span> 
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    <span>20%≤X<50%</span>
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    <span>0%≤X<20%</span>
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    <span>负增长</span>
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">2</span>
                                企业处于以下哪个发展阶段?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    初创期
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    成长期
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    快速发展期
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    成熟期
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    下滑期
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">3</span>
                                现在公司员工的工作状态（可多选）?
                            </p>
                            <div class="survey_select more_select">
                                <span class="my_line">
                                    <img src="/img/company_false.png" />
                                    缺乏创新精神和创业激情
                                </span>
                                <span class="my_line">
                                    <img src="/img/company_false.png" />
                                    积极主动性不够
                                </span>
                                <span class="my_line">
                                    <img src="/img/company_false.png" />
                                    能力欠缺或进步缓慢跟不上发展
                                </span>
                                <span class="my_line">
                                    <img src="/img/company_false.png" />
                                    忠诚度不高流动性大
                                </span>
                                <span class="my_line">
                                    <img src="/img/company_false.png" />
                                    基本状态还可以
                                </span>
                                <span class="my_line">
                                    <img src="/img/company_false.png" />
                                    非常好，充满激情和情怀
                                </span>
                                <span class="my_line">
                                    <img src="/img/company_false.png" class="it_checked"/>
                                    <span>其他</span>
                                    <input type="text" class="it_select"/>
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">4</span>
                                公司目前大股东的股份占比是?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    X≥80%
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    67%≤X<80%
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    51%≤X<67%
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    33.4%≤X<51%
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    20%≤X<33.4%
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    股权比较分散
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">5</span>
                                您对股权激励相关知识了解情况?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常了解，进行过专业系统的学习与培训
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    比较了解，进行过相关的学习培训
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    一般了解，会关注相关资讯
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不太了解
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    从未接触过
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">6</span>
                                准备何时开始做股权激励?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    立即开始
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    3个月以内
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    半年以内
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    半年至1年内
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    1年以上
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    暂不开始
                                </span>
                            </div>
                        </div>
                    </div>
                    <div id="section3">
                        <h4>三、公司治理</h4>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">1</span>
                                公司有清晰的商业模式和价值主张?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">2</span>
                                公司的商业模式具备差异化的竞争力?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">3</span>
                                公司的商业模式需要创新优化?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">4</span>
                                公司有明确的市场定位，并且有较大的市场空间与容量?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">5</span>
                                公司有较好的盈利模式，并能持续赢利?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">6</span>
                                公司的商业模式能有效地整合产业链资源?
                            </p>
                            <div class="survey_select">
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不置可否
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    不赞同
                                </span>
                                <span class="company_radio">
                                    <img src="/img/company_false.png" />
                                    非常不赞同
                                </span>
                            </div>
                        </div>
                        <div class="survey_one">
                            <p>
                                <span class="order_head">7</span>
                                目前企业发展最大的困境是什么：
                            </p>
                            <div class="survey_select">
                                <textarea placeholder="你认为公司急需改善的三个方面"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="survey_footer">
                    <ul class="tab-all1">
                        <li class="tabs_left this_tab" value="1">
                            1
                        </li>
                        <li class="tabs_left" value="2">
                            2
                        </li>
                        <li class="tabs_left" value="3">
                            3
                        </li>
                    </ul>
                    <div class="my_submit">
                        提交问卷
                    </div>
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
        $(".company_radio>img").click(function () {
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
                $(this).attr("src", "/img/company_true.png");
                $(this).attr("data_checked", "1");
                $(this).parent().siblings(".company_radio").children("img").attr("src", "/img/company_false.png");
                $(this).parent().siblings(".company_radio").children("img").attr("data_checked", "0");

                var str_paperID = $("#txt_paperid").val();//试卷ID
                var str_userID = $("#txt_userid").val();//用户ID
                var str_companyID = $("#txt_companyid").val();//公司id
                var str_titleID = $(this).attr("id").split("_")[1];//题目ID
                var str_answerID = $(this).attr("id").split("_")[2];//答案ID

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

        });
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
                //var str_titleID = $(this).attr("id").split("_")[1];//题目ID
                //var str_answerID = $(this).attr("id").split("_")[2];//答案ID
                var obj_data = {
                    action: "isCanTest",
                    str_paperID: str_paperID,
                    str_companyID: str_companyID
                }
                var url = "/tools/ajax_CUstomerManage.ashx";
                var result = ajaxFunObj(obj_data, url);
                var str_titleID = new Array();//没有选择的题目id
                var str_seltitleID = new Array();//选择的题目id
                if (result.status == 1) {
                    //alert(result.msg);
                    if (confirm("该试卷共"+result.count+"道题，已提交"+result.subcount+"道题，确定交卷吗？")) {
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
                                if (str_titleID.indexOf(str_seltitleID[i])!=-1) {//存在则移除
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
                        //console.log(str_titleID);
                        //console.log(str_seltitleID);

                        //alert(str_gapValue.join());
                        //return;
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
                            //alert(result.msg);
                        } else if(result.status==2){
                            alert("提交成功："+result.success+"条，失败："+result.error);
                        }
                    }
                } else {
                    alert(result.msg);
                }
                //else if (result.status == 2) {
                //    alert("你上次考试时间是：" + result.datetime + ",半个小时后再来");
                //}

                
            })
        })

        //去除数组重复元素
        function uniq(arr) {
            var a = [],
                o = {},
                i,
                v,
                len = arr.length;
            if (len < 2) {
                return arr;
            }
            for (i = 0; i < len; i++) {
                v = arr[i];
                if (o[v] !== 1) {
                    a.push(v);
                    o[v] = 1;
                }
            }
            return a;
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

    <%--<script type="text/javascript">
        $(function () {

        })

        //获取已经提交的题目
        function GetSubTitle() {
            var str_paperID = $("#txt_paperid").val();//试卷ID
            var str_userID = $("#txt_userid").val();//用户ID
            var str_companyID = $("#txt_companyid").val();//公司id
            var str_titleID = $(this).attr("id").split("_")[1];//题目ID
            var str_answerID = $(this).attr("id").split("_")[2];//答案ID
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
        }
    </script>--%>
</html>
