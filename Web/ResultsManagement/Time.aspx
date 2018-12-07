<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Time.aspx.cs" Inherits="Web.ResultsManagement.Time" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/HrSys.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#EFEFEF">
    <form id="form1" runat="server">
    <div style="margin-bottom:10px; float:left; width:100%">
        <table style="width:100%; background-color:#CCCCCC" border="0" cellpadding="1" cellspacing="1">
            <tr style="height:22px; background-image:url(/Images/bg_h_19px.jpg)">
                <td class="title_14px">
                    　按时间查
                </td>
            </tr>
            <tr>
                <td style="background-color:#FFFFFF" valign="top">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                        onselectionchanged="Calendar1_SelectionChanged" Width="100%">
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    </asp:Calendar>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
