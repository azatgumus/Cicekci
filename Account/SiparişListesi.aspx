<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişListesi.aspx.cs" Inherits="Cicekci.Account.SiparişListesi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ContentHead">Siparişler</div>
    <asp:Label runat="server" ID="lblMessage"></asp:Label>

    <table runat="server" id="tblAnonim" visible="false">
        <tr>
            <td>Sipariş No</td>
            <td><asp:TextBox runat="server" ID="txtSiparisNo"></asp:TextBox></td>
            <td><asp:Button runat="server" Text="Getir" CssClass="btnSite" ID="btnGetir" OnClick="SiparisGetir"></asp:Button></td>
        </tr>
    </table>
    
    <asp:GridView ID="GridView_SiparişListesi" runat="server" AllowPaging="True"
        GridLines="Vertical"
        CssClass="mGrid"
        PagerStyle-CssClass="pgr"
        AlternatingRowStyle-CssClass="alt" CellPadding="4" Width="100%"
        AutoGenerateColumns="False"
        ViewStateMode="Disabled">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="SiparişID" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="SiparisTutari" HeaderText="Tutar"
                SortExpression="MusteriAdi" />
            <asp:BoundField DataField="SiparisTarihi" HeaderText="Sipariş Tarihi"
                SortExpression="SiparisTarihi" />

            <asp:HyperLinkField Text="Detay"
                DataNavigateUrlFields="Id"
                DataNavigateUrlFormatString="~/Account/SiparişDetay.aspx?SiparişID={0}" />
        </Columns>

    </asp:GridView>



</asp:Content>
