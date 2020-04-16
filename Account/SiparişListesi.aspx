<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişListesi.aspx.cs" Inherits="Cicekci.Account.SiparişListesi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ContentHead">Sipariş Tarihi</div><br />

<asp:GridView ID="GridView_SiparişListesi" runat="server" AllowPaging="True" 
              ForeColor="#333333" GridLines="None" CellPadding="4" Width="100%" 
              AutoGenerateColumns="False" DataKeyNames="SiparişID" 
              DataSourceID="EDS_Siparişler" AllowSorting="True" ViewStateMode="Disabled" >
  <AlternatingRowStyle BackColor="White" />
  <Columns>
    <asp:BoundField DataField="SiparişID" HeaderText="SiparişID" ReadOnly="True" 
                    SortExpression="SiparişID" />
    <asp:BoundField DataField="MüşteriAdı" HeaderText="Müşteri" 
                    SortExpression="MüşteriAdı" />
    <asp:BoundField DataField="SiparişTarihi" HeaderText="Sipariş Tarihi" 
                    SortExpression="SiparişTarihi" />
    <asp:BoundField DataField="SevkTarihi" HeaderText="Sevk Tarihi" 
                    SortExpression="SevkTarihi" />
    <asp:HyperLinkField HeaderText="Detayı Göster" Text="Detayı Göster " 
                 DataNavigateUrlFields="SiparişID" 
                 DataNavigateUrlFormatString="~/Account/SiparişDetay.aspx?SiparişID={0}" />
  </Columns>
  <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
  <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
  <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
  <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
  <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
  <SortedAscendingCellStyle BackColor="#FDF5AC" />
  <SortedAscendingHeaderStyle BackColor="#4D0000" />
  <SortedDescendingCellStyle BackColor="#FCF6C0" />
  <SortedDescendingHeaderStyle BackColor="#820000" />
  <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
  <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
  <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
  <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
</asp:GridView>

<asp:EntityDataSource ID="EDS_Siparişler" runat="server" EnableFlattening="False" 
                      AutoGenerateWhereClause="True" 
                      Where="" 
                      OrderBy="it.[SiparişTarihi] DESC"
                      ConnectionString="name=CicekEntities"  
                      DefaultContainerName="CicekEntities" 
                      EntitySetName="Siparişler" >
   <WhereParameters>
      <asp:SessionParameter Name="MüşteriAdı" SessionField="UserName" />
   </WhereParameters>
</asp:EntityDataSource>
</asp:Content>
