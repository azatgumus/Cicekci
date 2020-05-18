using Cicekci.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci.Account
{
    public partial class SiparişListesi : System.Web.UI.Page
    {
        UnitOfWork uow = new UnitOfWork();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            HttpCookie cookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (cookie != null)
            {
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(cookie.Value);
                int? userId = -1;
                if (ticket != null)
                {
                    userId = int.Parse(ticket.UserData);
                }
                GridView_SiparişListesi.DataSource = uow.SiparisRepository.Get(x => x.UyeId == userId).OrderByDescending(x => x.SiparisTarihi).ToList();
                GridView_SiparişListesi.DataBind();
            }
            else
            {
                tblAnonim.Visible = true;
            }

        }
        protected void SiparisGetir(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSiparisNo.Text?.Trim()))
            {
                lblMessage.Text = "Sorgulama yapmak için lütfen sipariş takip no giriniz.";
                return;
            }
            var siparis = uow.SiparisRepository.Get(x => x.Id.Substring(0, 8) == txtSiparisNo.Text).FirstOrDefault();
            if (siparis == null)
            {
                lblMessage.Text = "Aradığınız sipariş bulunamadı.";
                return;
            }

            var ds = new List<Siparis> { siparis };
            GridView_SiparişListesi.DataSource = ds;
            GridView_SiparişListesi.DataBind();

        }
    }
}