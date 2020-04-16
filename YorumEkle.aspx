<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YorumEkle.aspx.cs" Inherits="Cicekci.GözdenGeçirmeEkle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
<div class="ContentHead">Yorum Ekle  <asp:label id="ModelAdı" runat="server" /></div>
<div>
  <span class="NormalBold">Ad</span><br />
  <asp:TextBox id="Name" runat="server" Width="400px" /><br />
  <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" 
                              ControlToValidate="Name" 
                              Display="Dynamic" 
                              CssClass="ValidationError" 
                              ErrorMessage="Ad boş geçilemez."  /><br />
  <span class="NormalBold">Email</span><br />
  <asp:TextBox id="Email" runat="server" Width="400px" /><br />
  <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" 
                              ControlToValidate="Email" Display="Dynamic" 
                              CssClass="ValidationError" 
                              ErrorMessage="E-mail boş geçilemez." />
  <br /><hr /><br />
  <span class="NormalBold">Derecelendirme</span><br /><br />
  <asp:RadioButtonList ID="Rating" runat="server">
    <asp:ListItem value="5" selected="True" 
             Text='<img src="Styles/Resimler/star5.jpg" alt=""> (Five Stars) '  />
    <asp:ListItem value="4" selected="True" 
             Text='<img src="Styles/Resimler/star4.jpg" alt=""> (Four Stars) '  />
    <asp:ListItem value="3" selected="True" 
             Text='<img src="Styles/Resimler/star3.jpg" alt=""> (Three Stars) '  />
    <asp:ListItem value="2" selected="True" 
             Text='<img src="Styles/Resimler/star2.jpg" alt=""> (Two Stars) '  />
    <asp:ListItem value="1" selected="True" 
             Text='<img src="Styles/Resimler/star1.jpg" alt=""> (One Stars) '  />
  </asp:RadioButtonList>
  <br /><hr /><br />
  <span class="NormalBold">Yorum</span><br />
    <cc1:Editor ID="UserComment" runat="server" />
  <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" 
                              ControlToValidate="UserComment" Display="Dynamic" 
                              CssClass="ValidationError" 
                              ErrorMessage="Lütfen yorumunuzu giriniz." /><br /><br />
   
    <asp:LinkButton   BackColor="Red"  runat="server" OnClick="YorumEkleBtn_Click">Gönder</asp:LinkButton>
   
  <br /><br /><br />
</div>
</asp:Content>
