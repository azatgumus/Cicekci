namespace Cicekci.DataAccess
{
    using System.ComponentModel.DataAnnotations;

    public partial class Yorum
    {
        public int Id { get; set; }
        public int UrunId { get; set; }
        [MaxLength(2000)]
        public string Yorum1 { get; set; }
        [MaxLength(50)]
        public string MusteriAd { get; set; }
        [MaxLength(100)]
        public string MusteriEmail { get; set; }
        public int? Derecelendirme { get; set; }
    
        public virtual Urun Urun { get; set; }
    }
}
