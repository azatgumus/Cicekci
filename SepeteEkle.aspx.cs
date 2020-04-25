using System;
using System.Web.UI;
using System.Diagnostics;

namespace Cicekci
{
    public partial class SepeteEkle : Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["ÜrünId"];
            int ürünId;
            if (!String.IsNullOrEmpty(rawId) && Int32.TryParse(rawId, out ürünId))
            {
                //Ürün ekle
                Sepetim usersShoppingCart = new Sepetim();
                usersShoppingCart.UrunEkle(ürünId, 1);
            }
            else
            {
                Debug.Fail("ERROR!");
                throw new Exception("ERROR!");
            }
            Response.Redirect("Sepetim.aspx");
        }
    }
}
