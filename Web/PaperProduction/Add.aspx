<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Right.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Web.PaperProduction.Add1" %>
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
        $(function () {

            $(document).on("click","#ct100_01 input[type='checkbox']",function(){
                if($(this).is(':checked')){
                    //$(this).parent().next().find("#ctl00_Text_gv_01_ctl02_textfield").val() 获取分数
                    
                    arrList.push($(this).attr("data_id"));
                }else {
                    if(arrList.indexOf($(this).attr("data_id"))!=-1){
                        for(var i=0;i<arrList.length;i++){
                            if(arrList[i]==$(this).attr("data_id")){
                                arrList.splice(i,1);//从下标为i的元素开始，连续删除1个元素
                                i--;//因为删除下标为i的元素后，该位置又被新的元素所占据，所以要重新检测该位置
                            }
                        }
                    }
                    alert(arrList);
                }
            });


            $("#ctl00_Text_ddl_category").change(function () {  //add by wangke 2016-11-23 类别下拉框改变是获取题目列表
                
                if ($('select#ctl00_Text_ddl_category option:selected').val() != "0") {
                    $("#ct100_01").empty();
                    $("#ctl00_Text_gv_01").css("display","none");

                    $.ajax({
                        type: "post",
                        url: "../tools/GetTitleList_ajax.ashx",
                        data: {
                            "action": "GetTitleList",
                            "status_id": $('select#ctl00_Text_ddl_category option:selected').val(),
                            "CourseID":<%=CourseID%>
                        },
                        dataType: "json",
                        success: function (result) {
                            //$("#ctl00_Text_gv_01").css("display","none");
                            

                            var htmlStr="<table class='text_12px' cellspacing='0' border='0' id='ct100_01' style='border-collapse:collapse;'><tbody>";
                            $.each(result.T_blog,function(i,item){
                                var html="";
                                html+="<tr onmouseover='SetNewColor(this);' onmouseout='SetOldColor(this);'>";
                                html+="<td><table><tbody><tr style='height:30px'>";

                                if(arrList.indexOf(item.ID)!=-1){
                                    html+="<td><input name='ctl00$Text$gv_01$ctl02$checkbox' type='checkbox' id='ctl00_Text_gv_01_ctl02_checkbox' checked='checked' data_id='"+item.ID+"' data_Analysis='"+item.Analysis+"' class='text_12px'>";
                                }else {
                                    html+="<td><input name='ctl00$Text$gv_01$ctl02$checkbox' type='checkbox' id='ctl00_Text_gv_01_ctl02_checkbox' data_id='"+item.ID+"' data_Analysis='"+item.Analysis+"' class='text_12px'>";
                                }

                                //html+="<td><input name='ctl00$Text$gv_01$ctl02$checkbox' type='checkbox' id='ctl00_Text_gv_01_ctl02_checkbox' data_id='"+item.ID+"' data_Analysis='"+item.Analysis+"' class='text_12px'>";
                                html+="<input name='hid' type='hidden' value='"+item.ID+"'</td>";
                                html+="<td><input name='ctl00$Text$gv_01$ctl02$textfield' type='text' id='ctl00_Text_gv_01_ctl02_textfield' size='3' class='table_Bottom'></td>";
                                html+="<td align='center' style='width:10px'><img src='../Images/04.jpg' alt='题目'></td>";
                                html+="<td><span style='cursor:hand' onclick='xiugroup(\"问卷\","+<%=CourseID%>+","+item.ID+")'>";
                                html+="<span id='ctl00_Text_gv_01_ctl02_lb_Title' class='text_12px'>"+item.Title+"</span></span>-["+item.Extent+"]";
                                html+="</td></tr></tbody></table></td></tr>";
                                htmlStr+=html;
                            })
                            htmlStr+="</tbody></table>";
                            $("#ctl00_Text_gv_01").after(htmlStr);
                        }
                    });
                }else {
                    $("#ctl00_Text_gv_01").css("display","block");
                    $("#ct100_01").css("display","none");
                }
            })
        })

        //add by wangke 2016-11-23 保存试卷时先判断生成类型,根据生成类型选择对应保存方法

        function SavePaper(){
            var str="";
            $.each(arrList,function(i,item){
                str+=item+",";
            })

            if ($('select#ctl00_Text_ddl_category option:selected').val() != "0"){

                $.ajax({
                        type: "post",
                        url: "../tools/GetTitleList_ajax.ashx",
                        data: {
                            "action": "SavePaper",
                            "Type": "<%=Request.QueryString["TitleType"]%>",
                            "CourseID":<%=CourseID%>,
                            "Name":$("#ctl00_Text_tb_Name").val(),
                            "array":str,
                            "Status_id":$('select#ctl00_Text_ddl_category option:selected').val()
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
                                    <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="false"></asp:DropDownList></td>
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
                                                                            <td><input type="text" name="textfield" id="textfield"  size="3" runat="server" class="table_Bottom" /></td>
                                                                            <td align="center" style="width:10px"><img src="../Images/04.jpg" alt="题目" /></td>
                                                                            <td><%#Eval("Name") %></td>
                                                                            <td>(<%#Eval("T_F") %>)<asp:Label ID="lb_ID" runat="server" Text='<%# Eval("ID") %>' CssClass="text_12px" Visible="False"></asp:Label></td>
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