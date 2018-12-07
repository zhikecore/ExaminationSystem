using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Web;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Data;
using System.Web.Script.Serialization;
using System.Collections;

namespace Common
{
    /// <summary>
    /// 通用功能
    /// </summary>
    public class Function
    {
        /// <summary>
        /// 打开窗口
        /// </summary>
        /// <param name="url"></param>
        public static void OpenWebForm(string url)
        {
            string js = @"<Script language='JavaScript'>
			//window.open('" + url + @"');
			window.open('" + url + @"','','height=0,width=0,top=0,left=0,location=no,menubar=no,resizable=yes,scrollbars=yes,status=yes,titlebar=no,toolbar=no,directories=no');
			</Script>";
            HttpContext.Current.Response.Write(js);
        }
        /// <summary>
        /// 提示窗口+转到指定地址
        /// </summary>
        /// <param name="message">提示信息</param>
        /// <param name="path">要转到的地址</param>
        public static void AlertRedirect(string message, string path)
        {
            String js = @"<Script language='JavaScript'>alert('" + message + "');window.location.href='" + path + "';</Script>";
            System.Web.HttpContext.Current.Response.Write(js);
        }
        /// <summary>
        /// 提示窗口+转到指定地址+打开方式
        /// </summary>
        /// <param name="message">提示信息</param>
        /// <param name="path">要转到的地址</param>
        /// <param name="target">打开方式</param>
        public static void AlertRedirect(string message, string path, string target)
        {
            String js = @"<Script language='JavaScript'>alert('" + message + "');window.open('" + path + "','" + target + "');</Script>";
            //js = @"<Script language='JavaScript'>alert('" + message + "');window.open('" + path + "','" + target + "');</Script>";
            
            System.Web.HttpContext.Current.Response.Write(js);
        }
        /// <summary>
        /// 转到指定地址
        /// </summary>
        /// <param name="path">要转到的地址</param>
        public static void Redirect(string path)
        {
            String js = @"<Script language='JavaScript'>window.location.href='" + path + "';</Script>";
            System.Web.HttpContext.Current.Response.Write(js);
        }
        /// <summary>
        /// 转到指定地址+打开方式
        /// </summary>
        /// <param name="path">要转到的地址</param>
        /// <param name="target">打开方式</param>
        public static void Redirect(string path, string target)
        {
            String js = @"<Script language='JavaScript'>window.open('" + path + "','" + target + "');</Script>";
            System.Web.HttpContext.Current.Response.Write(js);
        }
        /// <summary>
        /// 提示窗口
        /// </summary>
        /// <param name="message">提示信息</param>
        public static void Alert(string message)
        {
            String js = @"<Script language='JavaScript'>
                        alert('" + message + "');</Script>";
            System.Web.HttpContext.Current.Response.Write(js);
        }
        /// <summary>
        /// 对字符串简单编码
        /// </summary>
        /// <param name="str">原字符串</param>
        /// <returns>简单编码后的字符串</returns>
        public static string StringEncode(string str)
        {
            string myStr = System.Web.HttpContext.Current.Server.HtmlEncode(str).Replace("\r\n", "<br/>");
            str = myStr.Replace(" ", "&nbsp;&nbsp;");
            return str = myStr.Replace("'", " ");
        }
        /// <summary>
        /// 还原StringEncode编码后的字符串
        /// </summary>
        /// <param name="str">StringEncode编码后的字符串</param>
        /// <returns>还原后的字符串</returns>
        public static string StringDecode(string str)
        {
            if (str == "")
            {
                return "";
            }
            else
            {
                string myStr = str.Replace("&nbsp;&nbsp;", " ");
                return str = myStr.Replace("<br/>", "\r\n");
            }
        }
        /// <summary>
        /// 限制字符长度
        /// </summary>
        /// <param name="strMsg">要限制的字符串</param>
        /// <param name="length">限制长度</param>
        /// <returns>限制后的字符+"..."</returns>
        public static string MaxLength(string strMsg, int length)
        {
            if (strMsg.Length > length)
            {
                return Common.Function.StringDecode(strMsg).Substring(0, length);
            }
            else
            {
                return Common.Function.StringDecode(strMsg);
            }
        }
        /// <summary>
        /// Md5加密（32位）
        /// </summary>
        /// <param name="Str">要加密的字符</param>
        /// <returns>加密后的字符</returns>
        public static string md5(string Str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Str, "MD5");
        }
        /// <summary>
        /// 加密(自创)
        /// </summary>
        /// <param name="Str">原字符串</param>
        /// <returns>加密后的字符串</returns>
        public static string Mymd5(string Str)
        {
            Str = Str + "Exam";
            Str = Common.Function.md5(Str);
            return Str;
        }
        /// <summary>
        /// ASCII转成String
        /// </summary>
        /// <param name="Str">要转换的字符串</param>
        /// <returns>转换好的字符串</returns>
        public static string ToString(string Str)
        {
            Str = Common.Function.MaxLength(Str, Str.Length - 1);
            string[] strs = Str.Split(',');
            char ch; 
            short ii;
            string str1="";
            for (int i = 0; i < strs.Length; i++)
            {
                ii = (short)int.Parse(strs[i]);
                ch = (char)ii;
                str1 = str1 + ch.ToString();
            }
            return str1;
        }
        /// <summary>
        /// String转成ASCII
        /// </summary>
        /// <param name="Str">要转换的字符串</param>
        /// <returns>转换好的字符串</returns>
        public static string ToASCII(string Str)
        {
            char ch;
            string str = "";
            for (int i = 0; i < Str.Length; i++)
            {
                ch= Str[i];
                str = str + (short)ch + ",";
            }
            return str;
        }
        /// <summary>
        /// 字符串转成数组(int[])
        /// </summary>
        /// <param name="Str">字符串</param>
        /// <returns></returns>
        public static int[] ToInt(string Str)
        {
            string[] strs = Str.Split(',');
            int[] a = new int[strs.Length];
            for (int i = 0; i < strs.Length; i++)
            {
                a[i] = Convert.ToInt32(strs[i]);
            }
            return a;
        }
        /// <summary>
        /// 获取从N位后的所有字符串
        /// </summary>
        /// <param name="Str">字符串</param>
        /// <param name="N">N位</param>
        /// <returns></returns>
        public static string RightLength(string Str, int N)
        {
            if (N == 0)
            {
                if (Str.Substring(0, 2) != "s_")
                {
                    return Str;
                }
                else
                {
                    return "s" + Str;
                }
            }
            else
            {
                if (Str.Substring(0, 2) != "s_")
                {
                    return Str;
                }
                else
                {
                    return Str.Substring(N, Str.Length - N);
                }
            }
        }
        /// <summary>
        /// 获取字符串最后N个字符
        /// </summary>
        /// <param name="Str">字符串</param>
        /// <param name="N">字符数</param>
        /// <returns></returns>
        public static string LastN(string Str, int N)
        {
            if (N == 0)
            {
                return Str;
            }
            else
            {
                if (Str.Length <= N)
                {
                    return Str;
                }
                else
                {
                    int i = Str.Length - N;
                    return Str.Substring(i);
                }
            }
        }
        /// <summary>
        /// SEO关键字
        /// </summary>
        /// <returns></returns>
        public static string KeyWrods()
        {
            return " - 领导力培训 领导力模型 高级领导力 初级领导力 终生领导艺术管理学院";
        }
        /// <summary>
        /// 设置标题
        /// </summary>
        /// <param name="Str">string</param>
        /// <returns></returns>
        public static string SetTitle(string Str)
        {
            return "考试系统-在线商学院-终生领导艺术管理学院-" + Str;
        }
        /// <summary>
        /// 是否为汉字
        /// </summary>
        /// <param name="itemValue"></param>
        /// <returns></returns>
        public static bool isCHC(string itemValue)
        {
            return (IsRegEx("^[\u4e00-\u9fa5]{0,}$", itemValue));
        }
        /// <summary>
        /// 是否为汉字
        /// </summary>
        /// <param name="regExValue"></param>
        /// <param name="itemValue"></param>
        /// <returns></returns>
        private static bool IsRegEx(string regExValue, string itemValue)
        {

            try
            {
                Regex regex = new System.Text.RegularExpressions.Regex(regExValue);
                if (regex.IsMatch(itemValue)) return true;
                else return false;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
            }
        }
        /// <summary>
        /// 判断一个字符串是否为合法数字(0-32整数)
        /// </summary>
        /// <param name="s">字符串</param>
        /// <returns></returns>
        public static bool IsNumber(string s)
        {
            return IsNumber(s,32,0);
        }
        /// <summary>
        /// 判断一个字符串是否为合法数字(指定整数位数和小数位数)
        /// </summary>
        /// <param name="s">字符串</param>
        /// <param name="precision">整数位数</param>
        /// <param name="scale">小数位数</param>
        /// <returns></returns>
        public static bool IsNumber(string s, int precision, int scale)
        {
            if ((precision == 0) && (scale == 0))
            {
                return false;
            }
            string pattern = @"(^\d{1," + precision + "}";
            if (scale > 0)
            {
                pattern += @"\.\d{0," + scale + "}$)|" + pattern;
            }
            pattern += "$)";
            return Regex.IsMatch(s, pattern);
        }
        /// <summary>
        /// 设置DropDownList
        /// </summary>
        /// <param name="ddl">DropDownList名称</param>
        /// <param name="Value">值</param>
        public static void setDropDownList(DropDownList ddl, string Value)
        {
            ddl.Items.FindByValue(Value).Selected = true;
        }
        /// <summary>
        /// 生成授权码
        /// </summary>
        /// <param name="Str">字符串</param>
        /// <returns></returns>
        public static string SN(string Str)
        {
            //作者:温东岳
            //电子邮箱:wendongyue@126.com
            //加密方式:将加密码后的32位MD5密文分成8组,然后依1,3,5,7,2,4,6,8排列方式重组32位密文后

            //先用MD5加密
            Str = Common.Function.md5(Str);
            //分成8组
            string S1 = Str.Substring(0, 4);
            string S2 = Str.Substring(4, 4);
            string S3 = Str.Substring(8, 4);
            string S4 = Str.Substring(12, 4);
            string S5 = Str.Substring(16, 4);
            string S6 = Str.Substring(20, 4);
            string S7 = Str.Substring(24, 4);
            string S8 = Str.Substring(28, 4);
            //重新排列
            Str = S1 + "-" + S2 + "-" + S3 + "-" + S4 + "-" + S5 + "-" + S6 + "-" + S7 + "-" + S8;
            return Str;
        }
        /// <summary>
        /// T/F转换
        /// </summary>
        /// <param name="Str">T/F</param>
        /// <returns></returns>
        public static string T_F_TitleList(string Str)
        {
            if (Str == "T")
            {
                return "正确";
            }
            else
            {
                if (Str == "F")
                {
                    return "错误";
                }
                else
                {
                    return "";
                }
            }
        }
        /// <summary>
        /// T/F转换
        /// </summary>
        /// <param name="Str">T/F</param>
        /// <returns></returns>
        public static string T_F_OptionsList(string Str)
        {
            if (Str == "T")
            {
                return "答案";
            }
            else
            {
                if (Str == "F")
                {
                    return "";
                }
                else
                {
                    if (Str == "")
                    {
                        return "";
                    }
                    else
                    {
                        return Str;
                    }
                }
            }
        }
        /// <summary>
        /// 格式化字符串
        /// </summary>
        /// <param name="str">8,8,10,3,3,6,3,6,4</param>
        /// <returns>8，10，3，6，4</returns>
        public static string Format_str(string str)
        {
            string chongFu = str;
            string jieGuo = "";
            string[] temp_Split = chongFu.Split(',');
            for (int i = 0; i < temp_Split.Length; i++)
            {
                for (int j = i + 1; j < temp_Split.Length; j++)
                {
                    if (temp_Split[i] == temp_Split[j])
                    {
                        temp_Split[j] = "";
                    }
                }
            }
            for (int j = 0; j < temp_Split.Length; j++)
            {
                if (temp_Split[j] != "")
                {
                    jieGuo = jieGuo == "" ? temp_Split[j] : jieGuo + "," + temp_Split[j];
                }
            }

            return jieGuo;
        }
        

        /// <summary>
        /// DataTable 对象 转换为Json 字符串
        /// add by wangke 2016-11-23 使用ajax用于将datatable转换成json
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static string ToJson(DataTable dt)
        {
            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            javaScriptSerializer.MaxJsonLength = Int32.MaxValue; //取得最大数值
            ArrayList arrayList = new ArrayList();
            foreach (DataRow dataRow in dt.Rows)
            {
                Dictionary<string, object> dictionary = new Dictionary<string, object>();  //实例化一个参数集合
                foreach (DataColumn dataColumn in dt.Columns)
                {
                    dictionary.Add(dataColumn.ColumnName, dataRow[dataColumn.ColumnName].ToString());
                }
                arrayList.Add(dictionary); //ArrayList集合中添加键值
            }

            return javaScriptSerializer.Serialize(arrayList);  //返回一个json字符串
        }

        /// <summary>
        /// 删除最后结尾的一个逗号
        /// add by wangke 2016-12-8 
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
        /// js提示
        /// add by wangke 2016-12-13
        /// </summary>
        public static void jsHint(System.Web.UI.Page page,string str_script)
        {
            string str_Script = @"alert('" + str_script + "');";
            page.ClientScript.RegisterStartupScript(page.GetType(), "Script", str_Script, true);
        }

    }
}
