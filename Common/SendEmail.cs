using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common
{
    /// <summary>
    /// 发送邮件
    /// </summary>
    public class SendEmail
    {
        /// <summary>
        /// 发送
        /// </summary>
        /// <param name="To">收件人</param>
        /// <param name="HTMLBody">邮件正文</param>
        public static void Send(string To, string HTMLBody)
        {
            //需要两个DLL
            //Interop.ADODB.dll
            //Interop.CDO.dll
            string From = "tony@situational.com.cn";
            string Subject = "欢迎进入终生领导艺术学院学习";
            string UsersName = "tony@situational.com.cn";
            string Password = "love.20060708";
            string SMTP = "mail.situational.com.cn";
            try
            {
                CDO.Message Msg = new CDO.Message();
                Msg.From = From;
                Msg.To = To;
                Msg.Subject = Subject;
                Msg.HTMLBody = HTMLBody;

                //附件
                //Msg.AddAttachment(@"C:\Users\Administrator\Desktop\20081022(008).rar", "", "");

                //Msg.HTMLBody = HttpContent("http://www.situational.com.cn/LearningInformation/Details61.shtml");
                CDO.IConfiguration Config = Msg.Configuration;
                ADODB.Fields oFields = Config.Fields;
                oFields["http://schemas.microsoft.com/cdo/configuration/sendusing"].Value = 2;
                oFields["http://schemas.microsoft.com/cdo/configuration/sendusername"].Value = UsersName;
                oFields["http://schemas.microsoft.com/cdo/configuration/sendpassword"].Value = Password;
                oFields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"].Value = 1;
                oFields["http://schemas.microsoft.com/cdo/configuration/languagecode"].Value = 0x0804;
                oFields["http://schemas.microsoft.com/cdo/configuration/smtpserver"].Value = SMTP;
                oFields.Update();

                Msg.BodyPart.Charset = "gb2312";
                Msg.HTMLBodyPart.Charset = "gb2312";

                Msg.Send();
                Msg = null;
            }
            catch
            { }
        }
    }
}
