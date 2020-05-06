namespace Cicekci.DataAccess
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class Siparis
    {
        [ForeignKey("Sepet")]
        [MaxLength(50)]
        public string Id { get; set; }
        [MaxLength(50), Required]
        public string MusteriAdi { get; set; }
        public System.DateTime SiparisTarihi { get; set; }
        [MaxLength(16)]
        public string KartNo { get; set; }
        public Nullable<int> UyeId { get; set; }

        public virtual Sepet Sepet { get; set; }
        public virtual Uye Uye { get; set; }
    }
}
