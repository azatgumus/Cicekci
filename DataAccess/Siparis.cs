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
        public System.DateTime SiparisTarihi { get; set; }
        [MaxLength(16)]
        public string KartNo { get; set; }
        public Nullable<int> UyeId { get; set; }

        [MaxLength(255),Required]
        public string FaturaAdSoyad { get; set; }

        [MaxLength(255),Required]
        public string FaturaAdres { get; set; }
        [MaxLength(20),Required]
        public string TelNo { get; set; }

        [MaxLength(255),Required]
        public string Email { get; set; }

        public int? Cvv { get; set; }
        public int? SktYil { get; set; }
        public int? SktAy { get; set; }

        [MaxLength(255)]
        public string KartSahibiAdSoyad { get; set; }


        public virtual Sepet Sepet { get; set; }
        public virtual Uye Uye { get; set; }
    }
}
