namespace Cicekci.DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Urun
    {
        public Urun()
        {
            this.Siparis = new HashSet<Siparis>();
            this.UrunSepet = new HashSet<UrunSepet>();
            this.Yorum = new HashSet<Yorum>();
        }
    
        public int Id { get; set; }
        public int KategoriId { get; set; }
        [MaxLength(100)]
        public string Resim { get; set; }
        public decimal BirimFiyat { get; set; }
        [MaxLength(500)]
        public string Aciklama { get; set; }
        [MaxLength(100)]
        public string Ad { get; set; }
        public Nullable<bool> CokSatan { get; set; }
    
        public virtual Kategori Kategori { get; set; }
        public virtual ICollection<Siparis> Siparis { get; set; }
        public virtual ICollection<UrunSepet> UrunSepet { get; set; }
        public virtual ICollection<Yorum> Yorum { get; set; }
    }
}
