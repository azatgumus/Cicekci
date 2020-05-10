using Cicekci.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci.Account
{
    public partial class SiparişListesi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            UnitOfWork uow = new UnitOfWork();
            GridView_SiparişListesi.DataSource = uow.SiparisRepository.Get(x=>x.FaturaAdSoyad==HttpContext.Current.User.Identity.Name).OrderByDescending(x=>x.SiparisTarihi).ToList();
            GridView_SiparişListesi.DataBind();
        }
    }
}