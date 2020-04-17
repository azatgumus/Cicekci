using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cicekci.DataAccess;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace Cicekci
{
    public struct SepetGüncelleme
    {
        public int ÜrünId;
        public int AlımMiktarı;
        public bool ÜrünüÇıkar;
    }


    public partial class Sepetim
    {
        public const string KartId = "Cicekci_KartID";

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public String SepetIdAl()
        {
            if (Session[KartId] == null)
            {
                Session[KartId] = System.Web.HttpContext.Current.Request.IsAuthenticated ? User.Identity.Name : Guid.NewGuid().ToString();
            }
            return Session[KartId].ToString();
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public decimal SepetTutarı(string kartID)
        {

            using (DataContext db = new DataContext())
            {
                decimal sepetTutarı = 0;
                try
                {
                    //TODO bakılcak
                    //var myCart = (from c in db.Sepet where c.Id == kartID select c);
                    //if (myCart.Count() > 0)
                    //{
                    //    sepetTutarı = myCart.Sum(od => (decimal)od.Miktar * (decimal)od.BirimFiyat);
                    //}
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Calculate Order Total - " + exp.Message.ToString(), exp);
                }
                return (sepetTutarı);
            }
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public void ÜrünÇıkar(string kartID, int ürünID)
        {
            using (DataContext db = new DataContext())
            {
                try
                {
                    //var myItem = (from c in db.Sepets where c.KartID == kartID && c.ÜrünID == ürünID select c).FirstOrDefault();
                    //if (myItem != null)
                    //{
                    //    db.DeleteObject(myItem);
                    //    db.SaveChanges();
                    //}

                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Remove Cart Item - " + exp.Message.ToString(), exp);
                }
            }

        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public void ÜrünGüncelle(string kartID, int ürünID, int miktar)
        {
            using (DataContext db = new DataContext())
            {
                try
                {
                    //TODO
                    //var myItem = (from c in db.Sepets where c.KartID == kartID && c.ÜrünID == ürünID select c).FirstOrDefault();
                    //if (myItem != null)
                    //{
                    //    myItem.Miktar = miktar;
                    //    db.SaveChanges();
                    //}
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Ürün Güncellenemedi - " + exp.Message.ToString(), exp);
                }
            }

        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public void SepetiVeritabanındaGüncelle(String kartId, SepetGüncelleme[] CartItemUpdates)
        {
            using (DataContext db = new DataContext())
            {
                try
                {
                    int CartItemCOunt = CartItemUpdates.Count();
                    //TODO
                    //var myCart = (from c in db.ViewCarts where c.KartID == kartId select c);
                    //foreach (var kartItem in myCart)
                    //{
                    //    // Iterate through all rows within shopping cart list
                    //    for (int i = 0; i < CartItemCOunt; i++)
                    //    {
                    //        if (kartItem.ÜrünID == CartItemUpdates[i].ÜrünId)
                    //        {
                    //            if (CartItemUpdates[i].AlımMiktarı < 1 || CartItemUpdates[i].ÜrünüÇıkar == true)
                    //            {
                    //                ÜrünÇıkar(kartId, kartItem.ÜrünID);
                    //            }
                    //            else
                    //            {
                    //                ÜrünGüncelle(kartId, kartItem.ÜrünID, CartItemUpdates[i].AlımMiktarı);
                    //            }
                    //        }
                    //    }
                    //}
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Sepet Güncellenemedi - " + exp.Message.ToString(), exp);
                }
            }
        }

        //-------------------------------------------------------------------------------------------------------------------------+
        //   ürün listesi sayfasında  veya ürün detay sayfasında kullanıcı sepete ekle linki tıkladığı zaman çağrılır                                                                                                                |
      //---------------------------------------------------------------------------------------------------------------------------+
        public void ÜrünEkle(string kartID, int ürünID, int miktar)
        {
            using (DataContext db = new DataContext())
            {
                try
                {
                    //TODO bakılacak
                    //var myItem = (from c in db.Sepet where c.Id == kartID && c.ÜrünID == ürünID select c).FirstOrDefault();
                    //if (myItem == null)
                    //{
                    //    Sepet kartadd = new Sepet();
                    //    kartadd.KartID = kartID;
                    //    kartadd.Miktar = miktar;
                    //    kartadd.ÜrünID = ürünID;
                    //    kartadd.OluşturmaTarihi = DateTime.Now;
                    //    db.Sepets.AddObject(kartadd);
                    //}
                    //else
                    //{
                    //    myItem.Miktar += miktar;
                    //}

                    db.SaveChanges();
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: sepete ürün eklenemedi - " + exp.Message.ToString(), exp);
                }
            }

        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public bool SiparişiGönder(string UserName)
        {
            using (DataContext db = new DataContext())
            {
                try
                {
                    //------------------------------------------------------------------------+
                    //  yeni bir sipariş kaydı ekle                                            |
                    //------------------------------------------------------------------------+
                     Siparis newOrder = new Siparis();
                    newOrder.MusteriAdi = UserName;
                    newOrder.SiparisTarihi = DateTime.Now;
                    db.Siparis.Add(newOrder);
                    db.SaveChanges();

                    //------------------------------------------------------------------------+
                    //   Sepetteki her bir ürün için yeni bir sipariş SiparişDetay kaydı ekle |
                    //------------------------------------------------------------------------+
                    String kartId = SepetIdAl();
                    //TODO bakılacak sepete
                    //var myCart = (from c in db.Sepet where c.Id == kartId select c);
                    //foreach (Sepet item in myCart)
                    //{
                    //    int i = 0;
                    //    if (i < 1)
                    //    {
                    //        Siparis od = new Siparis();
                    //        od.Id = newOrder.SiparişID;
                    //        od.UrunId = item.ÜrünID;
                    //        od.Miktar = item.Miktar;
                    //        //od. = item.BirimFiyat;
                    //        db.Siparis.Add(od);
                    //        i++;
                    //    }

                    //    var myItem = (from c in db.Sepets where c.KartID == item.KartID && c.ÜrünID == item.ÜrünID select c).FirstOrDefault();
                    //    if (myItem != null)
                    //    {
                    //        db.DeleteObject(myItem);
                    //    }
                    //}
                    db.SaveChanges();
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: sipariş gönderilemedi - " + exp.Message.ToString(), exp);
                }
            }

            return (true);
        }


        //------------------------------------------------------------------------------------------------------------------------------------------+
        DateTime SevkTarihiHesapla()
        {
            DateTime shipDate = DateTime.Now.AddDays(2);
            return (shipDate);
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public void LoginsizSepetKaydı(String oldKartId, String UserName)
        {
            using (DataContext db = new DataContext())
            {
                try
                {
                    //TODO :
                    //var myShoppingCart = from sepet in db.Sepet
                    //                     where sepet.Id == oldKartId
                    //                     select sepet;

                    //foreach (Sepet item in myShoppingCart)
                    //{
                    //    item.KartID = UserName;
                    //}
                    db.SaveChanges();
                    Session[KartId] = UserName;
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Sepet kaydedilemedi. - " + exp.Message.ToString(), exp);
                }
            }
        }
    }
}