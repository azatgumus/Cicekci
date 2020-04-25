<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişKayıt.aspx.cs" Inherits="Cicekci.Çıkış" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="CheckOutHeader" runat="server" class="ContentHead">
        Gözden Geçir ve Siparişini Ver
</div>
 
<asp:GridView ID="Listem" runat="server" AutoGenerateColumns="false" ShowFooter="true"
               
              
              CellPadding="4" GridLines="Vertical" CssClass="CartListItem" 
              onrowdatabound="Listem_RowDataBound">
  
  <Columns>
    <asp:BoundField DataField="Id" HeaderText="Ürün ID" ReadOnly="True" 
                    SortExpression="Id"  />
    
    
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
            </td>
           <td>
               <asp:TextBox ID="txtAdres" runat="server"></asp:TextBox>
           </td>
           <td>
               <script type = "text/javascript">    
                   function Radio2_Click()
                   {   
                       var textBox = document.getElementById("<%=txtKartNo.ClientID %>");
                       textBox.value = "";
                       textBox.disabled = true;
                       ValidatorEnable(document.getElementById("<%=KartNoGerekli.ClientID %>"), false); 
                   }
                    function Radio1_Click()
                    {
                        var textBox = document.getElementById("<%=txtKartNo.ClientID %>");
                            textBox.disabled = false;
                   }
               </script>
                
               <asp:RequiredFieldValidator ID="AdresGerekli" runat="server" ControlToValidate="txtAdres" 
                             CssClass="failureNotification" ErrorMessage="Adres gerekli." ToolTip="AdresGerekli." 
                            />
           </td>
       </tr>
        <tr>
           <td>KartNo:</td><td>
            <asp:TextBox ID="txtKartNo" runat="server"></asp:TextBox>
            </td>
            <td>
               <asp:RequiredFieldValidator ID="KartNoGerekli" runat="server" ControlToValidate="txtKartNo" 
                             CssClass="failureNotification" ErrorMessage="Kart-no gerekli." ToolTip="Kartno gerekli." />
            </td>
       </tr>
         <tr>
           <td>Ad Soyad:</td><td>
            <asp:TextBox ID="txtAdSoyad" runat="server"></asp:TextBox>
            </td>
            <td>
               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAdSoyad" 
                             CssClass="failureNotification" ErrorMessage="Ad Soyad gerekli." ToolTip="Ad Soyad gerekli." />
            </td>
       </tr>

    </table>
    
    <asp:Button ID="Gönder" runat="server" OnClick="Gönder_Click" Text="Gönder" Height="33px" />
        
         <asp:Label ID="Label3" runat="server"></asp:Label>
        
</asp:Panel>
    
<br />
 
</asp:Content>
