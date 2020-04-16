namespace Cicekci.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Yorum
    {
        public int Id { get; set; }
        public int UrunId { get; set; }
        public string Yorum1 { get; set; }
        public string MusteriAd { get; set; }
        public string MusteriEmail { get; set; }
        public int Derecelendirme { get; set; }
    
        public virtual Urun Urun { get; set; }
    }
}
