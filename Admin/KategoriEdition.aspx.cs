using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cicekci.DataAccess;
using System.IO;


namespace Cicekci.Admin
{
    public partial class KategoriEdition : System.Web.UI.Page
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
                if (db.Kategori.Count() > 0)
                {

                    GridView1.DataSource = db.Kategori;
                    GridView1.DataBind();
                }
                else
                {
                    var obj = new List<Kategori>();
                    obj.Add(new Kategori());
                    // Bind the DataTable which contain a blank row to the GridView
                    GridView1.DataSource = obj;
                    GridView1.DataBind();
                    int columnsCount = GridView1.Columns.Count;
                    GridView1.Rows[0].Cells.Clear();// clear all the cells in the row
                    GridView1.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
                    GridView1.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

                    //You can set the styles here
                    GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    GridView1.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    GridView1.Rows[0].Cells[0].Font.Bold = true;
                    //set No Results found to the new added cell
                    GridView1.Rows[0].Cells[0].Text = "Sonuç bulunamadı!";
                }
            }
        }

        protected void gridSample_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertNew")
            {
                GridViewRow row = GridView1.FooterRow;
             
                
                TextBox txtKategoriAdı = row.FindControl("txtYeniKategoriAdı") as TextBox;
                 
                if (txtKategoriAdı.Text != null)
                {
                    using (Context db = new Context())
                    {
                        
                        Kategori obj = new Kategori();
                        obj.Ad = txtKategoriAdı.Text;
                        db.Kategori.Add(obj);
                        db.SaveChanges();
                        lblMessage.Text = "Başarıyla eklendi.";
                        BindGrid();
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

            TextBox txtKategoriAdı = row.FindControl("txtKategoriAdı") as TextBox;



            if (txtKategoriAdı.Text != null)
            {
                using (Context db = new Context())
                {
                    int kategoriID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                    Kategori obj = db.Kategori.First(x => x.Id == kategoriID);
              
                    obj.Ad = txtKategoriAdı.Text;
                    
                    db.SaveChanges();
                    lblMessage.Text = "Başarıyla kaydedildi.";
                    GridView1.EditIndex = -1;
                    BindGrid();
                }
            }

        }


        protected void gridSample_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int kategoriID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (Context db = new Context())
            {
                Kategori obj = db.Kategori.First(x => x.Id == kategoriID);
                db.Kategori.Remove(obj);
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