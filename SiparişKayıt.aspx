<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişKayıt.aspx.cs" Inherits="Cicekci.Çıkış" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="CheckOutHeader" runat="server" class="ContentHead">
                
        Gözden Geçir ve Siparişini Ver
</div>
<span id="Message" runat="server"><br />     
   <asp:Label ID="LabelCartHeader" runat="server" 
              Text="Tüm bilgilerin doğru olup olmadığını kontrol ediniz.">
   </asp:Label>
</span><br /> 
<asp:GridView ID="Listem" runat="server" AutoGenerateColumns="false" 
              DataKeyNames="ÜrünID,BirimFiyat,Miktar" 
              DataSourceID="EDS_Sepet" 
              CellPadding="4" GridLines="Vertical" CssClass="CartListItem" 
              onrowdatabound="Listem_RowDataBound" ShowFooter="True">
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
      <HeaderTemplate>Ürün Tutarı</HeaderTemplate>
      <ItemTemplate>
        <%# (Convert.ToDouble(Eval("Miktar")) * Convert.ToDouble(Eval("BirimFiyat")))%>
      </ItemTemplate>
    </asp:TemplateField>
  </Columns>
  <FooterStyle CssClass="CartListFooter"/>
  <HeaderStyle  CssClass="CartListHead" />
</asp:GridView>   
    
     <asp:Panel ID="SiparişTamamlama" runat="server">

    <table>
        <tr>
            <td>
            <asp:Label ID="Label1" runat="server" Text="Ödeme şekliniz:"></asp:Label>
            </td>
            <td><asp:RadioButton ID="RadioButton1" runat="server" GroupName="ÖdemeŞekli" Text="Kredi kartı"  onclick="Radio1_Click()" /></td>
            <td><asp:RadioButton ID="RadioButton2" runat="server" GroupName="ÖdemeŞekli" Text="Kapıda Ödeme" onclick="Radio2_Click()" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
       <tr>
           <td>
            <asp:Label ID="Label2" runat="server" Text="Adres:"></asp:Label>
            </td><td>
               <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
           </td>
           <td>
               <script type = "text/javascript">    
                   function Radio2_Click()
                   {   
                       var textBox = document.getElementById("<%=TextBox2.ClientID %>");
                       textBox.value = "";
                       textBox.disabled = true;
                   }
                    function Radio1_Click()
                    {
                        var textBox = document.getElementById("<%=TextBox2.ClientID %>");
                            textBox.disabled = false;
                     }
                          
                   
                   
               </script>
                
               <asp:RequiredFieldValidator ID="AdresGerekli" runat="server" ControlToValidate="TextBox1" 
                             CssClass="failureNotification" ErrorMessage="Adres gerekli." ToolTip="AdresGerekli." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
           </td>

       </tr>
        <tr>
           <td>KartNo:</td><td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
               <asp:RequiredFieldValidator ID="KartNoGerekli" runat="server" ControlToValidate="TextBox2" 
                             CssClass="failureNotification" ErrorMessage="Kart-no gerekli." ToolTip="Kartno gerekli." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
            </td>

       </tr>

    </table>
    
    <asp:Button ID="Gönder" runat="server" OnClick="Gönder_Click" Text="Gönder" Height="33px" />
        
         <asp:Label ID="Label3" runat="server"></asp:Label>
        
</asp:Panel>
    
<br />
<asp:EntityDataSource ID="EDS_Sepet" runat="server" 
                      ConnectionString="name=CicekEntities" 
                      DefaultContainerName="CicekEntities" 
                      EnableFlattening="False" 
                      EnableUpdate="True" 
                      EntitySetName="ViewCarts" 
                      AutoGenerateWhereClause="True" Where="">
   <WhereParameters>
      <asp:SessionParameter Name="KartID" DefaultValue="0" 
                                          SessionField="Cicekci_KartID" />
   </WhereParameters>
</asp:EntityDataSource>
</asp:Content>
