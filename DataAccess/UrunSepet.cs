namespace Cicekci.DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class UrunSepet
    {
        [Key, Column(Order = 0)]
        public int UrunId { get; set; }
        [Key, Column(Order = 1)]
        public int SepetId { get; set; }
        public Nullable<int> Miktar { get; set; }
    
        public virtual Sepet Sepet { get; set; }
        public virtual Urun Urun { get; set; }
    }
}
