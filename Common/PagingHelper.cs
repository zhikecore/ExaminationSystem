using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common
{
    public static class PagingHelper
    {//add by wangke
        /// <summary>
        /// 获取分页SQL语句，默认row_number为关健字，所有表不允许使用该字段名
        /// </summary>
        /// <param name="_recordCount">记录总数</param>
        /// <param name="_pageSize">每页记录数</param>
        /// <param name="_pageIndex">当前页数</param>
        /// <param name="_safeSql">SQL查询语句</param>
        /// <param name="_orderField">排序字段，多个则用“,”隔开</param>
        /// <returns>分页SQL语句</returns>
        public static string CreatePagingSql(int _recordCount, int _pageSize, int _pageIndex, string _safeSql, string _orderField)
        {
            //计算总页数
            _pageSize = _pageSize == 0 ? _recordCount : _pageSize;
            int pageCount = (_recordCount + _pageSize - 1) / _pageSize;

            //检查当前页数
            if (_pageIndex < 1)
            {
                _pageIndex = 1;
            }
            else if (_pageIndex > pageCount)
            {
                _pageIndex = pageCount;
            }
            //拼接SQL字符串，加上ROW_NUMBER函数进行分页
            StringBuilder newSafeSql = new StringBuilder();
            newSafeSql.AppendFormat("SELECT ROW_NUMBER() OVER(ORDER BY {0}) as row_number,", _orderField);
            newSafeSql.Append(_safeSql.Substring(_safeSql.ToUpper().IndexOf("SELECT") + 6));

            //拼接成最终的SQL语句
            StringBuilder sbSql = new StringBuilder();
            sbSql.Append("SELECT * FROM (");
            sbSql.Append(newSafeSql.ToString());
            sbSql.Append(") AS T");
            sbSql.AppendFormat(" WHERE row_number between {0} and {1}", ((_pageIndex - 1) * _pageSize) + 1, _pageIndex * _pageSize);

            return sbSql.ToString();
        }

        /// <summary>
        /// 获取记录总数SQL语句
        /// </summary>
        /// <param name="_safeSql">SQL查询语句</param>
        /// <returns>记录总数SQL语句</returns>
        public static string CreateCountingSql(string _safeSql)
        {
            return string.Format(" SELECT COUNT(1) AS RecordCount FROM ({0}) AS T ", _safeSql);
        }


        #region 显示分页
        /// <summary>
        /// 返回分页页码
        /// </summary>
        /// <param name="pageSize">页面大小</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="totalCount">总记录数</param>
        /// <param name="linkUrl">链接地址，__id__代表页码</param>
        /// <param name="centSize">中间页码数量</param>
        /// <returns></returns>
        public static string OutPageList(int pageSize = 2, int pageIndex = 1, int totalCount = 77, string linkUrl = "/CustomerManage/CustomerList.aspx", int centSize = 5)
        {
            //计算页数
            if (totalCount < 1 || pageSize < 1)
            {
                return "";
            }
            int pageCount = totalCount / pageSize;
            if (pageCount < 1)
            {
                return "";
            }
            if (totalCount % pageSize > 0)
            {
                pageCount += 1;
            }
            if (pageCount <= 1)
            {
                return "";
            }
            StringBuilder pageStr = new StringBuilder();
            string pageId = "__id__";
            string firstBtn = "<li><a href=\""+ linkUrl + "?pageID="+(pageIndex - 1) + "\">&laquo;</a></li>";//上一页
            string lastBtn = "<li><a href=\""+ linkUrl + "?pageID=" + (pageIndex + 1) + "\">&raquo;</a></li>";//下一页
            string firstStr = "<li><a href=\""+ linkUrl + "?pageID=1\">1</a></li>";
            string lastStr = "<li><a href=\""+ linkUrl + "?pageID=" + pageCount + "\"</a></li>";

            if (pageIndex <= 1)
            {
                firstBtn = "<li class=\"disabled\"><span class=\"disabled\">&laquo;</span></li>";
            }
            if (pageIndex >= pageCount)
            {
                lastBtn = "<li class=\"disabled\"><span class=\"disabled\">&raquo;</span></li>";
            }
            if (pageIndex == 1)
            {
                firstStr = "<li class=\"active\"><span class=\"current\">1</span></li>";
            }
            if (pageIndex == pageCount)
            {
                lastStr = "<li class=\"active\"><span class=\"current\">" + pageCount.ToString() + "</span></li>";
            }
            int firstNum = pageIndex - (centSize / 2); //中间开始的页码
            if (pageIndex < centSize)
                firstNum = 2;
            int lastNum = pageIndex + centSize - ((centSize / 2) + 1); //中间结束的页码
            if (lastNum >= pageCount)
                lastNum = pageCount - 1;
            pageStr.Append("<nav>");
            pageStr.Append("<ul class=\"pagination\">");
            pageStr.Append("<li class=\"disabled\"><span>共" + totalCount + "记录</span></li>");
            pageStr.Append(firstBtn + firstStr);
            if (pageIndex >= centSize)
            {
                pageStr.Append("<li class=\"disabled\"><span>...</span></li>\n");
            }
            //for (int i = firstNum; i <= lastNum; i++)
            //{
            //    if (i == pageIndex)
            //    {
            //        pageStr.Append("<li class=\"active\"><span class=\"current\">" + i + "</span></li>");
            //    }
            //    else
            //    {
            //        pageStr.Append("<li><a href=\""+ linkUrl + "?pageID=" + i + "\">" + i + "</a></li>");
            //    }
            //}

            for (int i = 2; i <= pageCount; i++)
            {
                if (i > centSize)//大于中间页数跳出循环
                {
                    break;
                }
                if (i == pageIndex)
                {
                    pageStr.Append("<li class=\"active\"><span class=\"current\">" + i + "</span></li>");
                }
                else
                {
                    pageStr.Append("<li><a href=\"" + linkUrl + "?pageID=" + i + "\">" + i + "</a></li>");
                }
            }

            if (pageCount - pageIndex > centSize - ((centSize / 2)))
            {
                pageStr.Append("<li><span>...</span></li>");
            }
            //pageStr.Append(lastStr + lastBtn);
            pageStr.Append(lastBtn);
            pageStr.Append("</ul>");
            pageStr.Append("</nav>");
            return pageStr.ToString();
        }
        #endregion
    }
}
