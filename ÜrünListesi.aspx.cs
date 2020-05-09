using Cicekci.DataAccess;
using System;
using System.Linq;
using System.Web.UI;

namespace Cicekci
{
    public partial class ÜrünListesi : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            UnitOfWork uow = new UnitOfWork();
            var x = uow.UrunRepository.GetAll();
            if (Request.QueryString["KategoriId"] != null)
            {
                var kategoriId = int.Parse(Request.QueryString["KategoriId"]);
                x = x.Where(r => r.KategoriId == kategoriId);
            }
            ListView1.DataSource = x.ToList();
            ListView1.DataBind();
        }

        //protected void SepeteEkle(object sender, EventArgs e)
        //{
        //    var argument = ((Button)sender).CommandArgument;
        //    Response.Redirect("SepeteEkle.aspx?ÜrünId=");
        //}
    }
}