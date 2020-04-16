<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ÜrünDetayı.aspx.cs" Inherits="Cicekci.ÜrünDetay" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="EDS_ÜrünDetayı" DataKeyNames="Id" OnPageIndexChanging="FormView1_PageIndexChanging">
    <ItemTemplate>
    <div class="ContentHead"><%# Eval("Ad") %></div><br />
      <table  border="0">
        <tr>
          <td >
            <img src='ÜrünKatalog/<%# Eval("Resim") %>'  border="0"  alt='<%# Eval("Ad") %>'  />
          </td>
          <td><%# Eval("Aciklama") %>
            <br /><br /><br />                
             
          </td>
        </tr>
      </table>
      <span class="UnitCost"><b>Fiyatı:</b> <%# Eval("BirimFiyat", "{0:c}")%>'
      <br /> 
      <%--<span class="ModelNumber">
        <b>Model Numarası:</b> <%# Eval("ModelNumarası") %>
      </span><br />--%>
      
      <a href='SepeteEkle.aspx?ürünID=<%# Eval("Id") %>' class="SiteLink"> 
        <img id="Img1" src="~/Styles/Resimler/cart.gif" runat="server"  
             alt="" />
          <br />
          Sepete Ekle
      </a>
          

      <br /><br /> 
          <div class="SubContentHead">Yorumlar</div><br />
        <a id="ReviewList_AddReview" href="YorumEkle.aspx?ürünID=<%# Eval("Id") %>">
           Bu ürün için yorum yap.
        </a>            
    </ItemTemplate>
    </asp:FormView>
    <asp:EntityDataSource ID="EDS_ÜrünDetayı" runat="server" ConnectionString="name=CicekEntities"   EntityTypeFilter="" 
              Select="" Where="" DefaultContainerName="CicekEntities" EnableFlattening="False" AutoGenerateWhereClause="True" EntitySetName="Urun">
    <WhereParameters>
      <asp:QueryStringParameter Name="Id" 
                                QueryStringField="Id"  Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>
    <asp:ListView ID="ListView_Yorumlar" runat="server" 
              DataKeyNames="Id,UrunId,Derecelendirme" DataSourceID="EDS_Yorumlistesi">
  <ItemTemplate>
    <tr>
      <td><%# Eval("MusteriAd") %></td>
      <td>
        <img src='Styles/Resimler/star<%# Eval("Derecelendirme") %>.jpg' alt="">
         
      </td>
      <td>
        <%# Eval("Yorum1") %>
      </td>
    
    </tr>
  </ItemTemplate>
  <AlternatingItemTemplate>
    <tr>
      <td><%# Eval("MusteriAd") %></td>
      <td>
        <img src='Styles/Resimler/star<%# Eval("Derecelendirme") %>.jpg' alt="">
       
      </td>
      <td><%# Eval("Yorum1") %></td>
    </tr>
  </AlternatingItemTemplate>
   <EmptyDataTemplate>
     <table runat="server">
       <tr><td>Bu ürün için henüz yorum yapılmamış.</td></tr>
     </table>
  </EmptyDataTemplate>
  <LayoutTemplate>
    <table runat="server">
      <tr runat="server">
        <td runat="server">
          <table ID="itemPlaceholderContainer" runat="server" border="1">
            <tr runat="server">
              <th runat="server">Müşteri</th>
              <th runat="server">Derecelendirme</th>
              <th runat="server">Yorumlar</th>
             </tr>
             <tr ID="itemPlaceholder" runat="server"></tr>
           </table>
         </td>
       </tr>
       <tr runat="server">
         <td runat="server">
           <asp:DataPager ID="DataPager1" runat="server">
             <Fields>
               <asp:NextPreviousPagerField ButtonType="Button" 
                                           ShowFirstPageButton="True"
                                           ShowLastPageButton="True" />
             </Fields>
           </asp:DataPager>
         </td>
       </tr>
     </table>
  </LayoutTemplate>
</asp:ListView>
<asp:EntityDataSource ID="EDS_YorumListesi" runat="server"  EnableFlattening="False" 
                       AutoGenerateWhereClause="True" 
                       EntityTypeFilter="" 
                       Select="" Where=""
                       ConnectionString="name=CicekEntities" 
                       DefaultContainerName="CicekEntities" 
                       EntitySetName="Yorum">
   <WhereParameters>
    <asp:QueryStringParameter Name="Id" QueryStringField="Id"  
                                               Type="Int32" />
  </WhereParameters>
</asp:EntityDataSource>
</asp:Content>
