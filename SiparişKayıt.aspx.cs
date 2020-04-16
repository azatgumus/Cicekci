using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using Cicekci;
using System.Data.SqlClient;
using System.Data.Sql;
using System.ComponentModel;
using System.Text; 
 
namespace Cicekci
{ 
    public partial class Çıkış : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnetdb.mdf;User Instance=true"); 
        
        decimal _SepetToplam = 0;//sepette yer alan ürünlerin toplam fiyatı
     //-------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        { 
            CheckOutHeader.InnerText = "Sepetiniz Boş";
            LabelCartHeader.Text = "";
            Gönder.Visible = false;
        }
    //--------------------------------------------------------------------------------------+
protected void Listem_RowDataBound(object sender, GridViewRowEventArgs e)
{
  if (e.Row.RowType == DataControlRowType.DataRow)
     {
     Cicekci.DataAccess.Sepet myCart = new DataAccess.Sepet();
     myCart = (Cicekci.DataAccess.Sepet)e.Row.DataItem;
                //TODO : bakılacak
     //_SepetToplam += myCart.BirimFiyat * myCart.Miktar;
     }
   else if (e.Row.RowType == DataControlRowType.Footer)
     {
     if (_SepetToplam > 0)
        {
        CheckOutHeader.InnerText = "Siparişinizi Gözden Geçirin ve Tamamlayın";
        LabelCartHeader.Text = "Tüm bilgilerin doğru olduğuna emin olun.";
        Gönder.Visible = true;
        e.Row.Cells[5].Text = "Total: " + _SepetToplam.ToString("C");
        }
     }
}

 

protected void Gönder_Click(object sender, EventArgs e)
{
    
    Sepetim usersShoppingCart = new Sepetim();
    if ((usersShoppingCart.SiparişiGönder(User.Identity.Name) == true) &&(TextBox1.Text!=""))
    {
        CheckOutHeader.InnerText = "Teşekkürler - Siparişiniz Alındı.";
        Message.Visible = false;
        SiparişTamamlama.Visible = false;

        try
        {
            //Kullanıcıdan adres ve kart bilgisini alma
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandText = "UPDATE aspnet_Users Set KartNo=@KartNo, Adres=@Adres Where  UserName= @Session";
            komut.Parameters.AddWithValue("@Adres", TextBox1.Text);
            komut.Parameters.AddWithValue("@KartNo", TextBox2.Text);
            komut.Parameters.AddWithValue("@Session", User.Identity.Name.ToString());
            komut.ExecuteNonQuery();
            con.Close();
        }
        catch(Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }
    else
    {
        Gönder.Visible = true;
        CheckOutHeader.InnerText = "Siparişiniz Alınamadı - Lütfen Tekrar Deneyin. ";
    }
}

protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
{
                        
}


    }
}