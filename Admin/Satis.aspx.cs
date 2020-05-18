using Cicekci.DataAccess;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static iTextSharp.text.Font;
using Image = iTextSharp.text.Image;

namespace Cicekci.Admin
{
    public partial class Satis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            grdSatis.DataSource = new List<Order>();
            grdSatis.DataBind();
            //if (!this.IsPostBack)
            //{
            //    FilterClick(sender, e);
            //}

        }

        public class Order
        {
            public decimal BirimFiyat { get; set; }
            public string Ad { get; set; }
            public bool? Kampanyali { get; set; }
            public int Miktar { get; set; }
            public DateTime SiparisTarihi { get; set; }
            public decimal Tutar { get; set; }
            public string AdSoyad { get; set; }
            public string Email { get; set; }
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
                                       Tutar = u.BirimFiyat * us.Miktar,
                                       AdSoyad = s.FaturaAdSoyad,
                                       Email = s.Email
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
            if (!string.IsNullOrEmpty(txtAdSoyad.Text))
            {
                ds = ds.Where(x => x.AdSoyad.Contains(txtAdSoyad.Text));
            }
            if (!string.IsNullOrEmpty(txtEmail.Text))
            {
                ds = ds.Where(x => x.Email.Contains(txtEmail.Text));
            }


            grdSatis.DataSource = ds;
            grdSatis.DataBind();
        }


        protected void ExportGridToPDF(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Satis.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdSatis.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 2f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            iTextSharp.text.Image addLogo = default(iTextSharp.text.Image);
            addLogo = iTextSharp.text.Image.GetInstance(Server.MapPath("~/Styles/Resimler/fav.jpg"));
            addLogo.ScaleToFit(60, 50);
            //addLogo.Alignment = iTextSharp.text.Image.ALIGN_TOP;
            pdfDoc.Add(addLogo);


            BaseFont myFont = BaseFont.CreateFont(@"C:\windows\fonts\arial.ttf", "windows-1254", BaseFont.EMBEDDED);
            Font fontNormal = new Font(myFont, 15, Font.NORMAL, BaseColor.RED);

            pdfDoc.Add(new Paragraph("Cicekcim.com                                         " + "Satış Raporları", fontNormal));
            pdfDoc.Add(new Paragraph("Vergi Dairesi : Çankaya"));
            pdfDoc.Add(new Paragraph("Vergi No : 3420204514"));
            pdfDoc.Add(new Paragraph("\n"));


            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }


        [Obsolete]
        private void ExportGridToPDF()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Vithal_Wadje.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdSatis.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            grdSatis.AllowPaging = true;
            grdSatis.DataBind();
        }
    }
}