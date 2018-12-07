using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ItemBankManagement
{
    public partial class RadioValue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            try
            {
                BLL.TitleList bll = new BLL.TitleList();
                Model.TitleList model = new Model.TitleList();
                model.CourseID = int.Parse(Request.QueryString["CourseID"]);
                model.Type = Request.QueryString["TitleType"];
                model.Title = Common.Function.StringEncode(tb_Title.Text.Trim());
                model.Analysis = Common.Function.StringEncode(tb_Analysis.Text.Trim());
                model.Extent = rbl_Extent.SelectedValue.ToString();
                int TitleListID = bll.Add(model);
                if (TitleListID > 0)
                {
                    int k = 0;
                    int l = 0;
                    string del_Work = "";
                    del_Work = Request.Form["del_Work"].ToString();
                    int num = int.Parse(Request.Form["WorkExpNum"].ToString());
                    for (int i = 1; i <= num; i++)
                    {
                        if (del_Work.IndexOf(i.ToString()) <= 0)
                        {
                            //Response.Write(i + "：" + Request.Form["Name" + i] + Request.Form["radio" + i] + "<br/>");
                            string radio = Request.Form["radio" + i];
                            string Name = Request.Form["Name" + i];
                            if (Name == "")
                            { }
                            else
                            {
                                BLL.OptionsList bll1 = new BLL.OptionsList();
                                Model.OptionsList model1 = new Model.OptionsList();
                                model1.TitleListID = TitleListID;
                                model1.Name = Common.Function.StringEncode(Name);
                                model1.T_F = radio;
                                
                                if (bll1.Add(model1) > 0)
                                {
                                    k = k + 1;
                                    //Common.Function.AlertRedirect("添加成功！", "/I-B/List" + Request.QueryString["TitleType"] + "-" + Request.QueryString["CourseID"] + ".html", "Iframe_Div_Mid_Mid");
                                }
                                else
                                {
                                    l = l + 1;
                                    //Common.Function.AlertRedirect("系统繁忙请稍后再试！", "/I-B/List" + Request.QueryString["TitleType"] + "-" + Request.QueryString["CourseID"] + ".html", "Iframe_Div_Mid_Mid");
                                }
                            }
                        }
                    }
                    lb_msg.Text = "题目添加成功，选择成功添加[" + k + "]条,失败[" + l + "]条！";
                }
                else
                {
                    lb_msg.Text = "题目添加失败！";
                    //Common.Function.AlertRedirect("", "/I-B/List" + Request.QueryString["TitleType"] + "-" + Request.QueryString["CourseID"] + ".html");
                    //Common.Function.AlertRedirect("系统繁忙请稍后再试！", "/I-B/List" + Request.QueryString["TitleType"] + "-" + Request.QueryString["CourseID"] + ".html", "Iframe_Div_Mid_Mid");
                }
            }
            catch
            {
                lb_msg.Text = "系统繁忙请稍后再试！";
            }
        }
    }
}
