using Cicekci.Classes;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Cicekci
{
    public partial class Sepetim : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void UpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            Sepetim usersShoppingCart = new Sepetim();
            string sepetID = usersShoppingCart.SepetIdAl();

            SepetGüncelleme[] sepetUpdates = new SepetGüncelleme[grdListe.Rows.Count];
            for (int i = 0; i < grdListe.Rows.Count; i++)
            {
                IOrderedDictionary rowValues = new OrderedDictionary();
                rowValues = GetValues(grdListe.Rows[i]);
                sepetUpdates[i].UrunId = Convert.ToInt32(rowValues["Id"]);

                sepetUpdates[i].AlimMiktari = Convert.ToInt16(rowValues["Miktar"]);

                CheckBox cbRemove = (CheckBox)grdListe.Rows[i].FindControl("chkCikar");
                sepetUpdates[i].UrunCikar = cbRemove.Checked;
            }

            usersShoppingCart.SepetiVeritabanındaGüncelle(sepetID, sepetUpdates);
            grdListe.DataBind();
        }

        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach (DataControlFieldCell cell in row.Cells)
            {
                //if (cell.Visible)
                //{
                // Extract values from the cell
                cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                //}
            }
            return values;
        }


        public List<SepetUrun> GetSepetItems()
        {

            Sepetim usersShoppingCart = new Sepetim();
            string sepetID = usersShoppingCart.SepetIdAl();
            if (sepetID == null)
            {
                LabelTotalText.Text = "";
                lblTotal.Text = "";
                ShoppingCartTitle.InnerText = "Sepetiniz Boş";
                UpdateBtn.Visible = false;
                CheckoutBtn.Visible = false;
                return null;
            }
            var items = usersShoppingCart.SepetItems(sepetID);

            decimal sepetTutari = items.Sum(od => od.Miktar * (od.Urun.KategoriId == 6 ? (Math.Round(od.Urun.BirimFiyat * Convert.ToDecimal(0.7), 2, MidpointRounding.AwayFromZero)) : od.Urun.BirimFiyat));
            if (sepetTutari > 0)
            {
                lblTotal.Text = string.Format("{0:c}", sepetTutari);
                return items.Select(x => new SepetUrun { Miktar = x.Miktar, BirimFiyat = x.Urun.KategoriId == 6 ? (Math.Round(x.Urun.BirimFiyat * Convert.ToDecimal(0.7), 2, MidpointRounding.AwayFromZero)) : x.Urun.BirimFiyat, Ad = x.Urun.Ad, Id = x.Urun.Id }).ToList();
            }
            else
            {
                LabelTotalText.Text = "";
                lblTotal.Text = "";
                ShoppingCartTitle.InnerText = "Sepetiniz Boş";
                UpdateBtn.Visible = false;
                CheckoutBtn.Visible = false;
                return null;
            }
        }


    }
}