
<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Add_test.aspx.cs" Inherits="Web.PaperProduction.Add_test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../CSS/Blinds.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
试卷制作：<%=Request.QueryString["TitleType"]%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Button" runat="server">
    <asp:ImageButton ID="imgbt_Save" runat="server" ImageUrl="~/Images/Save.jpg" 
        onclick="imgbt_Save_Click" OnClientClick="return SavePaper()" ValidationGroup="2" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Text" runat="server">


    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_CourseTitle" runat="server" CssClass="title_14px"></asp:Label>
    </div>
    <div style="margin:5px; width:100%">
        <asp:Label ID="lb_CourseID" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:ImageButton ID="bt_Yes" runat="server" ImageUrl="~/Images/Auto.jpg" onclick="bt_Yes_Click"/>
    </div>
    <div style="margin:5px; float:left; width:100%">
        <asp:Label ID="lb_Name" runat="server" CssClass="title_14px">名称：</asp:Label>
        <asp:TextBox ID="tb_Name" runat="server" CssClass="table_Bottom" Width="500px" Height="22px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="*" ControlToValidate="tb_Name" CssClass="text_12px" 
            ValidationGroup="2"></asp:RequiredFieldValidator>
    </div>
    <script src="../JS/jquery-1.11.2.min.js"></script>
    <script src="../JS/Company_Common.js"></script>
    <script language="javascript" type="text/javascript">
        // 鼠标经过改变行的颜色
        var _oldColor;
        function SetNewColor(source) {
            _oldColor = source.style.backgroundColor;
            source.style.backgroundColor = '#EFEFEF';
        }
        function SetOldColor(source) {
            source.style.backgroundColor = _oldColor;
        }   
    </script>
    <script language="javascript" type="text/javascript">
        function xiugroup(TitleType, CourseID, ID) {
            theDes = "height=600,width=600,top=0,left=0,location=no,menubar=no,resizable=yes,scrollbars=yes,status=yes,titlebar=no,toolbar=no,directories=no";
            newopen = window.open("Details" + TitleType + "-" + CourseID + "-" + ID + ".html", "newwindow", theDes);
        }


    </script>

    <%--add by wangke 2016-11-23--%>
    <script type="text/javascript">
        var arrList=new Array();
        var arrScore=new Array();
        $(function () {
            //给CheckBox添加点击事件
            $(document).on("click","#ct100_01 input[type='checkbox']",function(){
                //alert($("#score_118").val());

                if($(this).is(':checked')){
                    //$(this).parent().next().find("#ctl00_Text_gv_01_ctl02_textfield").val() 获取分数
                    
                    arrList.push($(this).attr("data_id"));
                }else {
                    if(arrList.indexOf($(this).attr("data_id"))!=-1){
                        for(var i=0;i<arrList.length;i++){
                            if(arrList[i]==$(this).attr("data_id")){
                                arrList.splice(i,1);
                            }
                        }
                    }
                    //alert(arrList);
                }
            });

            //blur事件监控
            $(document).on("blur","#ct100_01 input[name='score']",function(){
                var titleID=$(this).attr("id").split("_")[1];
                var score=$(this).val();
                if(score==""){
                    score="0";
                }
                //arrScore.push(score+"_"+titleID);
                arrScore[titleID]=score;
            })

            categoryList();
            
        })

        //add by wangke 2016-11-24 选中类别加载对应题目
        function categoryList(){
            $("#ctl00_Text_ddl_category,#ctl00_Text_ddl_category1").change(function () {  //add by wangke 2016-11-23 类别下拉框改变是获取题目列表
                var type = $(this).val();
                if($(this).attr("data_type")=="1"){
                    //联动
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
                                    GetTitle(item.YS_ID);
                                    strHtml += '<option value="' + item.YS_ID + '" selected="true">' + item.YS_DESC + '</option>';
                                } else {
                                    strHtml += '<option value="' + item.YS_ID + '">' + item.YS_DESC + '</option>';
                                }
                            })
                            $("#ctl00_Text_ddl_category1 option").remove();
                            $("#ctl00_Text_ddl_category1").append(strHtml);
                        }
                    } else {
                        $("#ctl00_Text_ddl_category1 option").remove();
                        $("#ctl00_Text_ddl_category1").append("<option value=''>-- 请选择 --</option>");
                        $("#ctl00_Text_gv_01").css("display","block");
                        $("#ct100_01").css("display","none");
                    }
                }else if($(this).attr("data_type")=="2") {
                    GetTitle($(this).val());
                }

            })
        }

        //根据类别获取题目
        function GetTitle(status_id){
            $("#ct100_01").empty();
            $("#ctl00_Text_gv_01").css("display","none");
            
            
            $.ajax({
                type: "post",
                url: "/tools/GetTitleList_ajax.ashx",
                data: {
                    "action": "GetTitleList",
                    "status_id": status_id,
                    "CourseID":<%=CourseID%>
                    },
                dataType: "json",
                success: function (result) {
                    //$("#ctl00_Text_gv_01").css("display","none");
                    var htmlStr="<table class='text_12px' cellspacing='0' border='0' id='ct100_01' style='border-collapse:collapse;'><tbody>";
                    $.each(result,function(i,item){
                        var html="";
                        html+="<tr onmouseover='SetNewColor(this);' onmouseout='SetOldColor(this);'>";
                        html+="<td><table><tbody><tr style='height:30px'>";
            
                        if(arrList.indexOf(item.ID)!=-1){//选中框
                            html+="<td><input name='checkbox' type='checkbox' id='checkbox_"+item.ID+"' checked='checked' data_id='"+item.ID+"' data_Analysis='"+item.Analysis+"' class='text_12px'>";
                        }else {
                            html+="<td><input name='checkbox' type='checkbox' id='checkbox_"+item.ID+"' data_id='"+item.ID+"' data_Analysis='"+item.Analysis+"' class='text_12px'>";
                        }
                        html+="<input name='hid' type='hidden' value='"+item.ID+"'</td>";

                        if(arrScore.hasOwnProperty(item.ID)){//分数
                            if(arrScore[item.ID]=="0"){
                                html+="<td><input name='score' type='text'id='score_"+item.ID+"' value='' size='3'class='table_Bottom'><td>";
                            }else {
                                html+="<td><input name='score' type='text'id='score_"+item.ID+"' value='"+arrScore[item.ID]+"' size='3'class='table_Bottom'><td>";
                            }
                        }else {
                            html+="<td><input name='score' type='text'id='score_"+item.ID+"'size='3'class='table_Bottom'><td>";
                        }

                        //html+="<td><input name='score' type='text'id='score_"+item.ID+"'size='3'class='table_Bottom'><td>";
                        html+="<td align='center' style='width:10px'><img src='../Images/04.jpg' alt='题目'></td>";
                        html+="<td><span style='cursor:hand' onclick='xiugroup(\"问卷\","+<%=CourseID%>+","+item.ID+")'>";
                        html+="<span id='lb_Title_"+item.ID+"' class='text_12px'>"+item.Title+"</span></span>-["+item.Extent+"]";
                        html+="</td></tr></tbody></table></td></tr>";
                        htmlStr+=html;
                    })
                    htmlStr+="</tbody></table>";
                    $("#ctl00_Text_gv_01").after(htmlStr);
                }
            });
        }


        //add by wangke 2016-11-23 保存试卷时先判断生成类型,根据生成类型选择对应保存方法
        function SavePaper(){
            var str_score=new Array();
            $.each(arrList,function(i,item){
                if(arrScore.hasOwnProperty(item)){
                    str_score.push(arrScore[item]);
                }else {
                    str_score.push("0");
                }
            })

            if ($('select#ctl00_Text_ddl_category option:selected').val() != ""){

                $.ajax({
                    type: "post",
                    url: "../tools/GetTitleList_ajax.ashx",
                    data: {
                        "action": "SavePaper",
                        "Type": "<%=Request.QueryString["TitleType"]%>",
                        "CourseID":<%=CourseID%>,
                        "Name":$("#ctl00_Text_tb_Name").val(),
                        "array":arrList.join(),
                        "str_score":str_score.join(),
                        "Status_id":$('select#ctl00_Text_ddl_category1 option:selected').val()
                    },
                    dataType: "json",
                    success: function (result) {
                        alert(result.msg);
                    }
                });

                return false;
            }else {
                return true;
            }
            
        }
    </script>
    <div id="category01" style="margin:5px; float:left; width:100%">
        <table style="width:95.9%" border="0" cellpadding="0" cellspacing="0">
         <tr align="center" style="height:28px">
          <td class="menu_title_on" id="TabTitle1" runat="server"><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">单选</asp:LinkButton></td><td class="my_mid">&nbsp;</td>
          <td class="menu_title" id="TabTitle2" runat="server"><asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">多选</asp:LinkButton></td><td class="my_mid">&nbsp;</td>
          <td class="menu_title" id="TabTitle3" runat="server"><asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">不定项选</asp:LinkButton></td><td class="my_mid">&nbsp;</td>
          <td class="menu_title" id="TabTitle4" runat="server"><asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">判断题</asp:LinkButton></td><td class="my_mid">&nbsp;</td>
          <td class="menu_title" id="TabTitle5" runat="server"><asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">值选题</asp:LinkButton></td><td class="my_right">&nbsp;</td>
         </tr>
        </table>
        <table width="95.9%" border="0" cellpadding="0" cellspacing="0" class="table_Box1">
            <tr>
                <td>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                    <div style="margin:5px">
                        <table class="title_14px">
                            <%--add by wangke 2016-11-23 添加类别下拉框--%>
                            <tr>
                                <td>类别选择：</td>
                                <td>
                                    <asp:DropDownList ID="ddl_category" data_type="1" runat="server" AutoPostBack="false"></asp:DropDownList>

                                </td>
                                <td>
                                    <asp:DropDownList runat="server" data_type="2" ID="ddl_category1"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>选择</td>
                                <td>分值</td>
                                <td style="width:200px" align="center">题目</td>
                            </tr>
                        </table>
                        <asp:GridView ID="gv_01" runat="server" AutoGenerateColumns="False" 
                            CssClass="text_12px" GridLines="None" ShowHeader="False" 
                            onrowdatabound="gv_01_RowDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table>
                                            <tr style="height:30px">
                                                <td><input type="checkbox" name="checkbox" id="checkbox" runat="server" class="text_12px"/></td>
                                                <td><input type="text" name="textfield" id="textfield"  size="3" runat="server" class="table_Bottom" /></td>
                                                <td align="center" style="width:10px"><img src="../Images/04.jpg" alt="题目" /></td>
                                                <td><span style="cursor:hand" onclick="xiugroup('<%=Request.QueryString["TitleType"]%>',<%=CourseID%>,<%#Eval("ID") %>)">
                                                    <asp:Label ID="lb_Title" runat="server" Text='<%#Eval("Title") %>' CssClass="text_12px"></asp:Label></span>
                                                    <asp:Label ID="lb_Analysis" runat="server" Text='<%# Eval("Analysis") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="lb_ID" runat="server" Text='<%# Eval("ID") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="lb_T_F" runat="server" Text='<%# Eval("T_F") %>' CssClass="text_12px" Visible="False"></asp:Label>-[<%#Eval("Extent")%>]
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div style="margin:5px">
                            <table class="title_14px">
                                <tr>
                                    <td>选择</td>
                                    <td>分值</td>
                                    <td style="width:200px" align="center">题目</td>
                                </tr>
                            </table>
                            <asp:GridView ID="gv_02" runat="server" AutoGenerateColumns="False" 
                                CssClass="text_12px" GridLines="None" ShowHeader="False" 
                                onrowdatabound="gv_01_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table>
                                                <tr style="height:30px">
                                                    <td><input type="checkbox" name="checkbox" id="checkbox1" runat="server" class="text_12px"/></td>
                                                    <td><input type="text" name="textfield" id="text1"  size="3" runat="server" class="table_Bottom" /></td>
                                                    <td align="center" style="width:10px"><img src="../Images/04.jpg" alt="题目" /></td>
                                                    <td><span style="cursor:hand" onclick="xiugroup('<%=Request.QueryString["TitleType"]%>',<%=CourseID%>,<%#Eval("ID") %>)">
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Title") %>' CssClass="text_12px"></asp:Label></span>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Analysis") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ID") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("T_F") %>' CssClass="text_12px" Visible="False"></asp:Label>-[<%#Eval("Extent")%>]
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <div style="margin:5px">
                            <table class="title_14px">
                                <tr>
                                    <td>选择</td>
                                    <td>分值</td>
                                    <td style="width:200px" align="center">题目</td>
                                </tr>
                            </table>
                            <asp:GridView ID="gv_03" runat="server" AutoGenerateColumns="False" 
                                CssClass="text_12px" GridLines="None" ShowHeader="False" 
                                onrowdatabound="gv_01_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table>
                                                <tr style="height:30px">
                                                    <td><input type="checkbox" name="checkbox" id="checkbox2" runat="server" class="text_12px"/></td>
                                                    <td><input type="text" name="textfield" id="text2"  size="3" runat="server" class="table_Bottom" /></td>
                                                    <td align="center" style="width:10px"><img src="../Images/04.jpg" alt="题目" /></td>
                                                    <td><span style="cursor:hand" onclick="xiugroup('<%=Request.QueryString["TitleType"]%>',<%=CourseID%>,<%#Eval("ID") %>)">
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("Title") %>' CssClass="text_12px"></asp:Label></span>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Analysis") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ID") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("T_F") %>' CssClass="text_12px" Visible="False"></asp:Label>-[<%#Eval("Extent")%>]
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <div style="margin:5px">
                            <table class="title_14px">
                                <tr>
                                    <td>选择</td>
                                    <td>分值</td>
                                    <td style="width:200px" align="center">题目</td>
                                </tr>
                            </table>
                            <asp:GridView ID="gv_04" runat="server" AutoGenerateColumns="False" 
                                CssClass="text_12px" GridLines="None" ShowHeader="False" 
                                onrowdatabound="gv_01_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table>
                                                <tr style="height:30px">
                                                    <td><input type="checkbox" name="checkbox" id="checkbox3" runat="server" class="text_12px"/></td>
                                                    <td><input type="text" name="textfield" id="text3"  size="3" runat="server" class="table_Bottom" /></td>
                                                    <td align="center" style="width:10px"><img src="../Images/04.jpg" alt="题目" /></td>
                                                    <td><span style="cursor:hand" onclick="xiugroup('<%=Request.QueryString["TitleType"]%>',<%=CourseID%>,<%#Eval("ID") %>)">
                                                    <asp:Label ID="Label9" runat="server" Text='<%#Eval("Title") %>' CssClass="text_12px"></asp:Label></span>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Analysis") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("ID") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("T_F") %>' CssClass="text_12px" Visible="False"></asp:Label>-[<%#Eval("Extent")%>]
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <div style="margin:5px">
                            <table class="title_14px">
                                <tr>
                                    <td>选择</td>
                                    <td>分值</td>
                                    <td style="width:200px" align="center">题目</td>
                                </tr>
                            </table>
                            <asp:GridView ID="gv_05" runat="server" AutoGenerateColumns="False" 
                                CssClass="text_12px" GridLines="None" ShowHeader="False" 
                                onrowdatabound="gv_05_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table>
                                                <tr style="height:30px">
                                                    <td><input type="checkbox" name="checkbox" id="checkbox4" runat="server" class="text_12px"/></td>
                                                    <td><input type="text" name="textfield" id="text4"  size="3" runat="server" class="table_Bottom" /></td>
                                                    <td align="center" style="width:10px"><img src="../Images/04.jpg" alt="题目" /></td>
                                                    <td><span style="cursor:hand" onclick="xiugroup('<%=Request.QueryString["TitleType"]%>',<%=CourseID%>,<%#Eval("ID") %>)">
                                                    <asp:Label ID="Label13" runat="server" Text='<%#Eval("Title") %>' CssClass="text_12px"></asp:Label></span>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("Analysis") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("ID") %>' CssClass="text_12px" Visible="False"></asp:Label>
                                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("T_F") %>' CssClass="text_12px" Visible="False"></asp:Label>-[<%#Eval("Extent")%>]
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                    <asp:GridView ID="gv_01_1" runat="server" AutoGenerateColumns="False" 
                                                        CssClass="text_12px" GridLines="None" ShowHeader="False">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <table class="text_12px">
                                                                        <tr>
                                                                            <td><input type="text" name="textfield" id="text5"  size="3" runat="server" class="table_Bottom" /></td>
                                                                            <td align="center" style="width:10px"><img src="../Images/04.jpg" alt="题目" /></td>
                                                                            <td><%#Eval("Name") %></td>
                                                                            <td>(<%#Eval("T_F") %>)<asp:Label ID="Label17" runat="server" Text='<%# Eval("ID") %>' CssClass="text_12px" Visible="False"></asp:Label></td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>
                </asp:MultiView>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                <asp:LinkButton ID="lbt" runat="server" onclick="lbt_Click" CssClass="title_14px">计算</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lb_Msg" runat="server" CssClass="text_12px"></asp:Label></td>
            </tr>
        </table>
    </div>
    

    
</asp:Content>
