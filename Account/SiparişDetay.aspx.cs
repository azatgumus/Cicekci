using Cicekci.Classes;
using Cicekci.DataAccess;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Cicekci.Account
{
    public partial class SiparişDetay : System.Web.UI.Page
    {
        UnitOfWork uow = new UnitOfWork();
        decimal toplam = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            String siparisId = Request.QueryString["SiparişId"];
            FormView1.DataSource = new List<Siparis> { uow.SiparisRepository.GetById(siparisId) };
            FormView1.DataBind();

            GridView_SiparişDetay.DataSource = uow.UrunSepetRepository.Get(x => x.SepetId == siparisId).
                Select(x => new SepetUrun
                {
                    BirimFiyat = x.Urun.BirimFiyat,
                    Miktar = x.Miktar,
                    Ad = x.Urun.Ad,
                    Id = x.UrunId
                })
                    .ToList();
            GridView_SiparişDetay.DataBind();
        }
        protected void Listem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string siparisId = Request.QueryString["SiparişId"];
                var ds = uow.UrunSepetRepository.Get(x => x.SepetId == siparisId).
                  Select(x => new SepetUrun
                  {
                      BirimFiyat = x.Urun.BirimFiyat,
                      Miktar = x.Miktar,
                      Ad = x.Urun.Ad,
                      Id = x.UrunId
                  }).ToList();
                GridView_SiparişDetay.DataSource = ds;
                toplam = ds.Sum(x => x.BirimFiyat * x.Miktar);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[4].Text = "Toplam Tutar: " + toplam.ToString("C");
            }
        }
    }
}