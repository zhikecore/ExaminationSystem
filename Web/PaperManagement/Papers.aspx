<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Papers.aspx.cs" Inherits="Web.PaperManagement.Papers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        var asciiF5 = 116;
        var asciiF10 = 121;
        var asciiR = 82;
        document.onkeydown = key;
        document.onkeypress = key;

        function key(evt) {
            var oEvent = window.event || evt;
            var nKeyCode = oEvent.keyCode || oEvent.which;
            var bIsFunctionKey = false;
            if (oEvent.keyCode == asciiF5 || oEvent.keyCode == asciiF10 || oEvent.keyCode == asciiR) {
                alert("不可按F5/F10/R");
                bIsFunctionKey = oEvent.keyCode;
            }
            var sChar = String.fromCharCode(nKeyCode).toUpperCase();
            var oTarget = (oEvent.target) ? oEvent.target : oEvent.srcElement;
            var sTag = oTarget.tagName.toLowerCase();
            var sTagType = oTarget.getAttribute("type");
            var bRet = true;
            if (sTagType != null) {
                sTagType = sTagType.toLowerCase();
            }
            if (bIsFunctionKey) {
                bRet = false;
            }
            if (!bRet) {
                try {
                    oEvent.returnValue = false;
                    oEvent.cancelBubble = true;
                    if (document.all) {
                        oEvent.keyCode = 0;
                    }
                    else {
                        oEvent.preventDefault();
                        oEvent.stopPropagation();
                    }
                }
                catch (ex) {

                }
            }
            return bRet;
        }
        function window.onunload() {
            //document.getElementById("bt_Yes").click();
            //alert("这就是你要做的事,关闭网页之后做的！");
            document.getElementById("bt_Close").click();
            alert("成功交卷！");
            //self.close();
        }
        function window.onbeforeunload() {
            //alert("这就是你要做的事,关闭网页之前做的！");
            //document.getElementById("bt_Close").click();
            //alert("关闭网页之前成功交卷！");
            self.close();
        }
    </script>
    <script language="JavaScript" type="text/javascript">
        lastScrollY = 0;
        function heartBeat() {
            var diffY;
            if (document.documentElement && document.documentElement.scrollTop)
                diffY = document.documentElement.scrollTop;
            else if (document.body)
                diffY = document.body.scrollTop
            else
            { /*Netscape stuff*/ }
            //alert(diffY);
            percent = .1 * (diffY - lastScrollY);
            if (percent > 0) percent = Math.ceil(percent);
            else percent = Math.floor(percent);
            //document.getElementById("lovexin12").style.top = parseInt(document.getElementById("lovexin12").style.top) + percent + "px";
            document.getElementById("lovexin14").style.top = parseInt(document.getElementById("lovexin14").style.top) + percent + "px";
            lastScrollY = lastScrollY + percent;
            //alert(lastScrollY);
        }
        //suspendcode12 = "<DIV id=\"lovexin12\" style='left:2px;POSITION:absolute;TOP:120px;'>ad1</div>"
        suspendcode14 = "<DIV id=\"lovexin14\" style='right:2px;POSITION:absolute;TOP:120px;'>ad2</div>"
        //document.write(suspendcode12);
        document.write(suspendcode14);
        window.setInterval("heartBeat()", 1);
    </script>  
    <style type="text/css">
        #lovexin12,#lovexin14
        {
            width:120px;
            height:250px;
            background-color:#e5e5e5;
            border:1px solid #ddd;
        }
        html,body
        {
            height:1000px;
        }
        #mm
        {
            /*height:1000px;*/
        }
    </style>    
</head>
<body onload="remove_loading()" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0" oncontextmenu="return false" onSelectStart="return false">
    <form id="form1" runat="server">
    <div style="margin:5px; text-align: center;" class="text_12px"><asp:Label ID="lb_U" runat="server" Visible="false"></asp:Label>
    总分：<asp:Label ID="Label1" runat="server"></asp:Label> 时间：90分钟
    <asp:Button ID="bt_Yes" runat="server" Text="交卷" CssClass="table_Box" Height="30px" onclick="bt_Yes_Click" Width="60px" />
    </div>
    <div style="margin:5px" id="div1" runat="server">
    <table class="text_12px">
        <tr>
            <td style="width:2%" align="center"><asp:Label ID="lb_Num1" runat="server"></asp:Label></td>
            <td style="width:98%" align="left"><asp:Label ID="lb_Type1" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td>说明：</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_01" runat="server" AutoGenerateColumns="False" 
                    CssClass="text_12px" GridLines="None" ShowHeader="False" 
                    onrowdatabound="gv_01_RowDataBound" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="text_12px">
                                    <tr>
                                        <td style="width:2%" valign="top" align="center"><%#Eval("Num")%>、</td>
                                        <td style="width:90%" valign="top" align="left"><%#Eval("Title") %></td>
                                        <td style="width:8%" valign="top" align="right">(<%#Eval("Score") %> 分)</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:GridView ID="gv_01_1" runat="server" AutoGenerateColumns="False" 
                                                CssClass="text_12px" GridLines="None" ShowHeader="False">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <table class="text_12px">
                                                                <tr>
                                                                    <td><%#Common.Function.ToString(Eval("Num").ToString()+",")%>、</td>
                                                                    <td><%#Eval("Name") %></td>
                                                                    <td><%#Eval("T_F") %></td>
                                                                    <td><input type="radio" name='radio<%#Eval("TitleListID")%>' id='radio<%#Eval("TitleListID")%>' value='<%#Eval("ID") %>' class="text_12px" /></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>                                        
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    <div style="margin:5px" id="div2" runat="server">
    <table class="text_12px">
        <tr>
            <td style="width:2%" align="center"><asp:Label ID="lb_Num2" runat="server"></asp:Label></td>
            <td style="width:98%" align="left"><asp:Label ID="lb_Type2" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td>说明：</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_02" runat="server" AutoGenerateColumns="False" 
                    CssClass="text_12px" GridLines="None" ShowHeader="False" 
                    onrowdatabound="gv_01_RowDataBound" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="text_12px">
                                    <tr>
                                        <td style="width:2%" valign="top" align="center"><%#Eval("Num")%>、</td>
                                        <td style="width:90%" valign="top" align="left"><%#Eval("Title") %></td>
                                        <td style="width:8%" valign="top" align="right">(<%#Eval("Score") %> 分)</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:GridView ID="gv_01_1" runat="server" AutoGenerateColumns="False" 
                                                CssClass="text_12px" GridLines="None" ShowHeader="False">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <table class="text_12px">
                                                                <tr>
                                                                    <td><%#Common.Function.ToString(Eval("Num").ToString()+",")%>、</td>
                                                                    <td><%#Eval("Name") %></td>
                                                                    <td><%#Eval("T_F") %></td>
                                                                    <td><input type="checkbox" name='radio<%#Eval("TitleListID")%>' id='radio<%#Eval("TitleListID")%>' value='<%#Eval("ID") %>' class="text_12px" /></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>                                        
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    <div style="margin:5px" id="div3" runat="server">
    <table class="text_12px">
        <tr>
            <td style="width:2%" align="center"><asp:Label ID="lb_Num3" runat="server"></asp:Label></td>
            <td style="width:98%" align="left"><asp:Label ID="lb_Type3" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td>说明：</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_03" runat="server" AutoGenerateColumns="False" 
                    CssClass="text_12px" GridLines="None" ShowHeader="False" 
                    onrowdatabound="gv_01_RowDataBound" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="text_12px">
                                    <tr>
                                        <td style="width:2%" valign="top" align="center"><%#Eval("Num")%>、</td>
                                        <td style="width:90%" valign="top" align="left"><%#Eval("Title") %></td>
                                        <td style="width:8%" valign="top" align="right">(<%#Eval("Score") %> 分)</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:GridView ID="gv_01_1" runat="server" AutoGenerateColumns="False" 
                                                CssClass="text_12px" GridLines="None" ShowHeader="False">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <table class="text_12px">
                                                                <tr>
                                                                    <td><%#Common.Function.ToString(Eval("Num").ToString()+",")%>、</td>
                                                                    <td><%#Eval("Name") %></td>
                                                                    <td><%#Eval("T_F") %></td>
                                                                    <td><input type="checkbox" name='radio<%#Eval("TitleListID")%>' id='radio<%#Eval("TitleListID")%>' value='<%#Eval("ID") %>' class="text_12px" /></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>                                        
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    <div style="margin:5px" id="div4" runat="server">
    <table class="text_12px">
        <tr>
            <td style="width:2%" align="center"><asp:Label ID="lb_Num4" runat="server"></asp:Label></td>
            <td style="width:98%" align="left"><asp:Label ID="lb_Type4" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td>说明：</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_04" runat="server" AutoGenerateColumns="False" 
                    CssClass="text_12px" GridLines="None" ShowHeader="False" 
                    onrowdatabound="gv_01_RowDataBound" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="text_12px">
                                    <tr>
                                        <td style="width:2%" valign="top" align="center"><%#Eval("Num")%>、</td>
                                        <td style="width:90%" valign="top" align="left"><%#Eval("Title") %><%#Eval("T_F") %></td>
                                        <td style="width:8%" valign="top" align="right">(<%#Eval("Score") %> 分)</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            正确：<input type="radio" name='radio<%#Eval("ID")%>' id='radio<%#Eval("ID")%>' value='T' class="text_12px" />
                                            错误：<input type="radio" name='radio<%#Eval("ID")%>' id='radio<%#Eval("ID")%>' value='F' class="text_12px" />
                                            <asp:GridView ID="gv_01_1" runat="server" AutoGenerateColumns="False" 
                                                CssClass="text_12px" GridLines="None" ShowHeader="False">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <table class="text_12px">
                                                                <tr>
                                                                    <td><%#Common.Function.ToString(Eval("Num").ToString()+",")%>、</td>
                                                                    <td><%#Eval("Name") %></td>
                                                                    <td><%#Eval("T_F") %></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>                                        
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    <div style="margin:5px" id="div5" runat="server">
    <table class="text_12px">
        <tr>
            <td style="width:2%" align="center"><asp:Label ID="lb_Num5" runat="server"></asp:Label></td>
            <td style="width:98%" align="left"><asp:Label ID="lb_Type5" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td>说明：</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_05" runat="server" AutoGenerateColumns="False" 
                    CssClass="text_12px" GridLines="None" ShowHeader="False" 
                    onrowdatabound="gv_01_RowDataBound" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="text_12px">
                                    <tr>
                                        <td style="width:2%" valign="top" align="center"><%#Eval("Num")%>、</td>
                                        <td style="width:90%" valign="top" align="left"><%#Eval("Title") %></td>
                                        <td style="width:8%" valign="top" align="right">(<%#Eval("Score") %> 分)</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:GridView ID="gv_01_1" runat="server" AutoGenerateColumns="False" 
                                                CssClass="text_12px" GridLines="None" ShowHeader="False">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <table class="text_12px">
                                                                <tr>
                                                                    <td><%#Common.Function.ToString(Eval("Num").ToString()+",")%>、</td>
                                                                    <td><%#Eval("Name") %></td>
                                                                    <td><%#Eval("T_F") %></td>
                                                                    <td><input type="radio" name='radio<%#Eval("TitleListID")%>' id='radio<%#Eval("TitleListID")%>' value='<%#Eval("ID") %>' class="text_12px" /></td>
                                                                    <td>(<%#Eval("Score") %> 分)</td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>                                        
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Label ID="lb_ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    <div id="mm">
    </div>
    <asp:Button ID="bt_Close" runat="server" Width="0px" Height="0px" Visible="true" onclick="bt_Close_Click" />
    </form>
</body>
</html>