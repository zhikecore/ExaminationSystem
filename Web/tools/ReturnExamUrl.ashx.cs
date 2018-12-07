using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace Web.tools
{
    /// <summary>
    /// ReturnExamUrl 的摘要说明
    /// </summary>
    public class ReturnExamUrl : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            context.Response.AddHeader("Access-Control-Allow-Origin", "*");
            string A = "http://exam.zhongliko.com/PaperManagement/Paper1_admin.aspx?paperID=123";//管理层调查问卷
            string B = "http://exam.zhongliko.com/PaperManagement/Paper2_admin.aspx?paperID=122";//员工调查问卷
            string C = "http://exam.zhongliko.com/PaperManagement/Paper3_admin.aspx?paperID=125";//企业信息

            string str_msg = "{\"status\": 0, \"msg\": \"您没有权限访问！\"}";//消息记录

            int int_companyID = Convert.ToInt32(context.Request["TC_ID"].ToString());//公司id
            string str_type = context.Request["type"].ToString();//试卷类型
            string str_companyName = context.Request["companyName"].ToString();//公司名称

            if (!GetCompany(int_companyID.ToString(), str_companyName))
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"请联系管理员！\"}");
                return;
            }

            try
            {
                int int_paperID = 0;
                string str_paperUrl = "";

                //判断试卷类型
                if (str_type == "A")
                {
                    int_paperID = int.Parse(A.Split('=')[1].ToString());
                    str_paperUrl = A;
                }
                else if (str_type == "B")
                {
                    int_paperID = int.Parse(B.Split('=')[1].ToString());
                    str_paperUrl = B;
                }
                else if (str_type == "C")
                {
                    int_paperID = int.Parse(C.Split('=')[1].ToString());
                    str_paperUrl = C;
                }

                //查询对应公司id
                Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();
                DataTable dt_BCompany = BCompany.GetList(" obj_ID=" + int_companyID + " AND Name='" + str_companyName + "' ").Tables[0];
                if (dt_BCompany.Rows.Count > 0)
                {
                    str_paperUrl += "&companyID=" + dt_BCompany.Rows[0]["ID"];
                    context.Response.Write("{\"status\": 1, \"msg\": \"" + str_paperUrl + "\"}");
                    return;
                }
            }
            catch (Exception)
            {

                context.Response.Write("{\"status\": 0, \"msg\": \"请联系管理员！\"}");
                return;
            }

            context.Response.Write(str_msg);
            return;

        }

        /// <summary>
        /// 根据公司id和名称查找指定公司是否存在(不存在则添加并返回id)
        /// 判断是否存在试卷权限，不存在添加
        /// </summary>
        /// <param name="str_ID"></param>
        /// <param name="str_companyName"></param>
        /// <returns></returns>
        private bool GetCompany(string str_ID,string str_companyName)
        {
            string[] arr_paperID = { "122", "123", "125" };//试卷id

            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();//公司

            Maticsoft.BLL.PaperManage BPaperManage = new Maticsoft.BLL.PaperManage();//试卷授权

            try
            {
                List<Maticsoft.Model.Company> listCompany = BCompany.GetModelList(" obj_ID=" + int.Parse(str_ID) + " AND Name='" + str_companyName + "' ");
                if (listCompany != null && listCompany.Count > 0)//该公司存在
                {

                    //判断有没有试卷授权
                    List<Maticsoft.Model.PaperManage> listPaperManage = BPaperManage.GetModelList(" CompanyID=" + listCompany[0].ID + " AND PaperID in(122,123,125)");
                    if (listPaperManage != null && listPaperManage.Count > 0)//该公司有试卷授权（）
                    {
                        List<string> paperID = new List<string>();

                        for (int i = 0; i < listPaperManage.Count; i++)
                        {
                            paperID.Add(listPaperManage[i].PaperID.ToString());//将授权试卷id拿出来
                        }

                        List<string> list_paperID = new List<string>();//保存没有授权试卷id
                                                                       //判断是否存在122,123,125这三份试卷
                        for (int i = 0; i < arr_paperID.Length; i++)
                        {
                            if (!paperID.Contains(arr_paperID[i]))//判断授权试卷中有没有122,123,125这三份试卷
                            {
                                list_paperID.Add(arr_paperID[i]);
                            }
                        }
                        if (list_paperID != null && list_paperID.Count > 0)//如果存在没有授权的则添加
                        {
                            for (int j = 0; j < list_paperID.Count; j++)
                            {
                                Maticsoft.Model.PaperManage MPaperManage = new Maticsoft.Model.PaperManage();
                                MPaperManage.PaperID = int.Parse(list_paperID[j].ToString());
                                MPaperManage.CompanyID = listCompany[0].ID;
                                MPaperManage.IsLongTime = true;
                                MPaperManage.CreateDateTime = DateTime.Now;
                                MPaperManage.Title = listCompany[0].Name + "授权";
                                MPaperManage.Num = 100;
                                if (BPaperManage.Add(MPaperManage) <= 0)
                                {
                                    return false;
                                }
                            }

                        }
                    }
                    else//改公司没有试卷授权
                    {
                        for (int j = 0; j < arr_paperID.Length; j++)
                        {
                            Maticsoft.Model.PaperManage MPaperManage = new Maticsoft.Model.PaperManage();
                            MPaperManage.PaperID = int.Parse(arr_paperID[j].ToString());
                            MPaperManage.CompanyID = listCompany[0].ID;
                            MPaperManage.IsLongTime = true;
                            MPaperManage.CreateDateTime = DateTime.Now;
                            MPaperManage.Title = listCompany[0].Name + "授权";
                            MPaperManage.Num = 100;
                            if (BPaperManage.Add(MPaperManage) <= 0)
                            {
                                return false;
                            }
                        }
                    }
                }
                else//公司不存在(添加)
                {
                    Maticsoft.Model.Company MCompany = new Maticsoft.Model.Company();
                    MCompany.obj_ID = int.Parse(str_ID);
                    MCompany.Name = str_companyName;
                    MCompany.CreateTime = DateTime.Now;
                    int int_companyid = BCompany.Add(MCompany);
                    if (int_companyid > 0)//添加成功
                    {
                        //添加试卷授权
                        for (int j = 0; j < arr_paperID.Length; j++)
                        {
                            Maticsoft.Model.PaperManage MPaperManage = new Maticsoft.Model.PaperManage();
                            MPaperManage.PaperID = int.Parse(arr_paperID[j].ToString());
                            MPaperManage.CompanyID = int_companyid;
                            MPaperManage.IsLongTime = true;
                            MPaperManage.CreateDateTime = DateTime.Now;
                            MPaperManage.Title = str_companyName + "授权";
                            MPaperManage.Num = 100;
                            if (BPaperManage.Add(MPaperManage) <= 0)
                            {
                                return false;
                            }
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch(Exception)
            {
                throw;
                //return false;
            }

            return true;
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