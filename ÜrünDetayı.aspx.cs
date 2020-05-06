using Cicekci.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci
{
    public partial class ÜrünDetay : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            UnitOfWork uow = new UnitOfWork();
            var urun = uow.UrunRepository.GetById(int.Parse(Request.QueryString["ÜrünId"]));

            FormView1.DataSource = new List<Urun> { urun };
            FormView1.DataBind();
            ListView_Yorumlar.DataSource = urun.Yorum.ToList();
            ListView_Yorumlar.DataBind();
        }

        
    }
}