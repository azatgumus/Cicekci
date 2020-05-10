<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ÜrünDetayı.aspx.cs" Inherits="Cicekci.ÜrünDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id">
        <ItemTemplate>
            <div class="ContentHead"><%# Eval("Ad") %></div>
            <br />
            <table  style="border-style: outset;">
                <tr>
                    <td>
                        <img src='ÜrünKatalog/Buyuk/<%# Eval("Resim") %>' border="0" alt='<%# Eval("Ad") %>' />
                    </td>
                </tr>

                <tr style="text-align: center">
                    <td>
                        <a href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>' style="color: #2fa4e7">
                            <%#:Eval("Ad")%>
                            </a>
                        <br />
                        <span>
                            <b>Fiyat: </b><%# Eval("BirimFiyat", "{0:c}")%>
                            </span>
                        <br />
                        <asp:Button runat="server" Text="Sepete Ekle" Width="150" ForeColor="White" Height="50" BackColor="#145A32" PostBackUrl='<%# String.Format("sepeteekle.aspx?ÜrünId={0}",Eval("Id")) %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                     <%# Eval("Aciklama") %>
                    </td>
                  
                </tr>
            </table>


            <br />
            <br />
            <div class="SubContentHead">Yorumlar</div>
            <br />
            <a id="ReviewList_AddReview" href="YorumEkle.aspx?ürünID=<%# Eval("Id") %>">Bu ürün için yorum yap.
        </a>
        </ItemTemplate>
    </asp:FormView>

    <asp:ListView ID="ListView_Yorumlar" runat="server"
        DataKeyNames="Id,UrunId,Derecelendirme">
        <ItemTemplate>
            <tr>
                <td><%# Eval("MusteriAd") %></td>
                <td>
                    <img src='Styles/Resimler/star<%# Eval("Derecelendirme") %>.jpg' alt="">
                </td>
                <td>
                    <%# Eval("Yorum1") %>
      </td>

            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr>
                <td><%# Eval("MusteriAd") %></td>
                <td>
                    <img src='Styles/Resimler/star<%# Eval("Derecelendirme") %>.jpg' alt="">
                </td>
                <td><%# Eval("Yorum1") %></td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server">
                <tr>
                    <td>Bu ürün için henüz yorum yapılmamış.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1">
                            <tr runat="server">
                                <th runat="server">Müşteri</th>
                                <th runat="server">Derecelendirme</th>
                                <th runat="server">Yorumlar</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button"
                                    ShowFirstPageButton="True"
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:EntityDataSource ID="EDS_YorumListesi" runat="server" EnableFlattening="False"
        AutoGenerateWhereClause="True"
        EntityTypeFilter=""
        Select="" Where=""
        ConnectionString="name=CicekEntities"
        DefaultContainerName="CicekEntities"
        EntitySetName="Yorum">
        <WhereParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="Id"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
