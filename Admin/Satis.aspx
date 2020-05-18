<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Satis.aspx.cs" MasterPageFile="~/Admin/Admin.Master" Inherits="Cicekci.Admin.Satis" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <table style="padding-left:150px;padding-top:50px">
        <tr>
            <td>Başlangıç Tarihi</td>
            <td>
                <input type="text" runat="server" id="datepicker1" clientidmode="Static"></td>
            <td>Fiyat1</td>
            <td>
                <asp:TextBox runat="server" ID="txtFiyat1" TextMode="Number"></asp:TextBox></td>
            <td>Ürün</td>
            <td>
                <asp:TextBox runat="server" ID="txtUrunAdi"></asp:TextBox>
            </td>
            <td>Ad Soyad</td>
            <td>
                <asp:TextBox runat="server" ID="txtAdSoyad"></asp:TextBox>
            </td>
            <td>
                <asp:Button runat="server" CssClass="btnSite" OnClick="FilterClick" Text="Rapor Al" /></td>
        </tr>
        <tr>
            <td>Bitiş Tarihi</td>
            <td>
                <input type="text" id="datepicker2" runat="server" clientidmode="Static"></td>
            <td>Fiyat2</td>
            <td>
                <asp:TextBox runat="server" ID="txtFiyat2" TextMode="Number"></asp:TextBox></td>
            <td>Miktar</td>
            <td>
                <asp:TextBox runat="server" ID="txtMiktar" ToolTip="En az" TextMode="Number"></asp:TextBox>
            </td>
            <td>Email</td>
            <td>

                <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
            </td>
            <td>
                <asp:Button runat="server" CssClass="btnSite" OnClick="ExportGridToPDF" Text="PDF" /></td>
        </tr>

    </table>
    <div id="centerColumn">
        <asp:GridView CssClass="mGrid" ShowHeaderWhenEmpty="true" AlternatingRowStyle-CssClass="alt" GridLines="Vertical" runat="server" ID="grdSatis" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField DataField="SiparisTarihi" HeaderText="Siparis Tarihi" />
                <asp:BoundField DataField="Ad" HeaderText="Ad" />
                <asp:BoundField DataField="BirimFiyat" HeaderText="Fiyat" />
                <asp:BoundField DataField="Miktar" HeaderText="Miktar" />
                <asp:BoundField DataField="Tutar" HeaderText="Tutar" />
                <asp:BoundField DataField="AdSoyad" HeaderText="Ad Soyad" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
            </Columns>
        </asp:GridView>
    </div>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker1").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#datepicker2").datepicker({ dateFormat: 'dd-mm-yy' });
        });
    </script>
</asp:Content>

