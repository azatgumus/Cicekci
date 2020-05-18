using Cicekci.DataAccess;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml.html;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci.Admin
{
    public partial class IletisimRapor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            grdIletisim.DataSource = new List<Iletisim>();
            grdIletisim.DataBind();
        }


        protected void FilterClick(object sender, EventArgs e)
        {
            UnitOfWork uow = new UnitOfWork();

            var ds = uow.IletisimRepository.GetAll().AsQueryable().AsNoTracking().Select(x => new Iletisim
            {
                Mesaj = HttpUtility.HtmlDecode(x.Mesaj),
                Konu = x.Konu,
                Ad = x.Ad,
                Email = x.Email
            });


            if (!string.IsNullOrEmpty(txtAd.Text))
            {
                ds = ds.Where(x => x.Ad.Contains(txtAd.Text));
            }
            if (!string.IsNullOrEmpty(txtEmail.Text))
            {
                ds = ds.Where(x => x.Email.Contains(txtEmail.Text));
            }
            if (!string.IsNullOrEmpty(txtKonu.Text))
            {
                ds = ds.Where(x => x.Konu.Contains(txtKonu.Text));
            }
            grdIletisim.DataSource = ds;
            grdIletisim.DataBind();
        }
        protected void ExportGridToPDF(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Uyelik.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdIletisim.RenderControl(hw);
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

            pdfDoc.Add(new Paragraph("Cicekcim.com                                         " + "İletişim Raporları", fontNormal));
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
    }
}