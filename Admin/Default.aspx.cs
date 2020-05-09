using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using Cicekci.DataAccess;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Cicekci.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        UnitOfWork uow = new UnitOfWork();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListView_Ürün_Menu.DataSource = uow.KategoriRepository.GetAll();
                ListView_Ürün_Menu.DataBind();

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
            using (DataContext db = new DataContext())
            {


                Int32 id = Convert.ToInt32(Request.QueryString["KategoriId"]);
                var kategoriQuery = (from c in db.Urun where c.KategoriId == id select c);
                if (id == 0)
                {
                    GridView1.Visible = false;
                    GridView1.DataSource = db.Urun.ToList();
                }
                else if (id == -1)
                {
                    GridView1.Visible = true;
                    GridView1.DataSource = db.Urun.ToList();
                }
                else
                {

                    GridView1.DataSource = kategoriQuery.ToList();
                }

                GridView1.DataBind();


                if (kategoriQuery.Count() == 0 && id != 0 && id != -1)
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
                TextBox txtUrunAdi = row.FindControl("txtYeniUrunAdi") as TextBox;
                TextBox txtBirimFiyat = row.FindControl("txtYeniBirimFiyat") as TextBox;
                TextBox txtAciklama = row.FindControl("txtYeniAciklama") as TextBox;

                if (txtUrunAdi != null)
                {
                    using (DataContext db = new DataContext())
                    {
                        if (fileUpload.HasFile)
                        {
                            string[] uzantılar = new string[] { ".jpeg", ".png", ".gif", ".jpg" };
                            string uzantı = Path.GetExtension(fileUpload.PostedFile.FileName);
                            if (uzantılar.Contains(uzantı))
                            {
                                //resize and save images
                                //small
                                System.Drawing.Image img = System.Drawing.Image.FromStream(fileUpload.PostedFile.InputStream);
                                var imageSmall = ResizeImage(img, new Size(278, 306));
                                var path1 = (System.IO.Path.Combine(Server.MapPath(@"~/ÜrünKatalog/Kucuk"), fileUpload.FileName));
                                if (!File.Exists(path1))
                                {
                                    imageSmall.Save(path1);
                                }
                                else
                                {
                                    lblMessage.Text = $"'{fileUpload.FileName}' Adında Resim Zaten Mevcut.";
                                    return;
                                }

                                //big
                                var path2 = (System.IO.Path.Combine(Server.MapPath(@"~/ÜrünKatalog/Buyuk"), fileUpload.FileName));
                                var imageLarge = ResizeImage(img, new Size(582, 640));
                                imageLarge.Save(path2);

                            }

                        }
                        Urun obj = new Urun();
                        Int32 id = Convert.ToInt32(Request.QueryString["KategoriId"]);

                        try
                        {
                            obj.KategoriId = id;
                            obj.Ad = txtUrunAdi.Text;
                            obj.BirimFiyat = Convert.ToDecimal(txtBirimFiyat.Text);
                            obj.Aciklama = txtAciklama.Text;
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

            TextBox txtUrunAdi = row.FindControl("txtUrunAdi") as TextBox;
            TextBox txtBirimFiyat = row.FindControl("txtBirimFiyat") as TextBox;
            TextBox txtAciklama = row.FindControl("txtAciklama") as TextBox;



            if (txtUrunAdi != null)
            {
                using (DataContext db = new DataContext())
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

                    obj.Ad = txtUrunAdi.Text;
                    obj.BirimFiyat = Convert.ToDecimal(txtBirimFiyat.Text);
                    obj.Aciklama = txtAciklama.Text;


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
            using (DataContext db = new DataContext())
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


        private static System.Drawing.Image ResizeImage(System.Drawing.Image imgToResize, Size size)

        {
            //Get the image current width
            int sourceWidth = imgToResize.Width;
            //Get the image current height
            int sourceHeight = imgToResize.Height;

            float nPercent = 0;

            float nPercentW = 0;

            float nPercentH = 0;

            //Calulate  width with new desired size
            nPercentW = ((float)size.Width / (float)sourceWidth);

            //Calculate height with new desired size

            nPercentH = ((float)size.Height / (float)sourceHeight);



            if (nPercentH < nPercentW)

                nPercent = nPercentH;

            else

                nPercent = nPercentW;

            //New Width

            int destWidth = (int)(sourceWidth * nPercent);

            //New Height

            int destHeight = (int)(sourceHeight * nPercent);



            Bitmap b = new Bitmap(destWidth, destHeight);

            Graphics g = Graphics.FromImage((System.Drawing.Image)b);

            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            // Draw image with new width and height

            g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);

            g.Dispose();

            return (System.Drawing.Image)b;

        }


    }
}