
using Cicekci.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cicekci
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (Session["UserName"] == null)
                {
                    Session["UserName"] = HttpContext.Current.User.Identity.Name;
                }
            }

        }
        public List<Kategori> KategoriList()
        {
            UnitOfWork uow = new UnitOfWork();
            var kategoriler = uow.KategoriRepository.GetAll().ToList();
            return kategoriler;
        }
    }
}