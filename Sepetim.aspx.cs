using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci
{
    public partial class Sepetim : System.Web.UI.Page
    {
        //------------------------------------------------------------------------------------------------------------------------------------------+
        protected void Page_Load(object sender, EventArgs e)
        {
            Sepetim usersShoppingCart = new Sepetim();
            String kartId = usersShoppingCart.SepetIdAl();
            decimal sepetTutarı = 0;
            sepetTutarı = usersShoppingCart.SepetTutarı(kartId);
            if (sepetTutarı > 0)
            {
                lblTotal.Text = String.Format("{0:c}", usersShoppingCart.SepetTutarı(kartId));
            }
            else
            {
                LabelTotalText.Text = "";
                lblTotal.Text = "";
                ShoppingCartTitle.InnerText = "Sepetiniz Boş";
                UpdateBtn.Visible = false;
                CheckoutBtn.Visible = false;
            }
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        protected void UpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            Sepetim usersShoppingCart = new Sepetim();
            String kartId = usersShoppingCart.SepetIdAl();

            SepetGüncelleme[] cartUpdates = new SepetGüncelleme[Listem.Rows.Count];
            for (int i = 0; i < Listem.Rows.Count; i++)
            {
                IOrderedDictionary rowValues = new OrderedDictionary();
                rowValues = GetValues(Listem.Rows[i]);
                cartUpdates[i].ÜrünId = Convert.ToInt32(rowValues["ÜrünID"]);
                cartUpdates[i].AlımMiktarı = Convert.ToInt32(rowValues["Miktar"]);

                CheckBox cbRemove = new CheckBox();
                cbRemove = (CheckBox)Listem.Rows[i].FindControl("Çıkar");
                cartUpdates[i].ÜrünüÇıkar = cbRemove.Checked;
            }

            usersShoppingCart.SepetiVeritabanındaGüncelle(kartId, cartUpdates);
            Listem.DataBind();
            lblTotal.Text = String.Format("{0:c}", usersShoppingCart.SepetTutarı(kartId));
        }

        //------------------------------------------------------------------------------------------------------------------------------------------+
        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.Visible)
                {
                    // Extract values from the cell
                    cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                }
            }
            return values;
        }

    }
}