using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace Web.tools
{
    /// <summary>
    /// GetTitleList_ajax 的摘要说明
    /// add by wangke 2016-11-23 处理ajax请求
    /// </summary>
    public class GetTitleList_ajax : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            //取得处事类型
            string action = context.Request["action"];
            switch (action)
            {
                case "GetTitleList": //获取题目列表
                    GetTitleList(context);
                    break;
                case "SavePaper":  //保存试卷
                    SavePaper(context);
                    break;
                case "GetCategory"://获取类型
                    GetCategory(context);
                    break;
            }
        }

        /// <summary>
        /// 获取题目列表
        /// </summary>
        /// <param name="context"></param>
        private void GetTitleList(HttpContext context)
        {
            int status_id= int.Parse(context.Request["status_id"].ToString());//类别ID
            int CourseID = int.Parse(context.Request["CourseID"].ToString());//课程ID
            BLL.TitleList bll = new BLL.TitleList();
            DataTable dt = bll.GetList("单选",CourseID,status_id);
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 保存试卷
        /// </summary>
        /// <param name="context"></param>
        private void SavePaper(HttpContext context)
        {
            string Name = context.Request["Name"].ToString();//类别ID
            int CourseID = int.Parse(context.Request["CourseID"].ToString());//课程ID
            string TitleType= context.Request["Type"].ToString();//类型
            string TitleID = context.Request["array"].ToString();//题目ID字符串
            int StatusID = int.Parse(context.Request["Status_id"].ToString());
            //string[] arrayTitle = DelLastComma(TitleID).Split(',');
            string[] arrayTitle = TitleID.Split(',');
            string str_score = context.Request["str_score"].ToString();//分数字符串
            //string[] arrayScore= DelLastComma(str_score).Split(',');
            string[] arrayScore = str_score.Split(',');

            //context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
            //return;

            BLL.Papers bll = new BLL.Papers();
            Model.Papers model = new Model.Papers();
            model.Name = Common.Function.StringEncode(Name);
            model.CourseID = CourseID;
            model.Type = TitleType;
            int PapersID = bll.Add(model);
            if (PapersID > 0)
            {
                AddPapersTitleList(PapersID, arrayTitle, arrayScore, CourseID, StatusID);
            }
            else
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
                return;
            }
            context.Response.Write("{\"status\": 1, \"msg\": \"保存成功！\"}");
            return;

        }

        /// <summary>
        /// 删除最后结尾的一个逗号
        /// </summary>
        public static string DelLastComma(string str)
        {
            if (str.Length < 1)
            {
                return "";
            }
            return str.Substring(0, str.LastIndexOf(","));
        }

        /// <summary>
        /// 添加试卷题目
        /// </summary>
        /// <param name="PapersID"></param>
        private void AddPapersTitleList(int PapersID,string[] arrayTitle,string[] arrayScore,int CourseID,int StatusID)
        {
            AddgvPapersTitleList("单选", PapersID, arrayTitle, arrayScore, CourseID);
            //AddgvPapersTitleList("多选", PapersID, arrayTitle, CourseID);
            //AddgvPapersTitleList("不定项选", PapersID, arrayTitle, CourseID);
            //AddgvPapersTitleList("判断题", PapersID, arrayTitle, CourseID);
            //AddgvPapersTitleList("值选项", PapersID, arrayTitle, CourseID);

            //Common.Function.AlertRedirect("添加成功！", "Add.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + int.Parse(lb_CourseID.Text));
        }

        /// <summary>
        /// 添加试卷题目
        /// </summary>
        /// <param name="Type">类型</param>
        /// <param name="gv">GridView</param>
        /// <param name="PapersID">PapersID</param>
        private void AddgvPapersTitleList(string Type, int PapersID,string[] arrayTitle, string[] arrayScore, int CourseID)
        {
            try
            {
                BLL.PapersTitleList bll = new BLL.PapersTitleList();
                Model.PapersTitleList model = new Model.PapersTitleList();

                int count = 0;
                foreach (var item in arrayTitle)
                {
                    BLL.TitleList Tbll = new BLL.TitleList();
                    List<Model.TitleList> list = Tbll.Details(int.Parse(item));

                    model.Title = list[0].Title;
                    model.T_F = list[0].T_F;
                    model.Analysis = list[0].Analysis;
                    model.ID = list[0].ID;
                    model.Score = int.Parse(arrayScore[count]);
                    model.CourseID = CourseID;
                    model.Type = Type;
                    model.PapersID = PapersID;
                    model.Status_id = int.Parse(list[0].Status_id.ToString());

                    count++;
                    if (bll.Add(model) > 0)
                    {
                        AddgvPapersOptionsList(model.ID, PapersID);
                    }
                    else
                    {
                        //如果题目添加不成功
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 添加试卷选项表
        /// </summary>
        /// <param name="TitleListID">TitleListID</param>
        private void AddgvPapersOptionsList(int TitleListID, int PapersID)
        {
            try
            {
                BLL.OptionsList bll = new BLL.OptionsList();
                List<Model.OptionsList> list = new List<Model.OptionsList>();
                list = bll.Details(TitleListID);

                for (int i = 0; i < list.Count; i++)
                {
                    BLL.PapersOptionsList Pbll = new BLL.PapersOptionsList();
                    Model.PapersOptionsList model = new Model.PapersOptionsList();
                    model.ID = list[i].ID;
                    model.TitleListID = TitleListID;
                    model.Name = list[i].Name;
                    model.T_F = list[i].T_F;
                    model.PapersID = PapersID;
                    model.Score = 0;
                    Pbll.Add(model);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 获取类型
        /// </summary>
        /// <param name="context"></param>
        private void GetCategory(HttpContext context)
        {
            string type = context.Request["type"].ToString();//类别ID
            BLL.Status bll = new BLL.Status();
            DataTable dt = bll.GetStatusList("YS_TYPE='"+ type + "'");
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}