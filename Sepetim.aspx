<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sepetim.aspx.cs" Inherits="Cicekci.Sepetim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div id="ShoppingCartTitle" runat="server" class="ContentHead">Sepetim</div>
        <asp:GridView ID="Listem" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
                      DataSourceID="EDS_Sepet"  DataKeyNames="ÜrünID,BirimFiyat,Miktar" 
                      CssClass="CartListItem">              
            <AlternatingRowStyle CssClass="CartListItemAlt" />
            <Columns>
                <asp:BoundField DataField="ÜrünID" HeaderText="Ürün ID" ReadOnly="True" SortExpression="ÜrünID"  />
                <asp:BoundField DataField="ModelNumarası" HeaderText="Model Numarası" SortExpression="ModelNumarası" />
                <asp:BoundField DataField="ModelAdı" HeaderText="Model Adı" SortExpression="ModelAdı"  />
                <asp:BoundField DataField="BirimFiyat" HeaderText="Birim Fiyat" ReadOnly="True" SortExpression="BirimFiyat" DataFormatString="{0:c}" />         
               

                <asp:TemplateField> 
                    <HeaderTemplate>Miktar</HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="AlımMiktarı" Width="40" runat="server" Text='<%# Bind("Miktar") %>'></asp:TextBox> 
                    </ItemTemplate>
                </asp:TemplateField>           

                <asp:TemplateField> 
                    <HeaderTemplate>Ürün Tutarı</HeaderTemplate>
                    <ItemTemplate>
                          <%# (Convert.ToDouble(Eval("Miktar")) *  Convert.ToDouble(Eval("BirimFiyat")))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField> 
                    <HeaderTemplate>Ürünü Çıkar</HeaderTemplate>
                    <ItemTemplate>
                            <center>
                                <asp:CheckBox id="Çıkar" runat="server" />
                            </center>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle CssClass="CartListFooter"/>
            <HeaderStyle  CssClass="CartListHead" />
        </asp:GridView>
        <div style="float: right">
          <strong>
              <asp:Label ID="LabelTotalText" runat="server" Text="Sipariş Tutarı : "></asp:Label><asp:Label CssClass="NormalBold" id="lblTotal" runat="server" EnableViewState="false"></asp:Label></strong> 
        </div>
        <br />
    
        <asp:imagebutton id="UpdateBtn" runat="server" ImageURL="Styles/Resimler/SiparişGüncelleme.PNG" onclick="UpdateBtn_Click"></asp:imagebutton>
        <asp:imagebutton id="CheckoutBtn" runat="server" ImageURL="Styles/Resimler/SiparişTamam.PNG" PostBackUrl="SiparişKayıt.aspx"></asp:imagebutton>
    
        <asp:EntityDataSource ID="EDS_Sepet" runat="server" 
                          ConnectionString="name=CicekEntities" 
                          DefaultContainerName="CicekEntities" EnableFlattening="False" 
                          EnableUpdate="True" EntitySetName="ViewCarts" 
                          AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
        <WhereParameters>
            <asp:SessionParameter Name="KartID" DefaultValue="0" SessionField="Cicekci_KartID" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
