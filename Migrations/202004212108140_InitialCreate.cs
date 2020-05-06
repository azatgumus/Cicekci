namespace Cicekci.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Kategori",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Ad = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Urun",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        KategoriId = c.Int(nullable: false),
                        Resim = c.String(maxLength: 100),
                        BirimFiyat = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Aciklama = c.String(maxLength: 500),
                        Ad = c.String(nullable: false, maxLength: 100),
                        CokSatan = c.Boolean(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Kategori", t => t.KategoriId, cascadeDelete: true)
                .Index(t => t.KategoriId);
            
            CreateTable(
                "dbo.UrunSepet",
                c => new
                    {
                        UrunId = c.Int(nullable: false),
                        SepetId = c.String(nullable: false, maxLength: 50),
                        Miktar = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UrunId, t.SepetId })
                .ForeignKey("dbo.Sepet", t => t.SepetId, cascadeDelete: true)
                .ForeignKey("dbo.Urun", t => t.UrunId, cascadeDelete: true)
                .Index(t => t.UrunId)
                .Index(t => t.SepetId);
            
            CreateTable(
                "dbo.Sepet",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 50),
                        OlusturmaTarihi = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Siparis",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 50),
                        MusteriAdi = c.String(nullable: false, maxLength: 50),
                        SiparisTarihi = c.DateTime(nullable: false),
                        KartNo = c.String(nullable: false, maxLength: 16),
                        UyeId = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Sepet", t => t.Id)
                .ForeignKey("dbo.Uye", t => t.UyeId)
                .Index(t => t.Id)
                .Index(t => t.UyeId);
            
            CreateTable(
                "dbo.Uye",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        KullaniciAdi = c.String(nullable: false, maxLength: 50),
                        Sifre = c.String(nullable: false, maxLength: 10),
                        Eposta = c.String(nullable: false, maxLength: 255),
                        KayitTarihi = c.DateTime(nullable: false),
                        SonGirisTarihi = c.DateTime(nullable: false),
                        RolId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Rol", t => t.RolId, cascadeDelete: true)
                .Index(t => t.RolId);
            
            CreateTable(
                "dbo.Rol",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Ad = c.String(nullable: false, maxLength: 10),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Yorum",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UrunId = c.Int(nullable: false),
                        Yorum1 = c.String(maxLength: 2000),
                        MusteriAd = c.String(maxLength: 50),
                        MusteriEmail = c.String(maxLength: 100),
                        Derecelendirme = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Urun", t => t.UrunId, cascadeDelete: true)
                .Index(t => t.UrunId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Yorum", "UrunId", "dbo.Urun");
            DropForeignKey("dbo.UrunSepet", "UrunId", "dbo.Urun");
            DropForeignKey("dbo.UrunSepet", "SepetId", "dbo.Sepet");
            DropForeignKey("dbo.Siparis", "UyeId", "dbo.Uye");
            DropForeignKey("dbo.Uye", "RolId", "dbo.Rol");
            DropForeignKey("dbo.Siparis", "Id", "dbo.Sepet");
            DropForeignKey("dbo.Urun", "KategoriId", "dbo.Kategori");
            DropIndex("dbo.Yorum", new[] { "UrunId" });
            DropIndex("dbo.Uye", new[] { "RolId" });
            DropIndex("dbo.Siparis", new[] { "UyeId" });
            DropIndex("dbo.Siparis", new[] { "Id" });
            DropIndex("dbo.UrunSepet", new[] { "SepetId" });
            DropIndex("dbo.UrunSepet", new[] { "UrunId" });
            DropIndex("dbo.Urun", new[] { "KategoriId" });
            DropTable("dbo.Yorum");
            DropTable("dbo.Rol");
            DropTable("dbo.Uye");
            DropTable("dbo.Siparis");
            DropTable("dbo.Sepet");
            DropTable("dbo.UrunSepet");
            DropTable("dbo.Urun");
            DropTable("dbo.Kategori");
        }
    }
}
