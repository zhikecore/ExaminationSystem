using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.CustomerManage
{
    public partial class CustomerList : System.Web.UI.Page
    {
        int recordCount;//总记录数
        int pageSize = 12;//页面大小

        protected void Page_Load(object sender, EventArgs e)
        {
            int pageID = Convert.ToInt32(Request.QueryString["pageID"]);//当前页数
            if (pageID == 0)
            {
                pageID = 1;
            }
            GetCompanyList(pageID);
        }

        //获取客户列表
        private void GetCompanyList(int pageID)
        {
            
            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();

            DataTable dt = BCompany.GetListByPage("1=1", "id", pageSize, pageID, out recordCount).Tables[0];
            string strHtml = "";
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    strHtml += "<tr><td style=\"font-weight:bold\">" + item["Name"].ToString() + "</td><td>"+item["obj_ID"].ToString()+"</td><td><a href=\"http://" + item["Website"].ToString() + "\" target=\"_blank\">" + item["Website"].ToString() + "</a></td><td></td><td></td><td></td><td>" + item["CreateTime"].ToString() + "</td>";
                    strHtml += "<td><span><a href=\"/CustomerManage/CustomerEdit.aspx?ID= " + item["ID"].ToString() + "\">编辑</a></span>&nbsp;";
                    strHtml += "<span id=\"sp_" + item["ID"].ToString() + "\"><a href=\"javascript: \">删除</a></span>&nbsp;";
                    strHtml += "<span><a href=\"/CustomerManage/EmployeeList.aspx?CompanyID=" + item["ID"].ToString() + "\">员工管理</a></span>&nbsp;";
                    strHtml += "<span><a href=\"/CustomerManage/PaperAuthorManage.aspx?CompanyID=" + item["ID"].ToString() + "\">授权管理</a></span></td>";
                    strHtml += "</tr>";
                }
            }
            tr_List.InnerHtml = strHtml;
            pageList.InnerHtml = Common.PagingHelper.OutPageList(pageSize,pageID,recordCount,"/CustomerManage/CustomerList.aspx");//分页
        }
    }
}