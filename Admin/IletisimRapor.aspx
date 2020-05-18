<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="IletisimRapor.aspx.cs" Inherits="Cicekci.Admin.IletisimRapor" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div id="centerColumn">
        <table>
            <tr>
                <td>Ad</td>
                <td>
                    <asp:TextBox runat="server" ID="txtAd"></asp:TextBox></td>
                <td>Email</td>
                <td>
                    <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox></td>

                <td>Konu</td>
                <td>
                    <asp:TextBox runat="server" ID="txtKonu"></asp:TextBox></td>
                <td>
                    <asp:Button runat="server" CssClass="btnSite" OnClick="FilterClick" Text="Rapor Al" /></td>
                <td>
                    <asp:Button runat="server" CssClass="btnSite" OnClick="ExportGridToPDF" Text="PDF" /></td>
            </tr>

        </table>
        <br />
        <asp:GridView CssClass="mGrid" AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="true" GridLines="Vertical" runat="server" ID="grdIletisim" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField DataField="Ad" HeaderText="Ad" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Konu" HeaderText="Konu" />
                <asp:BoundField DataField="Mesaj" HeaderText="Mesaj" HtmlEncode="false" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

