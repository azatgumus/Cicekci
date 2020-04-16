<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KategoriEdition.aspx.cs" Inherits="Cicekci.Admin.KategoriEdition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <a runat="server" href="~/Admin/Default.aspx"><img  src="~/Styles/Resimler/arrow_left.png" runat="server" alt="ÜrünGüncelle"/>ÜrünGüncelle</a>  
        <br />
        <br />
    <div id="centerColumn">
        <asp:Label runat="server"  ID="lblMessage"></asp:Label>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True"  AllowSorting="true"
              
                        CssClass="grid" OnRowCommand="gridSample_RowCommand" 
        DataKeyNames="KategoriID" CellPadding="4" ForeColor="#333333"
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
                          
                              
                            <asp:TemplateField HeaderText="KategoriAdı">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtKategoriAdı" runat="server" Text='<%# Bind("KategoriAdı") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblKategoriAdı" runat="server" Text='<%# Bind("KategoriAdı") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtYeniKategoriAdı" runat="server" CssClass=""  MaxLength="30"></asp:TextBox>
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
