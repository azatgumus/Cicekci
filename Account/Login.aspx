<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cicekci.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="ContentHead">Hesabınıza giriş yapın</div>
    <br />
    <p>
        &nbsp;Adınızı,soyadınızı ve şifrenizi giriniz.
    </p>

    <span class="failureNotification">
        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
    </span>
    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" ValidationGroup="LoginUserValidationGroup" />
    <div class="accountInfo">
        <fieldset class="login" style="width: 100%">
            <p>
                <br />
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Ad-Soyad:</asp:Label>
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                    CssClass="failureNotification" ErrorMessage="Ad-Soyad gerekli." ToolTip="User Name is required."
                    ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Şifre:</asp:Label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password"/>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                    CssClass="failureNotification" ErrorMessage="Şifre gerekli." ToolTip="Password is required."
                    ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:CheckBox ID="RememberMe" runat="server" />
                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Beni Hatırla</asp:Label>
            </p>
            <p class="submitButton">
                <asp:ImageButton ID="LoginButton" runat="server" CommandName="Login" ValidationGroup="LoginUserValidationGroup" ImageUrl="~/Styles/Resimler/Giriş.jpg" OnClick="LoginButton_Click" />
            </p>
        </fieldset>
        <p style="padding: 20px;">
            Eğer hesabınız yoksa şimdi kaydolun. 
            <br />
            <br />
            <asp:ImageButton ID="RegisterHyperLink" runat="server" EnableViewState="false"
                ImageUrl="../Styles/Resimler/Kaydol.png" PostBackUrl="~/Account/Register.aspx" ></asp:ImageButton>
        </p>
    </div>

</asp:Content>
