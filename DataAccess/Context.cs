namespace Cicekci.DataAccess
{
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;

    public partial class Context : DbContext
    {
        public Context()
            : base("name=Context")
        {
            Database.SetInitializer<Context>(new CreateDatabaseIfNotExists<Context>());
        }

        //protected override void OnModelCreating(DbModelBuilder modelBuilder)
        //{
        //    throw new UnintentionalCodeFirstException();
        //}

        public DbSet<Kategori> Kategori { get; set; }
        public DbSet<Rol> Rol { get; set; }
        public DbSet<Sepet> Sepet { get; set; }
        public DbSet<Siparis> Siparis { get; set; }
        public DbSet<Urun> Urun { get; set; }
        public DbSet<UrunSepet> UrunSepet { get; set; }
        public DbSet<Uye> Uye { get; set; }
        public DbSet<Yorum> Yorum { get; set; }
    }
}
