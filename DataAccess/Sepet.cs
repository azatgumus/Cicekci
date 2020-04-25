namespace Cicekci.DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Sepet
    {
        public Sepet()
        {
            this.UrunSepet = new HashSet<UrunSepet>();
        }
    
        [MaxLength(50)]
        public string Id { get; set; }
        public DateTime OlusturmaTarihi { get; set; }
    
        public virtual Siparis Siparis { get; set; }
        public virtual ICollection<UrunSepet> UrunSepet { get; set; }
    }
}
