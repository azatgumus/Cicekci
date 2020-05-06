using System;

namespace Cicekci.DataAccess
{
    public class UnitOfWork : IDisposable
    {
        private DataContext context = new DataContext();
        private GenericRepository<Kategori> kategoriRepository;
        private GenericRepository<Rol> rolRepository;
        private GenericRepository<Sepet> sepetRepository;
        private GenericRepository<Siparis> siparisRepository;
        private GenericRepository<Urun> urunRepository;
        private GenericRepository<UrunSepet> urunSepetRepository;
        private GenericRepository<Uye> uyeRepository;
        private GenericRepository<Yorum> yorumRepository;

        public GenericRepository<Kategori> KategoriRepository => this.kategoriRepository ?? new GenericRepository<Kategori>(context);
        public GenericRepository<Rol> RolRepository=> this.rolRepository ?? new GenericRepository<Rol>(context);
        public GenericRepository<Sepet> SepetRepository => this.sepetRepository ?? new GenericRepository<Sepet>(context);
        public GenericRepository<Siparis> SiparisRepository => this.siparisRepository ?? new GenericRepository<Siparis>(context);
        public GenericRepository<Urun> UrunRepository => this.urunRepository ?? new GenericRepository<Urun>(context);
        public GenericRepository<UrunSepet> UrunSepetRepository => this.urunSepetRepository ?? new GenericRepository<UrunSepet>(context);
        public GenericRepository<Uye> UyeRepository => this.uyeRepository ?? new GenericRepository<Uye>(context);
        public GenericRepository<Yorum> YorumRepository => this.yorumRepository ?? new GenericRepository<Yorum>(context);

        public void Save()
        {
            context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
 