using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Common
{
    public class OLPage : Page
    {
        public OLPage()
        { }
        protected override void Render(HtmlTextWriter writer)
        {
            if (writer is System.Web.UI.Html32TextWriter)
            {
                writer = new FormFixerHtml32TextWriter(writer.InnerWriter);
            }
            else
            {
                writer = new FormFixerHtmlTextWriter(writer.InnerWriter);
            }
            base.Render(writer);
        }
    }

    internal class FormFixerHtml32TextWriter : System.Web.UI.Html32TextWriter
    {
        private string _url; // 假的URL

        internal FormFixerHtml32TextWriter(TextWriter writer)
            : base(writer)
        {
            _url = HttpContext.Current.Request.RawUrl;
        }

        public override void WriteAttribute(string name, string value, bool encode)
        {
            if (_url != null && string.Compare(name, "action", true) == 0)
            {
                value = _url;
            }
            base.WriteAttribute(name, value, encode);

        }
    }

    internal class FormFixerHtmlTextWriter : System.Web.UI.HtmlTextWriter
    {
        private string _url;
        internal FormFixerHtmlTextWriter(TextWriter writer)
            : base(writer)
        {
            _url = HttpContext.Current.Request.RawUrl;
        }

        public override void WriteAttribute(string name, string value, bool encode)
        {
            if (_url != null && string.Compare(name, "action", true) == 0)
            {
                value = _url;
            }
            base.WriteAttribute(name, value, encode);
        }
    }
}
