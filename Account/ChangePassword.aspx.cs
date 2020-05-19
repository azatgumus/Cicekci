using Cicekci.DataAccess;
using System;
using System.Linq;
using System.Web.Security;

namespace Cicekci.Account
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack) return;


            UnitOfWork uow = new UnitOfWork();
            var currentUser = uow.UyeRepository.Get(x => x.KullaniciAdi == User.Identity.Name).FirstOrDefault();

            txtMail.Text = currentUser.Eposta;
            txtUserName.Text = currentUser.KullaniciAdi;
        }



        protected void MailChange(object sender, EventArgs e)
        {
            ErrorMessage.Text = string.Empty;
            UnitOfWork uow = new UnitOfWork();
            var currentUser = uow.UyeRepository.Get(x => x.KullaniciAdi == User.Identity.Name).FirstOrDefault();
            if (chkTerminate.Checked)
            {
                foreach (var siparis in currentUser.Siparis.ToList())
                {
                    siparis.UyeId = null;
                    uow.SiparisRepository.Update(siparis);
                }
                uow.UyeRepository.Delete(currentUser);
                uow.Save();
                FormsAuthentication.SignOut();
                Response.Redirect("~/Default.aspx");
                ErrorMessage.Text = "Hesabının silinmiştir";
                return;
            }

            currentUser.Eposta = txtMail.Text;
            uow.Save();
            ErrorMessage.Text = "Mail başarıyla güncellendi.";
        }
        protected void PasswordChange(object sender, EventArgs e)
        {
            ErrorMessage.Text = string.Empty;
            UnitOfWork uow = new UnitOfWork();
            var currentUser = uow.UyeRepository.Get(x => x.KullaniciAdi == User.Identity.Name).FirstOrDefault();

            if (txtMevcutSifre.Text.Trim() != currentUser.Sifre)
            {
                ErrorMessage.Text = "Mevcut şifre yanlış";
                return;
            }
            currentUser.Sifre = txtYeniSifre.Text;
            uow.Save();
            ErrorMessage.Text = "Şifre başarıyla güncellendi.";
        }
    }
}
