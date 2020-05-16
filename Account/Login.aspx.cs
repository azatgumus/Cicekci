using System;
using System.Web.UI;
using System.Web.Security;
using Cicekci.DataAccess;
using System.Linq;

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
            else
            {
                if(Request.QueryString["ReturnUrl"]!=null)
                Session["LoginReferrer"] = Request.QueryString["ReturnUrl"];
            }


            if (User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/");
            }
        }
        //protected void LoginUser_LoggedIn(object sender, EventArgs e)
        //{
        //    Sepetim usersShoppingCart = new Sepetim();
        //    //TODO bakılacak 
        //    //String cartId = usersShoppingCart.SepetIdAl();
        //    //usersShoppingCart.LoginsizSepetKaydı(cartId, LoginUser.UserName);

        //    if (Session["LoginReferrer"] != null)
        //    {
        //        Response.Redirect(Session["LoginReferrer"].ToString());
        //    }

        //    Session["UserName"] = UserName.Text;



        //}

        

       

        protected void LoginButton_Click(object sender, ImageClickEventArgs e)
        {
            UnitOfWork uow = new UnitOfWork();

            Uye uye=uow.UyeRepository.Get(x=>x.KullaniciAdi==UserName.Text.Trim() && x.Sifre==Password.Text.Trim()).FirstOrDefault();
            if(uye!=null)
            {
                FormsAuthentication.SetAuthCookie(UserName.Text, RememberMe.Checked);
                //adminse
                if(uye.RolId==2)
                {
                    Response.Redirect("~/Admin/Default.aspx");
                }
                else if(uye.RolId==1 && Session["LoginReferrer"]!=null && !Session["LoginReferrer"].ToString().Contains("Sepetim"))
                {
                    Response.Redirect("~/Ürünlistesi.aspx?kategoriId=6");
                }
                //standart
                if (Session["LoginReferrer"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                   
                }
                else
                {
                    Response.Redirect(Session["LoginReferrer"].ToString());
                }

               
                //Response.Redirect(Page.Request.UrlReferrer);

            }
            //if (LoginUser.UserName == "admin" && LoginUser.Password == "123456")
            //    Response.Redirect("~/Admin/Default.aspx");
        }
    }
}
