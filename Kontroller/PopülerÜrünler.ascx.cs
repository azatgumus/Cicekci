using System;
using System.Linq;
using Cicekci.DataAccess;

namespace Cicekci.Kontroller
{
    public partial class PopülerÜrünler : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (DataContext db = new DataContext())
            {
                try
                {
                    var query = db.Urun.Where(x => x.CokSatan==true).Take(5);

                    RepeaterItemsList.DataSource = query.ToList();
                    RepeaterItemsList.DataBind();
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Popüler ürünler yüklenemedi - " + exp.Message.ToString(), exp);
                }
            }
        }
    }
}