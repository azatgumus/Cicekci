using System;
using System.Collections.Generic;
using System.Linq;
using Cicekci.DataAccess;
using System.Web.UI.WebControls;


namespace Cicekci
{
    public struct SepetGüncelleme
    {
        public int UrunId;
        public int AlimMiktari;
        public bool UrunCikar;
    }


    public partial class Sepetim
    {
        public const string KartId = "SepetId";
        UnitOfWork _uow;
        public Sepetim()
        {
            _uow = new UnitOfWork();
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public string SepetIdAl()
        {
            return Session[KartId]?.ToString();
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public List<UrunSepet> SepetItems(string sepetId)
        {
            List<UrunSepet> myCart;
            DataContext db = new DataContext();
            //decimal sepetTutarı = 0;
            try
            {
                myCart = (from c in db.UrunSepet
                          where c.SepetId == sepetId
                          select c).ToList();
            }
            catch (Exception exp)
            {
                throw new Exception("ERROR: Unable to Calculate Order Total - " + exp.Message.ToString(), exp);
            }
            return myCart;
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public void ÜrünÇıkar(string sepetId, int urunId)
        {
            var sepetItem = _uow.UrunSepetRepository.Get(x => x.SepetId == sepetId && x.UrunId == urunId).FirstOrDefault();
            _uow.UrunSepetRepository.Delete(sepetItem);
            _uow.Save();
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public void ÜrünGüncelle(string sepetId, int urunId, int miktar)
        {
            var sepetItem = _uow.UrunSepetRepository.Get(x => x.SepetId == sepetId && x.UrunId == urunId).FirstOrDefault();
            sepetItem.Miktar = miktar;
            _uow.UrunSepetRepository.Update(sepetItem);
            _uow.Save();
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public void SepetiVeritabanındaGüncelle(string sepetId, SepetGüncelleme[] sepetItemsUpdates)
        {
            var sepetItems = _uow.UrunSepetRepository.Get(x => x.SepetId == sepetId);
            foreach (UrunSepet oldItem in sepetItems)
            {
                SepetGüncelleme guncelItem = sepetItemsUpdates.FirstOrDefault(x => x.UrunId == oldItem.UrunId);
                if (guncelItem.AlimMiktari < 1 || guncelItem.UrunCikar == true)
                {
                    ÜrünÇıkar(sepetId, oldItem.UrunId);
                }
                else
                {
                    ÜrünGüncelle(sepetId, oldItem.UrunId, guncelItem.AlimMiktari);
                }
            }
        }

        //-------------------------------------------------------------------------------------------------------------------------+
        //   ürün listesi sayfasında  veya ürün detay sayfasında kullanıcı sepete ekle linki tıkladığı zaman çağrılır                                                                                                                |
        //---------------------------------------------------------------------------------------------------------------------------+
        public void UrunEkle(int ürünID, int miktar)
        {
            using (DataContext db = new DataContext())
            {
                //Sepet yoksa oluştur ve ürünü ekle
                if (Session["SepetId"] == null)
                {
                    Sepet sepet = new Sepet();
                    sepet.Id = Guid.NewGuid().ToString();
                    sepet.OlusturmaTarihi = DateTime.Now;
                    sepet.UrunSepet.Add(new UrunSepet
                    {
                        Sepet = sepet,
                        Miktar = miktar,
                        UrunId = ürünID
                    });
                    db.Sepet.Add(sepet);
                    Session["SepetId"] = sepet.Id;
                }
                //Sepet varsa ürünü kontrol et, yoksa ekle varsa miktarını bir artır.
                else
                {
                    string sepetId = Session[KartId].ToString();
                    UrunSepet myItem = (from c in db.UrunSepet where c.SepetId == sepetId && c.UrunId == ürünID select c).FirstOrDefault();
                    if (myItem == null)
                    {
                        UrunSepet sepetItem = new UrunSepet();
                        sepetItem.Miktar = miktar;
                        sepetItem.UrunId = ürünID;
                        sepetItem.SepetId = sepetId;

                        db.UrunSepet.Add(sepetItem);
                    }
                    else
                    {
                        myItem.Miktar += miktar;
                    }
                }
                try
                {
                    db.SaveChanges();
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: sepete ürün eklenemedi - " + exp.Message.ToString(), exp);
                }
            }

        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public bool SiparişiGönder(string kartNo,string adSoyad)
        {
            _uow.SiparisRepository.Insert(new Siparis
            {
                KartNo = kartNo,
                SiparisTarihi = DateTime.Now,
                Id = Session["SepetId"].ToString(),
                MusteriAdi = adSoyad
                //TODO UyeId
            });
            _uow.Save();
            return true;
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