<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişDetay.aspx.cs" Inherits="Cicekci.Account.SiparişDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" CellPadding="4"
        ForeColor="#333333" Width="250px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            SiparişID : <%# Eval("Id") %><br />
            Müşteri Adı : <%# Eval("MusteriAdi") %><br />
            Sipariş Tarihi : <%# Eval("SiparisTarihi") %><br />
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>

    <asp:GridView ID="GridView_SiparişDetay" runat="server"
        AutoGenerateColumns="False"
        CellPadding="4"
        OnRowDataBound="Listem_RowDataBound" ShowFooter="True"
        ViewStateMode="Disabled" GridLines="Vertical"
        CssClass="mGrid"
        PagerStyle-CssClass="pgr"
        AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Ürün ID" ReadOnly="True"
                SortExpression="Id" />
            <asp:BoundField DataField="Ad" HeaderText="Ürün Adı"
                SortExpression="Ad" />
            <asp:BoundField DataField="BirimFiyat" HeaderText="Birim Fiyat" ReadOnly="True"
                SortExpression="BirimFiyat" DataFormatString="{0:c}" />
            <asp:BoundField DataField="Miktar" HeaderText="Miktar" ReadOnly="True"
                SortExpression="Miktar" />
            <asp:TemplateField>
                <HeaderTemplate>Ürün Tutarı</HeaderTemplate>
                <ItemTemplate>
                    <%# (Convert.ToDouble(Eval("Miktar")) *  Convert.ToDouble(Eval("BirimFiyat")))%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="CartListFooter" />
        <HeaderStyle CssClass="CartListHead" />
    </asp:GridView>
</asp:Content>
