<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ÜrünListesi.aspx.cs" Inherits="Cicekci.ÜrünListesi" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" />
    <asp:ListView ID="ListView1" runat="server"
        DataKeyNames="Id" GroupItemCount="3">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>Ürün yok.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server">
                <table style="border-style: outset; height: 520px">
                    <tr>
                        <td>
                            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>'>
                                <image src='ÜrünKatalog/Kucuk/<%# Eval("Resim") %>'
                                    width="278" height="306" border="1" /></td>
                    </tr>
                    <tr style="text-align: center">
                        <td>
                            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>' style="color: #2fa4e7">
                                <%#:Eval("Ad")%>
                            </a>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td><b>Fiyat: </b><span><%# Eval("BirimFiyat", "{0:c}")%></span></td>
                    </tr>
                    <tr style="text-align: center" runat="server" visible='<%# ((decimal)Eval("KampanyaliFiyat")) == 0 ? false : true %>'>
                        <td>
                            <span style="color: red; font-style: italic">Kampanyalı Fiyat : <%# Eval("KampanyaliFiyat")%></span>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td>
                            <asp:Button runat="server" Text="Sepete Ekle" Width="150" ForeColor="White" Height="50" BackColor="#145A32" PostBackUrl='<%# String.Format("sepeteekle.aspx?ÜrünId={0}",Eval("Id")) %>' />
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </p>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table style="width: 100%;">
                <tbody>
                    <tr>
                        <td>
                            <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                <tr id="groupPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr></tr>
                </tbody>
            </table>
        </LayoutTemplate>

    </asp:ListView>

</asp:Content>
