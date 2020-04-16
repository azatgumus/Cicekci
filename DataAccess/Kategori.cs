namespace Cicekci.DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Kategori
    {
        public Kategori()
        {
            this.Urun = new HashSet<Urun>();
        }
    
        public int Id { get; set; }

        [MaxLength(50)]
        public string Ad { get; set; }
    
        public virtual ICollection<Urun> Urun { get; set; }
    }
}
