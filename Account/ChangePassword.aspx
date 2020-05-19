<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="Cicekci.Account.ChangePassword" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <span class="failureNotification">
        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
    </span>
    <asp:ValidationSummary ID="vs1" runat="server" CssClass="failureNotification"
       ValidationGroup="SifreValidate" />

                <fieldset runat="server" style="height: 200px;">
                    <legend>Şifre Bilgileri</legend>
                    <p>
                        <asp:Label runat="server" Text="Mevcut Şifre"   Width="120" />
                        <asp:TextBox runat="server" ID="txtMevcutSifre"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMevcutSifre"
                            CssClass="failureNotification" ValidationGroup="SifreValidate" ErrorMessage="Mevcut Şifre gerekli">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label runat="server" Text="Yeni Şifre" Width="120"  />
                        <asp:TextBox runat="server" ID="txtYeniSifre"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtYeniSifre"
                            CssClass="failureNotification" ValidationGroup="SifreValidate" ToolTip="Yeni şifre gerekli" ErrorMessage="Yeni Şifre gerekli">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label runat="server" Text="Yeni Şifre Tekrar" Width="120" />
                        <asp:TextBox runat="server" ID="txtYeniSifreTekrar"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtYeniSifreTekrar"
                            CssClass="failureNotification" ValidationGroup="SifreValidate" ErrorMessage="Şifre tekrarı gerekli">*</asp:RequiredFieldValidator>
                         <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="txtYeniSifre" ControlToValidate="txtYeniSifreTekrar" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Yeni şifre ile şifre tekrarı eşleşmiyor"
                             ValidationGroup="SifreValidate">*</asp:CompareValidator>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button CssClass="btnSite" runat="server" Text="Güncelle"
                        OnClick="PasswordChange"  ValidationGroup="SifreValidate"/>
                </p>
                <fieldset runat="server" style="height: 200px">
                    <legend>Hesap Bilgileri</legend>
                    <p>
                        <asp:Label runat="server" Text="Mail" Width="120" />
                        <asp:TextBox runat="server" ID="txtMail"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtMail"
                            CssClass="failureNotification" ErrorMessage="Email gerekli" ToolTip="Email Gerekli">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label runat="server" Text="Kullanıcı Adı" Width="120" />
                        <asp:TextBox runat="server" ID="txtUserName" ReadOnly="true" />
                    </p>
                     <p>
                        <asp:Label runat="server" Text="Üyeliği Sonlandır" Width="120" />
                        <asp:CheckBox runat="server" ID="chkTerminate" ReadOnly="true" />
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button CssClass="btnSite" runat="server" Text="Güncelle"
                        OnClick="MailChange" />
                </p>






</asp:Content>
