<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cicekci.Admin.Default"
     MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
       <div id="leftColumn">
            <a runat="server"   href="~/Default.aspx"><img   runat="server" title="Anasayfa" alt="Anasayfa" src="~/Styles/Resimler/house.png"/></a>
           <br />
           <br />
			<h3>Ürünlerimiz</h3>
           <li>
           <a href="~/Admin/Default.aspx?KategoriId=-1" runat="server">Tüm ürünler</a>
               </li>
            <asp:ListView ID="ListView_Ürün_Menu" runat="server" 
                DataKeyNames="Id" DataSourceID="EDS_Kategori_Menu">
                <EmptyDataTemplate>Ürün Yok.</EmptyDataTemplate>
                <ItemSeparatorTemplate></ItemSeparatorTemplate>
                <ItemTemplate>
                    <li>
                       <a href='<%# VirtualPathUtility.ToAbsolute("~/Admin/Default.aspx?KategoriId=" + Eval("Id")) %>'><%# Eval("Ad") %></a>
                    </li>
                </ItemTemplate>               
                
                <LayoutTemplate>
                    <ul ID="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="text-align: left;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></div>
                </LayoutTemplate>
            </asp:ListView>
           <li>
           <a href="~/Admin/KategoriEdition.aspx" runat="server">Kategori Güncelle</a>
               </li>

            <asp:EntityDataSource ID="EDS_Kategori_Menu" runat="server" EnableFlattening="False" 
                                  ConnectionString="name=CicekEntities" DefaultContainerName="CicekEntities" EntitySetName="Kategori">
            </asp:EntityDataSource>
           </div>
        
        <div id="centerColumn">
           
            <br />
        &nbsp;<asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>  
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True"  AllowSorting="true"
              
                        CssClass="grid" OnRowCommand="gridSample_RowCommand" 
        DataKeyNames="ÜrünID" CellPadding="4" ForeColor="#333333"
                        GridLines="None" OnRowCancelingEdit="gridSample_RowCancelingEdit" 
                        OnRowEditing="gridSample_RowEditing" 
        OnRowUpdating="gridSample_RowUpdating" 
        
        onrowdeleting="gridSample_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                 <ItemTemplate>
                                  <asp:LinkButton  ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Düzenle"  
                                        CommandArgument=''><img  src="~/Styles/Resimler/application_edit.png" alt="Düzenle" runat="server"/></asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="" CommandName="Delete" 
                                        ToolTip="Sil" OnClientClick='return confirm("Silmek istediğine emin misin?");'
                                        CommandArgument=''><img src="~/Styles/Resimler/delete.png" runat="server" alt="Sil" /></asp:LinkButton>
                                        </ItemTemplate>
                                  
                              
                                <EditItemTemplate>
                                    <div style="float:right; position:relative;">
                                    <asp:LinkButton ID="lnkInsert"  runat="server" Text="" ValidationGroup="editGrp" CommandName="Update" ToolTip="Save"
                                        CommandArgument=''><img src="~/Styles/Resimler/save.png" runat="server" alt="Kaydet" /></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="Cancel" ToolTip="İptal"
                                        CommandArgument=''><img src="~/Styles/Resimler/cancel.png" runat="server" alt="İptal" /></asp:LinkButton>
                                
                                        </EditItemTemplate>
                                   
                                <FooterTemplate>
                                    <asp:LinkButton ID="lnkInsert" runat="server" Text=""  ValidationGroup="newGrp" CommandName="InsertNew" ToolTip="Add New Entry"
                                        CommandArgument=''><img src="~/Styles/Resimler/add.png" runat="server" alt="Insert" /></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="CancelNew" ToolTip="İptal"
                                        CommandArgument=''><img src="~/Styles/Resimler/cancel.png" runat="server" alt="İptal"/></asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
                          
                            <asp:TemplateField HeaderText="ModelNo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtModelNo" runat="server" Text='<%# Bind("ModelNumarası") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblModelNo" runat="server" Text='<%# Bind("ModelNumarası") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtYeniModelNo" runat="server" CssClass=""   MaxLength="30"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="ModelAdı">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtModelAdı" runat="server" Text='<%# Bind("ModelAdı") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblModelAdı" runat="server" Text='<%# Bind("ModelAdı") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtYeniModelAdı" runat="server" CssClass=""  MaxLength="30"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField> 

                             <asp:TemplateField HeaderText="ÜrünResmi">
                                <ItemTemplate>              
                      <asp:Image ID="Image1" runat="server" Height="70px" ImageUrl='<%# Eval("ÜrünResmi","~/ÜrünKatalog/{0}") %>' Width="80" />  
                                </ItemTemplate>
                                 <EditItemTemplate>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />    
                                </EditItemTemplate>
                                 <FooterTemplate>
                                <asp:FileUpload  ID="FileUpload2" runat="server"/>
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
                                     <asp:Textbox ID="txtYeniBirimFiyat" runat="server"></asp:Textbox>
                                 </FooterTemplate>

                             </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Tanım">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTanım" runat="server" Text='<%#Bind("Tanım") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTanım" runat="server" Text='<%#Bind("Tanım") %>'></asp:Label>
                                    </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtYeniTanım" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField> 
                                                 
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>

    </div>
        
           
        
       
    </form>
</body>
</html>
