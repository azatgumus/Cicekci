<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cicekci.Admin.Default" MasterPageFile="~/Admin/Admin.Master"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <div style="text-align: left; padding: 2em 1.5em 2em; height: 100%; width: 12em; position: relative; float: left;">
        <h4>Kategoriler</h4>
        <asp:ListView ID="ListView_Ürün_Menu" runat="server"
            DataKeyNames="Id">
            <EmptyDataTemplate>Ürün Yok.</EmptyDataTemplate>
            <ItemSeparatorTemplate></ItemSeparatorTemplate>
            <ItemTemplate>
                <li>
                    <a href='<%# VirtualPathUtility.ToAbsolute("~/Admin/Default.aspx?KategoriId=" + Eval("Id")) %>'><%# Eval("Ad") %></a>
                </li>
            </ItemTemplate>

            <LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div style="text-align: left; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;"></div>
            </LayoutTemplate>
        </asp:ListView>
    </div>

    <div id="centerColumn">
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" AllowSorting="true"
            OnRowCommand="gridSample_RowCommand"
            Width="100%"
            DataKeyNames="Id" CellPadding="4" ForeColor="#333333"
            GridLines="None" OnRowCancelingEdit="gridSample_RowCancelingEdit"
            OnRowEditing="gridSample_RowEditing"
            OnRowUpdating="gridSample_RowUpdating"
            OnRowDeleting="gridSample_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <AlternatingRowStyle BackColor="#99ff99" />
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Düzenle"
                            CommandArgument=''><img  src="~/Styles/Resimler/edit32.png" alt="Düzenle" runat="server"/></asp:LinkButton>
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="" CommandName="Delete"
                            ToolTip="Sil" OnClientClick='return confirm("Silmek istediğine emin misin?");'
                            CommandArgument=''><img src="~/Styles/Resimler/delete32.png" runat="server" alt="Sil" /></asp:LinkButton>
                    </ItemTemplate>


                    <EditItemTemplate>
                        <div style="float: right; position: relative;">
                            <asp:LinkButton ID="lnkInsert" runat="server" Text="" ValidationGroup="editGrp" CommandName="Update" ToolTip="Save"
                                CommandArgument=''><img src="~/Styles/Resimler/save32.png" runat="server" alt="Kaydet" /></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="Cancel" ToolTip="İptal"
                                CommandArgument=''><img src="~/Styles/Resimler/cancel32.png" runat="server" alt="İptal" /></asp:LinkButton>
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:LinkButton ID="lnkInsert" runat="server" Text="" ValidationGroup="newGrp" CommandName="InsertNew" ToolTip="Add New Entry"
                            CommandArgument=''><img src="~/Styles/Resimler/add32.png" runat="server" alt="Insert" /></asp:LinkButton>
                        <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="CancelNew" ToolTip="İptal"
                            CommandArgument=''><img src="~/Styles/Resimler/cancel32.png" runat="server" alt="İptal"/></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ürün Adı">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUrunAdi" runat="server" Text='<%# Bind("Ad") %>' CssClass="" MaxLength="30"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblUrunAdi" runat="server" Text='<%# Bind("Ad") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtYeniUrunAdi" runat="server" CssClass="" MaxLength="30"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ürün Resmi">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="70px" ImageUrl='<%# Eval("Resim","~/ÜrünKatalog/kucuk/{0}") %>' Width="80" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="BirimFiyat">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBirimFiyat" runat="server" Text='<%#Bind("BirimFiyat") %>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBirimFiyat" runat="server" Text='<%#Bind("BirimFiyat") %>'>
                        </asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtYeniBirimFiyat" runat="server"></asp:TextBox>
                    </FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAciklama" runat="server" Text='<%#Bind("Aciklama") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAciklama" runat="server" Text='<%#Bind("Aciklama") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtYeniAciklama" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Popüler Ürün">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPopuler" runat="server" Text='<%# Bind("CokSatan") %>' CssClass="" MaxLength="30"></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <input type="checkbox" disabled="disabled"
                            <%# Convert.ToBoolean(Eval("CokSatan")) ? "checked" : string.Empty %>  />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox ID="chkYeniPopuler" runat="server" CssClass="" MaxLength="30"></asp:CheckBox>
                    </FooterTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Kampanyalı Ürün">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkKampanyali" runat="server" Text='<%# Bind("Kampanyali") %>' CssClass="" MaxLength="30"></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <input type="checkbox" disabled="disabled"
                            <%# Convert.ToBoolean(Eval("Kampanyali")) ? "checked" : string.Empty %>  />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox ID="chkYeniKampanyali" runat="server" CssClass="" MaxLength="30"></asp:CheckBox>
                    </FooterTemplate>
                </asp:TemplateField>

            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#145A32" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#145A32" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

    </div>

</asp:Content>
