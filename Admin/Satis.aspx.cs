using Cicekci.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cicekci.Admin
{
    public partial class Satis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dummy = new DataTable();
                dummy.Columns.Add("SiparisTarihi");
                dummy.Columns.Add("FaturaAdSoyad");
                dummy.Columns.Add("SiparisTutari");
                dummy.Rows.Add();
                grdSatis.DataSource = dummy;
                grdSatis.DataBind();

                //Required for jQuery DataTables to work.
                grdSatis.UseAccessibleHeader = true;
                grdSatis.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            
        }

        [WebMethod]
        public static List<Order> GetSiparisler()
        {
           
            UnitOfWork uow = new UnitOfWork();
            var ds=uow.SiparisRepository.GetAll().Select(x => new Order
            {
                FaturaAdSoyad = x.FaturaAdSoyad,
                SiparisTarihi = x.SiparisTarihi.ToString(),
                SiparisTutari = x.SiparisTutari
            }).ToList();
            return ds;
        }

        public class Order
        {
            public string SiparisTarihi { get; set; }
            public string FaturaAdSoyad { get; set; }
            public decimal SiparisTutari { get; set; }
        }
    }
}