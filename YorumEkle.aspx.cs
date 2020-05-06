using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Cicekci.DataAccess;
using System.Diagnostics;

namespace Cicekci
{
    public partial class GözdenGeçirmeEkle : System.Web.UI.Page
    {
        //------------------------------------------------------------------------------------------------------------------------------------------+
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["ÜrünID"]))
            {
                int ürünID = 0;
                Int32.TryParse(Request["ürünID"].ToString(), out ürünID);
                using (DataContext db = new DataContext())
                {
                    try
                    {
                        var thisÜrün = (from p in db.Urun where p.Id == ürünID select p).FirstOrDefault();
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Yorum Eklenemedi. - " + exp.Message.ToString(), exp);
                    }
                }
            }
            else
            {
                Debug.Fail("ERROR!");
                throw new Exception("ERROR!");
            }
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
       

        protected void LikeRating_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {

        }

        protected void YorumEkleBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                // sayfa url'sinden ürünıd'yi elde etme
                int ürünID = Int32.Parse(Request["ürünID"]);

                // radiobuttonlistten derecelendirmeyi alma
                int rating = Int32.Parse(Rating.SelectedItem.Value);

                // yorumu db ye kaydet
                using (DataContext db = new DataContext())
                {
                    try
                    {
                        Sepet cartadd = new Sepet();
                        Yorum yeniInceleme = new Yorum()
                        {
                            UrunId = ürünID,
                            Derecelendirme = rating,
                            MusteriAd = HttpUtility.HtmlEncode(Name.Text),
                            MusteriEmail = HttpUtility.HtmlEncode(Email.Text),
                            Yorum1 = HttpUtility.HtmlEncode(UserComment.Content),
                        };
                        db.Yorum.Add(yeniInceleme);
                        db.SaveChanges();
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Sepet güncellenemedi - " + exp.Message.ToString(), exp);
                    }
                }
                Response.Redirect("ÜrünDetayı.aspx?ÜrünID=" + ürünID);
            }
            Response.Redirect("ÜrünListesi.aspx");
        }
    }
}