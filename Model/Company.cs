
using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// Company:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Company
	{
		public Company()
		{}
		#region Model
		private int _id;
		private string _name;
		private string _website;
		private string _address;
		private string _tel;
		private string _industry;
		private string _enterprisetype;
		private string _principal;
		private DateTime? _createtime;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Website
		{
			set{ _website=value;}
			get{return _website;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Address
		{
			set{ _address=value;}
			get{return _address;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Tel
		{
			set{ _tel=value;}
			get{return _tel;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Industry
		{
			set{ _industry=value;}
			get{return _industry;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string EnterpriseType
		{
			set{ _enterprisetype=value;}
			get{return _enterprisetype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Principal
		{
			set{ _principal=value;}
			get{return _principal;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}

        public int obj_ID { get; set; }
        #endregion Model

    }
}

