namespace Cicekci.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sepet
    {
        public Sepet()
        {
            this.UrunSepet = new HashSet<UrunSepet>();
        }
    
        public int Id { get; set; }
        public System.DateTime OlusturmaTarihi { get; set; }
    
        public virtual ICollection<UrunSepet> UrunSepet { get; set; }
    }
}
