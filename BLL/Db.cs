using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 数据库
    /// </summary>
    public class Db
    {
        DAL.Db dal = new DAL.Db();
        /// <summary>
        /// 添加
        /// </summary>
        public void Add(Model.Db md)
        {
            Model.Db model = new Model.Db();
            model.Server = Common.Function.ToASCII(md.Server);
            model.Database = Common.Function.ToASCII(md.Database);
            model.Password = Common.Function.ToASCII(md.Password);
            model.Instance = Common.Function.ToASCII(md.Instance);
            model.Port = Common.Function.ToASCII(md.Port);
            model.User = Common.Function.ToASCII(md.User);
            model.Key = Common.Function.ToASCII(md.Key);
            if (dal.Add(model) > 0)
            {
                if (md.Key == "UserSys")
                {
                    Common.Function.Redirect("Setup3.aspx");
                }
                else
                {
                    Common.Function.Redirect("Setup4.aspx");
                }
            }
            else
            {
                Common.Function.AlertRedirect("添加失败！系统繁忙请稍后再试！", "/Aspx/Failure.htm");
            }
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        public void Updata(Model.Db md)
        {
            Model.Db model = new Model.Db();
            model.Server = Common.Function.ToASCII(md.Server);
            model.Database = Common.Function.ToASCII(md.Database);
            model.Password = Common.Function.ToASCII(md.Password);
            model.Instance = Common.Function.ToASCII(md.Instance);
            model.Port = Common.Function.ToASCII(md.Port);
            model.User = Common.Function.ToASCII(md.User);
            model.Key = Common.Function.ToASCII(md.Key);
            if (dal.Updata(model) > 0)
            {
                Common.Function.AlertRedirect("成功！", "/Aspx/Success.htm");
            }
            else
            {
                Common.Function.AlertRedirect("失败！", "/Aspx/Failure.htm");
            }
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <returns></returns>
        public List<Model.Db> GetList()
        {
            List<Model.Db> list = new List<Model.Db>();
            list = dal.GetList();
            for (int i = 0; i < list.Count; i++)
            {
                list[i].Server = Common.Function.ToString(list[i].Server);
                list[i].Database = Common.Function.ToString(list[i].Database);
                list[i].Password = Common.Function.ToString(list[i].Password);
                list[i].Instance = Common.Function.ToString(list[i].Instance);
                list[i].Port = Common.Function.ToString(list[i].Port);
                list[i].User = Common.Function.ToString(list[i].User);
                list[i].Key = Common.Function.ToString(list[i].Key);
            }
            return list;
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Key">标识</param>
        /// <returns></returns>
        public List<Model.Db> GetList(string Key)
        {
            Key = Common.Function.ToASCII(Key);
            List<Model.Db> list = new List<Model.Db>();
            list = dal.GetList(Key);
            for (int i = 0; i < list.Count; i++)
            {
                list[i].Server = Common.Function.ToString(list[i].Server);
                list[i].Database = Common.Function.ToString(list[i].Database);
                list[i].Password = Common.Function.ToString(list[i].Password);
                list[i].Instance = Common.Function.ToString(list[i].Instance);
                list[i].Port = Common.Function.ToString(list[i].Port);
                list[i].User = Common.Function.ToString(list[i].User);
                list[i].Key = Common.Function.ToString(list[i].Key);
            }
            return list;
        }
    }
}
