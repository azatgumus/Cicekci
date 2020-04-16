<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopülerÜrünler.ascx.cs" Inherits="Cicekci.Kontroller.PopülerÜrünler" %>
<%@ OutputCache Duration="3600" VaryByParam="None" %>
<div class="MostPopularHead">Haftanın en çok satan ürünleri</div>
<div id="PanelPopularItems" runat="server">
  <asp:Repeater ID="RepeaterItemsList" runat="server">
    <HeaderTemplate></HeaderTemplate>
      <ItemTemplate>      
           <a class='MostPopularItemText' href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>'><%# Eval("Ad") %></a><br />
                    
      </ItemTemplate>
    <FooterTemplate></FooterTemplate>
  </asp:Repeater>
</div>