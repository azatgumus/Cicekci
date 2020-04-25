<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ÜrünListesi.aspx.cs" Inherits="Cicekci.ÜrünListesi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server"  DataKeyNames="Id" GroupItemCount="3">
         <EmptyDataTemplate>
      <table runat="server">
        <tr>
          <td>Veri yok.</td>
        </tr>
     </table>
  </EmptyDataTemplate>
  <EmptyItemTemplate>
     <td runat="server" />
  </EmptyItemTemplate>
  <GroupTemplate>
    <tr ID="itemPlaceholderContainer" runat="server">
      <td ID="itemPlaceholder" runat="server"></td>
    </tr>
  </GroupTemplate>
  <ItemTemplate>
    <td runat="server">
      <table border="0" width="300">
        <tr>
          <td>&nbsp</td>
          <td>
            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>'>
               <image src='ÜrünKatalog/<%# Eval("Resim") %>' 
                      width="100" height="125" border="0">
            </a> &nbsp
          </td>
          <td>
            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>'><span 
               class="ProductListHead"><%# Eval("Ad") %></span><br>
            </a>
            <span class="ProductListItem">
              <b>Fiyatı: </b><%# Eval("BirimFiyat", "{0:c}")%>
            </span><br />
            <a href='SepeteEkle.aspx?ÜrünId=<%# Eval("Id") %>'>
               <span class="ProductListItem"><b>Sepete Ekle<b></font></span>
            </a>
          </td>
        </tr>
      </table>
    </td>
  </ItemTemplate>
  <LayoutTemplate>
    <table runat="server">
      <tr runat="server">
        <td runat="server">
          <table ID="groupPlaceholderContainer" runat="server">
            <tr ID="groupPlaceholder" runat="server"></tr>
          </table>
        </td>
      </tr>
      <tr runat="server"><td runat="server"></td></tr>
    </table>
  </LayoutTemplate>
    </asp:ListView>
</asp:Content>
