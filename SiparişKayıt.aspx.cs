using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using Cicekci.Classes;
using Cicekci.DataAccess;

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
                    lblMessage.Text = "Siparişinizi Gözden Geçirin ve Tamamlayın";
                    Gönder.Visible = true;
                    e.Row.Cells[3].Text = "Toplam Tutar: " + _SepetToplam.ToString("C");
                }
            }
        }



        protected void Gönder_Click(object sender, EventArgs e)
        {
            Sepetim usersShoppingCart = new Sepetim();

            Siparis siparis = new Siparis
            {
                Id = Session["SepetId"].ToString(),
                Cvv = string.IsNullOrEmpty(txtCvv.Text) ? 0 : int.Parse(txtCvv.Text),
                SktYil = string.IsNullOrEmpty(ddlYil.SelectedValue) ? 0 : int.Parse(ddlYil.SelectedValue),
                SktAy = string.IsNullOrEmpty(ddlAy.SelectedValue) ? 0 : int.Parse(ddlAy.SelectedValue),
                KartSahibiAdSoyad = txtKartAdSoyad.Text,
                KartNo = txtKartNo.Text,
                FaturaAdres = txtAdres.Text,
                TelNo = txtTelefonNo.Text,
                FaturaAdSoyad = txtAdSoyad.Text,
                Email = txtEmail.Text,
                SiparisTarihi = DateTime.Now

            };
            if ((usersShoppingCart.SiparişiGönder(siparis) == true) && (txtAdres.Text != ""))
            {
                lblMessage.Text = $"Teşekkürler - <span style='color:red;font-size:15px;font-weight: bold;'>Siparişiniz Alındı.</span><br/>Ptt Kargo Takip No : <span style='color:red;font-size:15px;font-weight: bold;'>{siparis.Id.Substring(0, 8)}</span><br/>Siparişinizin" +
                    $" <span style='color:red;font-size:15px;font-weight: bold;'>{DateTime.Today.AddDays(2).ToString("dd/MM/yyyy")}</span> tarihinde teslim edilmesi hedeflenmektedir.";
                //Message.Visible = false;
                SiparişTamamlama.Visible = false;
                Session.Remove("SepetId");

            }
            else
            {
                Gönder.Visible = true;
                lblMessage.Text = "Siparişiniz Alınamadı - Lütfen Tekrar Deneyin. ";
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }


    }
}