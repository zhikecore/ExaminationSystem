using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// add by wangke 2016-11-23 出题类别
    /// </summary>
    public class Status
    {
        public Status()
        { }

        #region Model
        private string _ys_code;
        private string _ys_desc;
        private string _ys_type;
        private string _ys_remark;
        private int? _ys_seq;
        private int _ys_id;
        /// <summary>
        /// 
        /// </summary>
        public string YS_CODE
        {
            set { _ys_code = value; }
            get { return _ys_code; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string YS_DESC
        {
            set { _ys_desc = value; }
            get { return _ys_desc; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string YS_TYPE
        {
            set { _ys_type = value; }
            get { return _ys_type; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string YS_REMARK
        {
            set { _ys_remark = value; }
            get { return _ys_remark; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? YS_SEQ
        {
            set { _ys_seq = value; }
            get { return _ys_seq; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int YS_ID
        {
            set { _ys_id = value; }
            get { return _ys_id; }
        }
        #endregion Model
    }
}
