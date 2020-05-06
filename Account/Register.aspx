<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="Cicekci.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2>Yeni bir hesap oluştur.
    </h2>
    <p>
        Hesap oluşturmak için aşağıdaki formu doldurun.
    </p>
    <p>
        Şifre için minimum 6 karakter gereklidir.
    </p>
    <span class="failureNotification">
        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
    </span>
    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="RegisterUserValidationGroup" />
    <div class="accountInfo">
        <fieldset class="register">
            <legend>Hesap Bilgileri</legend>
            <p>
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Ad-Soyad:</asp:Label>
                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                    CssClass="failureNotification" ErrorMessage="Ad-Soyad gereklidir." ToolTip="Kullanıcı adı gereklidir."
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                    CssClass="failureNotification" ErrorMessage="E-mail gereklidir." ToolTip="E-mail gereklidir."
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Şifre:</asp:Label>
                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                    CssClass="failureNotification" ErrorMessage="Şifre gereklidir." ToolTip="Şifre gereklidir."
                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Şifreyi doğrulayın:</asp:Label>
                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic"
                    ErrorMessage="Şifre doğrulama gereklidir." ID="ConfirmPasswordRequired" runat="server"
                    ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="failureNotification" Display="Dynamic" ErrorMessage="Şifre ve doğrulama eşleşmiyor."
                    ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
            </p>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="CreateUserButton" OnClick="CreateUserButton_Click" runat="server" CommandName="MoveNext" Text="Kullanıcı oluştur"
                ValidationGroup="RegisterUserValidationGroup" />
        </p>
    </div>

</asp:Content>
