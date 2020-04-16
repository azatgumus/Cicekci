
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
    public partial class SiteMaster : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (Session["UserName"] == null)
                {
                    Session["UserName"] = HttpContext.Current.User.Identity.Name;
                }
            }

        }
    }
}