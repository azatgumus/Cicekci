<%@ Page Title="Ana Sayfa" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Cicekci._Default" %>

<%@ Register Src="~/Kontroller/PopülerÜrünler.ascx" TagPrefix="uc1" TagName="PopülerÜrünler" %>


<%--<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>--%>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
  <asp:LoginView ID="LoginView_VisitorGreeting" runat="server">
    <AnonymousTemplate>
        Bahçenize Hoş Geldiniz
    </AnonymousTemplate>
    <LoggedInTemplate>
      Hoşgeldin <asp:LoginName ID="LoginName_Welcome" runat="server" /> 
    </LoggedInTemplate>
  </asp:LoginView>
</h2>


    
<table>
  <tr>
    <td colspan="2"><hr /></td>
  </tr>
  <tr>
    <td>               
        <!-- Populer ürünler -->
        <uc1:PopülerÜrünler runat="server" id="PopülerÜrünler" /> 
    </td>
   
  </tr>
</table>

</asp:Content>
