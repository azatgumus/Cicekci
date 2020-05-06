<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopülerÜrünler.ascx.cs" Inherits="Cicekci.Kontroller.PopülerÜrünler" %>
<%@ OutputCache Duration="3600" VaryByParam="None" %>
<div class="MostPopularHead">Haftanın en çok satan ürünleri</div>
<div id="PanelPopularItems" runat="server">
    <asp:Repeater ID="RepeaterItemsList" runat="server">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <%-- <asp:Image runat="server" Width="255" Height="280"  ImageUrl='<%# VirtualPathUtility.ToAbsolute("~/ÜrünKatalog/AnaSayfa/" + Eval("Resim")) %>'/>
           <a class='MostPopularItemText' href='ÜrünDetayı.aspx?ÜrünId=<%# Eval("Id") %>'><%# Eval("Ad") %></a>
          <br />--%>

            <style>
                .products__item-inner {
                    background-color: #fff;
                    position: relative;
                }
            </style>

            <div class="products__item-inner">
                <a class="products__item-link js-similar-product-link" data-sequence="1" data-category="Çiçek" data-productcode="at192-1"
                    itemscope="isSmilarTo" href="beyaz-phalaenopsis-orkide?OM.zn=FavCatTopSellers&amp;OM.zpc=at192-1&amp;sitesource=1">
                    <div class="products__item-img-container ratio-container">
                        <span class="products__favorite-icon js-favorite-add" data-product-id="321">
                            <span class="icon-favorite-border"></span></span>
                        <img class="products__item-img lazyloaded" data-src='<%# VirtualPathUtility.ToAbsolute("~/ÜrünKatalog/AnaSayfa/" + Eval("Resim")) %>' src='<%# VirtualPathUtility.ToAbsolute("~/ÜrünKatalog/AnaSayfa/" + Eval("Resim")) %>' alt="Phalaenopsis Orkide Çiçeği" width="255" height="280">
                    </div>
                    <div class="products__item-info">
                        <div class="products__item-details">
                            <span class="products__item-title"><%#Eval("Ad") %></span>
                            <%--  <div class="products__item-badge products__item-badge--all-region js-products-bagde-all">
                                <span class="products__item-badge-text">Her Gün Aynı Gün / Ücretsiz Teslimat</span>
                            </div>--%>
                            <div class="products__item-price">
                                <div class="price price--now"><%#Eval("BirimFiyat")%> &#8378;</div>

                                <%-- <div class="price__left ">
                                        <span class="price__integer-value">79</span>
                                    </div>
                                    <div class="price__right">
                                        <span class="price__decimal-value-with-currency">,99 TL</span>

                                    </div>--%>
                            </div>
                        </div>
                    </div>
                    <%--  <div class="products-stars">
                        <div class="products-stars__dropdown-evaluation">
                            <div class="products-stars__icon-wrapper">
                                <span class="icon-star-fill products-stars__icon "></span>

                            </div>
                            <div class="products-stars__icon-wrapper">
                                <span class="icon-star-fill products-stars__icon "></span>

                            </div>
                            <div class="products-stars__icon-wrapper">
                                <span class="icon-star-fill products-stars__icon "></span>

                            </div>
                            <div class="products-stars__icon-wrapper">
                                <span class="icon-star-fill products-stars__icon "></span>

                            </div>
                            <div class="products-stars__icon-wrapper">
                                <span class="icon-star-fill products-stars__icon is-passive"></span><span class="icon-star-fill products-stars__icon icon-half"></span>

                            </div>
                            <%--<span class="products-stars__review-count">(999+)</span>--%>
            </div>
            <div class="clearfix"></div>

            <div class="products__subscription-price-wrapper"></div>
            </a>
            </div>

        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </asp:Repeater>
</div>
