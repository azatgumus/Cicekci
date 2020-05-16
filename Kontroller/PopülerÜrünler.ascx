<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopülerÜrünler.ascx.cs" Inherits="Cicekci.Kontroller.PopülerÜrünler" %>
<%@ OutputCache Duration="3600" VaryByParam="None" %>
<div class="MostPopularHead">Haftanın En Çok Satan Ürünleri</div>
<div id="PanelPopularItems" runat="server">
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
            <td runat="server" >
                <table style="border-style: outset;">
                    <tr>
                        <td>
                            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>'>
                                <image src='ÜrünKatalog/Kucuk/<%# Eval("Resim") %>'
                                    width="278" height="306" border="1" />
                            </a>
                        </td>
                    </tr>
                    <tr style="text-align:center">
                        <td>
                            <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>' style="color: #2fa4e7">
                                <%#:Eval("Ad")%>
                            </a>
                            <br />
                            <span>
                                <b>Fiyat: </b><%# Eval("BirimFiyat", "{0:c}")%>
                            </span>
                            <br />
                            <asp:Button runat="server" Text="Sepete Ekle" Width="150" ForeColor="White" Height="50" BackColor="#145A32"  PostBackUrl='<%# String.Format("~/sepeteekle.aspx?ÜrünId={0}",Eval("Id")) %>'/>
                           <%-- <a href='SepeteEkle.aspx?ÜrünId=<%# Eval("Id") %>'>
                                <span style="color: #2fa4e7">
                                    <b>Sepete Ekle<b>
                                        </span>
                            </a>--%>
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
</div>
