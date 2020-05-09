<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ÜrünListesi.aspx.cs" Inherits="Cicekci.ÜrünListesi" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="ListView1" runat="server"
        DataKeyNames="Id" GroupItemCount="4">
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
            <td runat="server" >
                <table>
                    <tr>
                        <td>
                            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>'>
                                <image src='ÜrünKatalog/Kucuk/<%# Eval("Resim") %>'
                                    width="100" height="75" border="1" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>' style="color: #2fa4e7">
                                <%#:Eval("Ad")%>
                            </a>
                            <br />
                            <span>
                                <b>Fiyat: </b><%# Eval("BirimFiyat", "{0:c}")%>
                            </span>
                            <br />
                            <a href='SepeteEkle.aspx?ÜrünId=<%# Eval("Id") %>'>
                                <span style="color: #2fa4e7">
                                    <b>Sepete Ekle<b>
                                        </span>
                            </a>
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
