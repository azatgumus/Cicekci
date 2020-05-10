<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiparişKayıt.aspx.cs" Inherits="Cicekci.Çıkış" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <%-- <div id="CheckOutHeader" runat="server" class="ContentHead">
        Gözden Geçir ve Siparişini Ver
    </div>--%>
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
    <%--<asp:Literal runat="server"></asp:Literal>--%>

    <asp:GridView ID="Listem" runat="server" AutoGenerateColumns="false" ShowFooter="true"
        GridLines="Vertical"
        CssClass="mGrid"
        PagerStyle-CssClass="pgr"
        AlternatingRowStyle-CssClass="alt"
        CellPadding="4"
        OnRowDataBound="Listem_RowDataBound">

        <Columns>
             <asp:BoundField DataField="Id" HeaderText="Ürün ID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="Sıra No">
                <ItemTemplate>
                    <span>
                        <%#Container.DataItemIndex + 1%>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="BirimFiyat" HeaderText="Birim Fiyat" ReadOnly="True"
                SortExpression="BirimFiyat" DataFormatString="{0:c}" />
            <asp:BoundField DataField="Miktar" HeaderText="Miktar" ReadOnly="True"
                SortExpression="Miktar" />
            <asp:TemplateField>
                <HeaderTemplate>Ürün Tutarı</HeaderTemplate>
                <ItemTemplate>
                    <%# (Convert.ToDouble(Eval("Miktar")) * Convert.ToDouble(Eval("BirimFiyat")))%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="CartListFooter" />
        <HeaderStyle CssClass="CartListHead" />
    </asp:GridView>

    <asp:Panel ID="SiparişTamamlama" runat="server">

        <table>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Ödeme şekliniz:"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="ÖdemeŞekli" Text="Kredi kartı" onclick="Radio1_Click()" /></td>
                            <td>
                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="ÖdemeŞekli" Text="Kapıda Ödeme" onclick="Radio2_Click()" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>KartNo:</td>
                            <td>
                                <asp:TextBox ID="txtKartNo" TextMode="Number" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="KartNoGerekli" runat="server" ControlToValidate="txtKartNo"
                                    CssClass="failureNotification" ErrorMessage="Kart-no gerekli." ToolTip="Kartno gerekli." />
                            </td>
                        </tr>
                        <tr>
                            <td>Son Kullanma Tarihi Yıl:</td>
                            <td>
                                <asp:DropDownList ID="ddlYil" runat="server">
                                    <asp:ListItem Text="2024" />
                                    <asp:ListItem Text="2023" />
                                    <asp:ListItem Text="2022" />
                                    <asp:ListItem Text="2021" />
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td>Son Kullanma Tarihi Ay:</td>
                            <td>
                                <asp:DropDownList ID="ddlAy" runat="server">
                                    <asp:ListItem Text="01" />
                                    <asp:ListItem Text="02" />
                                    <asp:ListItem Text="03" />
                                    <asp:ListItem Text="04" />
                                    <asp:ListItem Text="05" />
                                    <asp:ListItem Text="06" />
                                    <asp:ListItem Text="07" />
                                    <asp:ListItem Text="08" />
                                    <asp:ListItem Text="09" />
                                    <asp:ListItem Text="10" />
                                    <asp:ListItem Text="11" />
                                    <asp:ListItem Text="12" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>CVV:</td>
                            <td>
                                <asp:TextBox runat="server" ID="txtCvv" TextMode="Number" MaxLength="3" />
                            </td>
                            <td>
                                 <asp:RequiredFieldValidator ID="CVVValidator" runat="server" ControlToValidate="txtCvv"
                                    CssClass="failureNotification" ErrorMessage="Cvv gerekli." ToolTip="Cvv gerekli." />
                            </td>
                        </tr>
                        <tr>
                            <td>Kart Sahibi Ad Soyad:</td>
                            <td>
                                <asp:TextBox ID="txtKartAdSoyad" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="KartAdSoyadValidator" runat="server" ControlToValidate="txtKartAdSoyad"
                                    CssClass="failureNotification" ErrorMessage="Kart Ad Soyad Gerekli." ToolTip="Kart Ad Soyad Gerekli." />
                            </td>
                        </tr>
                    </table>
                </td>

                <td>
                    <table>
                        <tr>
                            <td>Fatura Ad Soyad:</td>
                            <td>
                                <asp:TextBox ID="txtAdSoyad" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAdSoyad"
                                    CssClass="failureNotification" ErrorMessage="Ad Soyad gerekli." ToolTip="Ad Soyad gerekli." />
                            </td>
                        </tr>
                        <tr>
                            <td>Fatura Adres:</td>
                            <td>
                                <asp:TextBox ID="txtAdres" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAdres"
                                    CssClass="failureNotification" ErrorMessage="Adres gerekli." ToolTip="Adres gerekli." />
                            </td>
                        </tr>
                        <tr>
                            <td>Telefon No:</td>
                            <td>
                                <asp:TextBox ID="txtTelefonNo" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefonNo"
                                    CssClass="failureNotification" ErrorMessage="Telefon Numarası gerekli." ToolTip="Telefon Numarası gerekli." />
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                    CssClass="failureNotification"  ErrorMessage="Email adresi gerekli." ToolTip="Email adresi gerekli." />
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>



        </table>

        <asp:Button runat="server" ID="Gönder" OnClick="Gönder_Click" Text="Sipariş Oluştur" Width="150" ForeColor="White" Height="50" BackColor="#145A32" />

        <asp:Label ID="Label3" runat="server"></asp:Label>

    </asp:Panel>

    <br />
    <script type="text/javascript">    
        function Radio2_Click() {
            var textBox = document.getElementById("<%=txtKartNo.ClientID %>");
            var ddlYil = document.getElementById("<%=ddlYil.ClientID %>");
            var ddlAy = document.getElementById("<%=ddlAy.ClientID %>");
            var cvv = document.getElementById("<%=txtCvv.ClientID %>");
            var kartAd = document.getElementById("<%=txtKartAdSoyad.ClientID %>");


            kartAd.value = "";
            kartAd.disabled = true;
            cvv.value = "";
            cvv.disabled = true;
            ddlAy.value = "";
            ddlAy.disabled = true;
            ddlYil.value = "";
            ddlYil.disabled = true;
            textBox.value = "";
            textBox.disabled = true;
            ValidatorEnable(document.getElementById("<%=KartNoGerekli.ClientID %>"), false);
            ValidatorEnable(document.getElementById("<%=KartAdSoyadValidator.ClientID %>"), false);
            ValidatorEnable(document.getElementById("<%=CVVValidator.ClientID %>"), false);
            
           <%-- ValidatorEnable(document.getElementById("<%=KartNoGerekli.ClientID %>"), false);
            ValidatorEnable(document.getElementById("<%=KartNoGerekli.ClientID %>"), false);
            ValidatorEnable(document.getElementById("<%=KartNoGerekli.ClientID %>"), false);--%>
        }
        function Radio1_Click() {
            var textBox = document.getElementById("<%=txtKartNo.ClientID %>");
            var ddlYil = document.getElementById("<%=ddlYil.ClientID %>");
            var ddlAy = document.getElementById("<%=ddlAy.ClientID %>");
            var cvv = document.getElementById("<%=txtCvv.ClientID %>");
            var kartAd = document.getElementById("<%=txtKartAdSoyad.ClientID %>");

            textBox.disabled = false;
            ddlYil.disabled = false;
            ddlAy.disabled = false;
            cvv.disabled = false;
            kartAd.disabled = false;
        }
    </script>
</asp:Content>
