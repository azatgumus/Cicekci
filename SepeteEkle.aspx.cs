using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace Cicekci
{
    public partial class SepeteEkle : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["ÜrünId"];
            int ürünId;
            if (!String.IsNullOrEmpty(rawId) && Int32.TryParse(rawId, out ürünId))
            {
                Sepetim usersShoppingCart = new Sepetim();
                String cartId = usersShoppingCart.SepetIdAl();
                usersShoppingCart.ÜrünEkle(cartId, ürünId, 1);
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
