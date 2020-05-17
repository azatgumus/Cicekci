using Cicekci.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci.Admin
{
    public partial class Satis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                FilterClick(sender, e);
            }

        }

        public class Order
        {
            public decimal BirimFiyat { get; set; }
            public string Ad { get; set; }
            public bool? Kampanyali { get; set; }
            public int Miktar { get; set; }
            public DateTime SiparisTarihi { get; set; }
            public decimal Tutar { get; set; }
        }




        protected void FilterClick(object sender, EventArgs e)
        {
            UnitOfWork uow = new UnitOfWork();
            IQueryable<Siparis> siparis = uow.SiparisRepository.GetAll().AsQueryable();
            IQueryable<Urun> urun = uow.UrunRepository.GetAll().AsQueryable();
            IQueryable<UrunSepet> sepetItems = uow.UrunSepetRepository.GetAll().AsQueryable();
            IQueryable<Order> ds = from u in urun
                                   join us in sepetItems on u.Id equals us.UrunId
                                   join s in siparis on us.SepetId equals s.Id
                                   select new Order
                                   {
                                       Ad = u.Ad.ToLower(),
                                       BirimFiyat = u.BirimFiyat,
                                       Kampanyali = u.Kampanyali,
                                       Miktar = us.Miktar,
                                       SiparisTarihi = s.SiparisTarihi,
                                       Tutar = u.BirimFiyat * us.Miktar
                                   };

            if (!string.IsNullOrEmpty(txtUrunAdi.Text))
            {
                ds = ds.Where(x => x.Ad.Contains(txtUrunAdi.Text.ToLower()));
                //select* from Siparis
                //where Id in(
                //select us.SepetId from Urun u
                //join UrunSepet us on us.UrunId = u.Id
                //where u.Ad like '%gül%' group by us.SepetId
                //)


                //var urun = uow.UrunRepository
                //     .Get(x => x.Ad.Contains(txtUrunAdi.Text)).SelectMany(k => k.UrunSepet).GroupBy(k => k.SepetId).Select(k => k.Key);
                //ds = ds.Where(x => urun.Contains(x.Id));

                //select u.BirimFiyat,u.Ad,u.Kampanyali,us.Miktar,s.SiparisTarihi from Urun u
                //join UrunSepet us on us.UrunId = u.Id 
                //join Siparis s on s.Id = us.SepetId
                //where u.Ad like '%gül%'




            }
            if (!string.IsNullOrEmpty(txtFiyat1.Text) && string.IsNullOrEmpty(txtFiyat2.Text))
            {
                decimal minTutar = decimal.Parse(txtFiyat1.Text);
                ds = ds.Where(x => x.Tutar >= minTutar);
            }
            if (!string.IsNullOrEmpty(txtFiyat2.Text) && string.IsNullOrEmpty(txtFiyat1.Text))
            {
                decimal maxTutar = decimal.Parse(txtFiyat2.Text);
                ds = ds.Where(x => x.Tutar <= maxTutar);
            }
            if (!string.IsNullOrEmpty(txtFiyat1.Text) && !string.IsNullOrEmpty(txtFiyat2.Text))
            {
                decimal minTutar = decimal.Parse(txtFiyat1.Text);
                decimal maxTutar = decimal.Parse(txtFiyat2.Text);
                ds = ds.Where(x => x.Tutar >= minTutar && x.Tutar <= maxTutar);
            }
            if (!string.IsNullOrEmpty(datepicker1.Value) && string.IsNullOrEmpty(datepicker2.Value))
            {
                var dt1 = DateTime.Parse(datepicker1.Value);
                ds = ds.Where(x => x.SiparisTarihi >= dt1);
            }
            if (!string.IsNullOrEmpty(datepicker2.Value) && string.IsNullOrEmpty(datepicker1.Value))
            {
                var dt2 = DateTime.Parse(datepicker2.Value);
                ds = ds.Where(x => x.SiparisTarihi <= dt2);
            }
            if (!string.IsNullOrEmpty(datepicker2.Value) && !string.IsNullOrEmpty(datepicker1.Value))
            {
                var dt1 = DateTime.Parse(datepicker1.Value);
                var dt2 = DateTime.Parse(datepicker2.Value);
                ds = ds.Where(x => x.SiparisTarihi >= dt1 && x.SiparisTarihi <= dt2);
            }
            if (!string.IsNullOrEmpty(txtMiktar.Text))
            {
                int miktar = int.Parse(txtMiktar.Text);
                ds = ds.Where(x => x.Miktar >= miktar);
            }


            grdSatis.DataSource = ds;
            grdSatis.DataBind();
        }
    }
}