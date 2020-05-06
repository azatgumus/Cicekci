namespace Cicekci.DataAccess
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Uye
    {
        public Uye()
        {
            this.Siparis = new HashSet<Siparis>();
        }
    
        public int Id { get; set; }
        [MaxLength(50), Required]
        public string KullaniciAdi { get; set; }
       
        [MaxLength(10), Required]
        public string Sifre { get; set; }
        [MaxLength(255), Required]
        public string Eposta { get; set; }
        public System.DateTime KayitTarihi { get; set; }
        public System.DateTime SonGirisTarihi { get; set; }
        public int RolId { get; set; }
    
        public virtual Rol Rol { get; set; }
        public virtual ICollection<Siparis> Siparis { get; set; }
    }
}
