<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KategoriEdition.aspx.cs" MasterPageFile="~/Admin/Admin.Master" Inherits="Cicekci.Admin.KategoriEdition" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <br />
    <br />
    <div id="centerColumn">
        <div style="text-align: left; padding: 2em 1.5em 2em; height: 100%; width: 10em; position: relative; float: left;">
        </div>
        <asp:Label runat="server" ID="lblMessage"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" AllowSorting="true"
            OnRowCommand="gridSample_RowCommand"
            GridLines="Vertical"
             Width="100%"
            AlternatingRowStyle-BackColor="#99ff99"
            DataKeyNames="Id" CellPadding="4" ForeColor="#333333"
            OnRowCancelingEdit="gridSample_RowCancelingEdit"
            OnRowEditing="gridSample_RowEditing"
            OnRowUpdating="gridSample_RowUpdating"
            OnRowDeleting="gridSample_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <%--<AlternatingRowStyle BackColor="White" />--%>
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


                <asp:TemplateField HeaderText="KategoriAdı">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtKategoriAdı" runat="server" Text='<%# Bind("Ad") %>' CssClass="" MaxLength="30"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblKategoriAdı" runat="server" Text='<%# Bind("Ad") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtYeniKategoriAdı" runat="server" CssClass="" MaxLength="30"></asp:TextBox>
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
