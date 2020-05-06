
using System;
using System.Web;

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