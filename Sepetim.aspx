<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sepetim.aspx.cs" Inherits="Cicekci.Sepetim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead">Sepetim</div>
    <asp:GridView ID="grdListe" runat="server" AutoGenerateColumns="False" SelectMethod="GetSepetItems"
        GridLines="Vertical"
        CssClass="mGrid"
        PagerStyle-CssClass="pgr"
        AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Ürün ID" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Ad" HeaderText="Ürün Adı" SortExpression="Ad" />
            <asp:BoundField DataField="BirimFiyat" HeaderText="Birim Fiyat" ReadOnly="True" SortExpression="BirimFiyat" DataFormatString="{0:c}" />

            <asp:TemplateField>
                <HeaderTemplate>Miktar</HeaderTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txtMiktar"  Width="40" runat="server" Text='<%# Bind("Miktar") %>'></asp:TextBox>
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
                     <asp:CheckBox id="chkCikar"  runat="server" />
                    </center>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div style="float: right">
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Sipariş Tutarı : " />
            <asp:Label CssClass="NormalBold" ID="lblTotal" runat="server" EnableViewState="false" />
        </strong>
    </div>
    <br />

    <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="Styles/Resimler/SiparişGüncelleme.PNG" OnClick="UpdateBtn_Click"></asp:ImageButton>
    <asp:ImageButton ID="CheckoutBtn" runat="server" ImageUrl="Styles/Resimler/SiparişTamam.PNG" PostBackUrl="SiparişKayıt.aspx"></asp:ImageButton>

</asp:Content>
