using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
namespace Cicekci.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // eğer kullanıcı login olmamışsa kullanıcıyı kaydolduktan sonra Sepetim.aspx sayfasına yönlendirir
            if (!Page.IsPostBack)
            {
                if (Page.Request.UrlReferrer != null)
                {
                    Session["LoginReferrer"] = Page.Request.UrlReferrer.ToString();
                }
            }

            
            if (User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/");
            }
        }
        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            Sepetim usersShoppingCart = new Sepetim();
            String cartId = usersShoppingCart.SepetIdAl();
            usersShoppingCart.LoginsizSepetKaydı(cartId, LoginUser.UserName);

            if (Session["LoginReferrer"] != null)
            {
                Response.Redirect(Session["LoginReferrer"].ToString());
            }

            Session["UserName"] = LoginUser.UserName;
            
           
           
        }

        protected void Password_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void RegisterHyperLink_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, ImageClickEventArgs e)
        {
            
            if (LoginUser.UserName == "admin" && LoginUser.Password == "123456")
               Response.Redirect("~/Admin/Default.aspx"); 
             
           
        }
            
        protected void UserName_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void UserName_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}
