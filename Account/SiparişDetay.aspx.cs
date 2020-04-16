using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci.Account
{
    public partial class SiparişDetay : System.Web.UI.Page
    {
        decimal _SepetToplam = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["SiparişId"]))
            {
                Response.Redirect("~/Account/SiparişListesi.aspx");
            }
        }
        protected void Listem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //TODO : Bakılacak
                //Cicekci.VeriErişimKatmanı.ViewOrderDetails myCart = new VeriErişimKatmanı.ViewOrderDetails();
                //myCart = (Cicekci.VeriErişimKatmanı.ViewOrderDetails)e.Row.DataItem;
                //_SepetToplam += Convert.ToDecimal(myCart.BirimFiyat * myCart.Miktar);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[5].Text = "Total: " + _SepetToplam.ToString("C");
            }
        }
    }
}