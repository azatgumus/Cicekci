namespace Cicekci.DataAccess
{
    using System.Data.Entity;
    using System.Data.Entity.ModelConfiguration.Conventions;

    public partial class DataContext : DbContext
    {
        public DataContext()
            : base("name=DataContext")
        {
            Database.SetInitializer<DataContext>(new CreateDatabaseIfNotExists<DataContext>());
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public DbSet<Kategori> Kategori { get; set; }
        public DbSet<Rol> Rol { get; set; }
        public DbSet<Sepet> Sepet { get; set; }
        public DbSet<Siparis> Siparis { get; set; }
        public DbSet<Urun> Urun { get; set; }
        public DbSet<UrunSepet> UrunSepet { get; set; }
        public DbSet<Uye> Uye { get; set; }
        public DbSet<Yorum> Yorum { get; set; }
        public DbSet<Iletisim> Iletisim { get; set; }
    }
}
