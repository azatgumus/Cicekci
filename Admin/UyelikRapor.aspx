<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="UyelikRapor.aspx.cs" Inherits="Cicekci.Admin.UyelikRapor" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div id="centerColumn">
        <table>
            <tr>
                <td>Kullanıcı Adı</td>
                <td>
                    <asp:TextBox runat="server" ID="txtUsername"></asp:TextBox></td>
                <td>Email</td>
                <td>
                    <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox></td>
                <td>
                    <asp:Button runat="server" CssClass="btnSite" OnClick="FilterClick" Text="Rapor Al" /></td>
                <td>
                    <asp:Button runat="server" CssClass="btnSite" OnClick="ExportGridToPDF" Text="PDF" /></td>
            </tr>

        </table>
        <br />
        <asp:GridView CssClass="mGrid" AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="true" GridLines="Vertical" runat="server" ID="grdUye" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField DataField="KullaniciAdi" HeaderText="Kullanici Adi" />
                <asp:BoundField DataField="Email" HeaderText="Eposta" />
                <asp:BoundField DataField="KayitTarihi" HeaderText="Kayit Tarihi" />
                <asp:BoundField DataField="SonGirisTarihi" HeaderText="Son Giris" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
