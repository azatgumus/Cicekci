<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişListesi.aspx.cs" Inherits="Cicekci.Account.SiparişListesi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ContentHead">Siparişler</div>

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
            <asp:BoundField DataField="MusteriAdi" HeaderText="Müşteri"
                SortExpression="MusteriAdi" />
            <asp:BoundField DataField="SiparisTarihi" HeaderText="Sipariş Tarihi"
                SortExpression="SiparisTarihi" />

            <asp:HyperLinkField Text="Detay"
                DataNavigateUrlFields="Id"
                DataNavigateUrlFormatString="~/Account/SiparişDetay.aspx?SiparişID={0}" />
        </Columns>

    </asp:GridView>


</asp:Content>
