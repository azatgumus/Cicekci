using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cicekci.DataAccess;
using System.IO;
using System.Data.Objects;


namespace Cicekci.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                
            }
            lblMessage.Text = "";

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Bind ürün data to grid
        /// </summary>
        void BindGrid()
        {
            using (Context db = new Context())
            {

                
                Int32 id = Convert.ToInt32(Request.QueryString["KategoriId"]);
                var kategoriQuery = (from c in db.Urun where c.KategoriId == id select c);
                if (id == 0)
                {
                    GridView1.Visible = false;
                    GridView1.DataSource = db.Urun;
                }
                else if (id == -1)
                {
                    GridView1.Visible = true;
                    GridView1.DataSource = db.Urun;
                }
                else 
                {

                    GridView1.DataSource = kategoriQuery;
                }

                GridView1.DataBind();


                if (kategoriQuery.Count() == 0 && id!=0 && id!=-1)
                {

                    var obj = new List<Urun>();
                    obj.Add(new Urun());
                  
                    GridView1.DataSource = obj;
                    GridView1.DataBind();
                    int columnsCount = GridView1.Columns.Count;
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell()); 
                    GridView1.Rows[0].Cells[0].ColumnSpan = columnsCount;

                    
                    GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    GridView1.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    GridView1.Rows[0].Cells[0].Font.Bold = true;
                  
                    GridView1.Rows[0].Cells[0].Text = "Sonuç bulunamadı!";
                }

            }

        }
        

        protected void gridSample_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertNew")
            {
                GridViewRow row = GridView1.FooterRow;
                FileUpload fileUpload = row.FindControl("FileUpload2") as FileUpload;
                TextBox txtModelNo = row.FindControl("txtYeniModelNo") as TextBox;
                TextBox txtModelAdı = row.FindControl("txtYeniModelAdı") as TextBox;
                TextBox txtBirimFiyat = row.FindControl("txtYeniBirimFiyat") as TextBox;
                TextBox txtTanım = row.FindControl("txtYeniTanım") as TextBox;

                if (txtModelNo != null && txtModelAdı != null)
                {
                    using (Context db = new Context())
                    {
                        if (fileUpload.HasFile)
                        {
                            string[] uzantılar = new string[] { ".jpeg", ".png", ".gif", ".jpg" };
                            string uzantı = Path.GetExtension(fileUpload.PostedFile.FileName);
                            if (uzantılar.Contains(uzantı))
                            {
                                fileUpload.SaveAs(System.IO.Path.Combine(Server.MapPath(@"~/ÜrünKatalog"), fileUpload.FileName));

                            }

                        }
                        Urun obj = new Urun();
                        Int32 id = Convert.ToInt32(Request.QueryString["KategoriId"]);

                        try
                        {
                            obj.KategoriId = id;
                            //obj.mo = txtModelNo.Text;
                            //obj.mdoe = txtModelAdı.Text;
                            obj.BirimFiyat = Convert.ToDecimal(txtBirimFiyat.Text);
                            obj.Aciklama = txtTanım.Text;
                            obj.Resim = fileUpload.FileName;
                            db.Urun.Add(obj);
                            db.SaveChanges();
                            lblMessage.Text = "Başarıyla eklendi.";
                            BindGrid();
                        }
                        catch (Exception ex)
                        {
                            Console.Write(ex.Message); 
                        }
                    }
                }
            }
        }
        protected void gridSample_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void gridSample_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;
            BindGrid();
        }
        protected void gridSample_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GridView1.Rows[e.RowIndex];

            FileUpload fileUpload = GridView1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
          
            TextBox txtModelNo = row.FindControl("txtModelNo") as TextBox;
            TextBox txtModelAdı = row.FindControl("txtModelAdı") as TextBox;
            TextBox txtBirimFiyat = row.FindControl("txtBirimFiyat") as TextBox;
            TextBox txtTanım = row.FindControl("txtTanım") as TextBox;



            if (txtModelNo != null)
            {
                using (Context db = new Context())
                {
                    int ürünID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                    Urun obj = db.Urun.First(x => x.Id == ürünID);
                    if (fileUpload.HasFile)
                    {
                        string[] uzantılar = new string[] { ".jpeg", ".png", ".gif", ".jpg" };
                        string uzantı = Path.GetExtension(fileUpload.PostedFile.FileName);
                        if (uzantılar.Contains(uzantı))
                        {
                            fileUpload.SaveAs(System.IO.Path.Combine(Server.MapPath(@"~/ÜrünKatalog"), fileUpload.FileName));
                            obj.Resim = fileUpload.FileName;

                        }

                    }
                   

                   
                    obj.BirimFiyat = Convert.ToDecimal(txtBirimFiyat.Text);
                    obj.Aciklama = txtTanım.Text;
                    

                    db.SaveChanges();
                    lblMessage.Text = "Başarıyla kaydedildi.";
                    GridView1.EditIndex = -1;
                    BindGrid();
                }
            }

        }


        protected void gridSample_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ürünID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (Context db = new Context())
            {
                Urun obj = db.Urun.First(x => x.Id == ürünID);


                db.Urun.Remove(obj);
                db.SaveChanges();
                BindGrid();
                lblMessage.Text = "Başarıyla silindi.";
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
         
        }
      


    }
}