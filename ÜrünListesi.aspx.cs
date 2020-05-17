using Cicekci.DataAccess;
using System;
using System.Linq;
using System.Web.UI;

namespace Cicekci
{
    public partial class ÜrünListesi : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            UnitOfWork uow = new UnitOfWork();
            var x = uow.UrunRepository.GetAll();
            string kategoriId = Request.QueryString["KategoriId"];
            if (kategoriId != null)
            {
                var kategoriIdAsInt = int.Parse(Request.QueryString["KategoriId"]);
                if (kategoriIdAsInt == 6 && !User.Identity.IsAuthenticated)
                {
                    lblMsg.Text = "Bu kategori sadece üyelerimize özel olarak sunulmaktadır.<br/>Bu kategorideki tüm ürünlere %30 iskonto uygulanmaktadır." +
                          "Avantajlardan faydalanmak için lütfen üye olunuz. <a style='color:red' href='Account/Register.aspx'>Tıklayınız.</a>";
                    return;
                }
                x = x.Where(r => r.KategoriId == kategoriIdAsInt);
            }
            if (User.Identity.IsAuthenticated)
            {
                foreach (var item in x)
                {
                    if (item.KategoriId == 6)
                        item.KampanyaliFiyat = Math.Round(item.BirimFiyat * Convert.ToDecimal(0.7), 2, MidpointRounding.AwayFromZero);
                }
            }

            ListView1.DataSource = x.ToList();
            ListView1.DataBind();
        }
    }
}