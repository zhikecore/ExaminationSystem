using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ItemBankManagement
{
    public partial class Radio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TreeBind("TEST_TYPE");
            }
        }

        /// <summary>
        /// 绑定类别
        /// </summary>
        /// <param name="ys_code"></param>
        private void TreeBind(string ys_code)
        {
            BLL.Status bll = new BLL.Status();
            List<Model.Status> list = new List<Model.Status>();
            list = bll.GetCategory();

            this.ddl_category.Items.Clear();
            this.ddl_category.Items.Add(new ListItem("-- 请选择 --", ""));
            this.ddl_category1.Items.Add(new ListItem("-- 请选择 --", ""));
            foreach (Model.Status sta in list)
            {
                string YS_TYPE = sta.YS_TYPE.ToString();
                string YS_REMARK = sta.YS_REMARK.ToString().Trim();

                this.ddl_category.Items.Add(new ListItem(YS_REMARK, YS_TYPE));
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
                model.Status_id = int.Parse(ddl_category1.SelectedValue.ToString());


                int TitleListID=bll.Add(model);
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
                            //int radio = int.Parse(Request.Form["radio"]);
                            int radio = 0;
                            if (Request.Form["radio"] != null)
                            {
                                radio = int.Parse(Request.Form["radio"]);
                            }
                            string Name = Request.Form["Name" + i];
                            if (Name == "")
                            { }
                            else
                            {
                                BLL.OptionsList bll1 = new BLL.OptionsList();
                                Model.OptionsList model1 = new Model.OptionsList();
                                model1.TitleListID = TitleListID;
                                model1.Name = Common.Function.StringEncode(Name);
                                if (radio == i)
                                {
                                    model1.T_F = "T";
                                }
                                else
                                {
                                    model1.T_F = "";
                                }
                                if (bll1.Add(model1) > 0)
                                {
                                    k = k + 1;
                                }
                                else
                                {
                                    l = l + 1;
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
                }
            }
            catch (Exception ex)
            {
                throw;
                lb_msg.Text="系统繁忙请稍后再试！";
            }
        }

        protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
        {
            string type = ddl_category.SelectedValue;
            BLL.Status bll = new BLL.Status();
            DataTable dt = bll.GetStatusList("YS_TYPE='" + type + "'");
            this.ddl_category1.Items.Clear();
            //this.ddl_category1.Items.Add(new ListItem("-- 请选择 --", ""));
            foreach (DataRow dr in dt.Rows)
            {
                string YS_ID = dr["YS_ID"].ToString();
                string YS_DESC = dr["YS_DESC"].ToString().Trim();

                this.ddl_category1.Items.Add(new ListItem(YS_DESC, YS_ID));
            }
        }
    }
}
