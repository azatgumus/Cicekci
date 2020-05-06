using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using Cicekci.Classes;

namespace Cicekci
{
    public partial class Çıkış : System.Web.UI.Page
    {
        decimal _SepetToplam = 0;//sepette yer alan ürünlerin toplam fiyatı
                                 //-------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            Sepetim usersShoppingCart = new Sepetim();
            var items = usersShoppingCart.SepetItems(Session["SepetId"].ToString());
            Listem.DataSource = items.Select(x => new SepetUrun { Miktar = x.Miktar, BirimFiyat = x.Urun.BirimFiyat, Ad = x.Urun.Ad, Id = x.Urun.Id }).ToList();
            Listem.DataBind();

            //CheckOutHeader.InnerText = "Sepetiniz Boş";
            //LabelCartHeader.Text = "";
            //Gönder.Visible = false;
        }
        //--------------------------------------------------------------------------------------+
        protected void Listem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SepetUrun myCart = (SepetUrun)e.Row.DataItem;
                _SepetToplam += myCart.BirimFiyat * myCart.Miktar;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                if (_SepetToplam > 0)
                {
                    CheckOutHeader.InnerText = "Siparişinizi Gözden Geçirin ve Tamamlayın";
                    Gönder.Visible = true;
                    e.Row.Cells[3].Text = "Total: " + _SepetToplam.ToString("C");
                }
            }
        }



        protected void Gönder_Click(object sender, EventArgs e)
        {
            Sepetim usersShoppingCart = new Sepetim();
            if ((usersShoppingCart.SiparişiGönder(txtKartNo.Text, txtAdSoyad.Text) == true) && (txtAdres.Text != ""))
            {
                CheckOutHeader.InnerText = "Teşekkürler - Siparişiniz Alındı.";
                //Message.Visible = false;
                SiparişTamamlama.Visible = false;
                Session.Remove("SepetId");

            }
            else
            {
                Gönder.Visible = true;
                CheckOutHeader.InnerText = "Siparişiniz Alınamadı - Lütfen Tekrar Deneyin. ";
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }


    }
}