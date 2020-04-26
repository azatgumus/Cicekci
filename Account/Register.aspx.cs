using Cicekci.DataAccess;
using System;
using System.Linq;

namespace Cicekci.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void CreateUserButton_Click(object sender, EventArgs e)
        {
            UnitOfWork uow = new UnitOfWork();
            string userName = UserName.Text.Trim();

            //Aynı kullanıcı adında bir kullanıcı var mı
            Uye uye = uow.UyeRepository.Get(x => x.KullaniciAdi == userName).FirstOrDefault();
            if (uye != null)
            {
                ErrorMessage.Text = $"{userName} adında bir kullanıcı zaten mevcut";
                return;
            }
            uow.UyeRepository.Insert(new Uye
            {

                Eposta = Email.Text,
                KayitTarihi = DateTime.Now,
                KullaniciAdi = UserName.Text,
                Sifre = Password.Text,
                SonGirisTarihi = DateTime.Now,
                RolId = 1
            });
            uow.Save();
            Response.Redirect("Login.aspx");
        }


    }
}
