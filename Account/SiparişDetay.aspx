<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişDetay.aspx.cs" Inherits="Cicekci.Account.SiparişDetay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:FormView ID="FormView1" runat="server" CellPadding="4" 
                             DataKeyNames="SiparişID" 
                             DataSourceID="EDS_Sipariş" ForeColor="#333333" Width="250px">
   <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
   <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
   <ItemTemplate>
      SiparişID : <%# Eval("SiparişID") %><br />
      Müşteri Adı : <%# Eval("MüşteriAdı") %><br />
      Sipariş Tarihi : <%# Eval("SiparişTarihi") %><br />
      Sevk Tarihi : <%# Eval("SevkTarihi") %><br />
   </ItemTemplate>
   <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
   <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
</asp:FormView>
<asp:EntityDataSource ID="EDS_Sipariş" runat="server"  EnableFlattening="False" 
                      ConnectionString="name=CicekEntities" 
                      DefaultContainerName="CicekEntities" 
                      EntitySetName="Siparişler" 
                      AutoGenerateWhereClause="True" 
                      Where="" 
                      EntityTypeFilter="" Select="">
   <WhereParameters>
      <asp:QueryStringParameter Name="SiparişID" QueryStringField="SiparişID" Type="Int32" />
   </WhereParameters>
</asp:EntityDataSource>

<asp:GridView ID="GridView_SiparişDetay" runat="server" 
              AutoGenerateColumns="False" 
              DataKeyNames="ÜrünID,BirimFiyat,Miktar" 
              DataSourceID="EDS_SiparişDetay" 
              CellPadding="4" GridLines="Vertical" CssClass="CartListItem" 
              onrowdatabound="Listem_RowDataBound" ShowFooter="True" 
              ViewStateMode="Disabled">
   <AlternatingRowStyle CssClass="CartListItemAlt" />
   <Columns>
     <asp:BoundField DataField="ÜrünID" HeaderText="Ürün ID" ReadOnly="True" 
                     SortExpression="ÜrünID"  />
     <asp:BoundField DataField="ModelNumarası" HeaderText="Model Numarası"  
                     SortExpression="ModelNumarası" />
     <asp:BoundField DataField="ModelAdı" HeaderText="Model Adı" 
                     SortExpression="ModelAdı" />
     <asp:BoundField DataField="BirimFiyat" HeaderText="Birim Fiyat" ReadOnly="True" 
                     SortExpression="BirimFiyat" DataFormatString="{0:c}" />
     <asp:BoundField DataField="Miktar" HeaderText="Miktar" ReadOnly="True" 
                     SortExpression="Miktar" />
     <asp:TemplateField> 
       <HeaderTemplate>Item Total</HeaderTemplate>
       <ItemTemplate>
         <%# (Convert.ToDouble(Eval("Miktar")) *  Convert.ToDouble(Eval("BirimFiyat")))%>
       </ItemTemplate>
     </asp:TemplateField>
   </Columns>
   <FooterStyle CssClass="CartListFooter"/>
   <HeaderStyle  CssClass="CartListHead" />
 </asp:GridView> 
 <asp:EntityDataSource ID="EDS_SiparişDetay" runat="server" 
                       ConnectionString="name=CicekEntities" 
                       DefaultContainerName="CicekEntities" 
                       EnableFlattening="False" 
                       EntitySetName="ViewOrderDetails" 
                       AutoGenerateWhereClause="True" 
                       Where="">
   <WhereParameters>
     <asp:QueryStringParameter Name="SiparişID" QueryStringField="SiparişID" Type="Int32" />
   </WhereParameters>
</asp:EntityDataSource>
</asp:Content>
