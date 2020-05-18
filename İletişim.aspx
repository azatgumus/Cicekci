<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="İletişim.aspx.cs" Inherits="Cicekci.İletişim" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <center>
        <h3>
            <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
        </h3>
    </center>
    <br />
    <table>
        <tr>
            <td style="text-align: right;">Ad : </td>
            <td><asp:TextBox ID="TextBoxAd" runat="server" Width="500px" OnTextChanged="TextBoxYourName_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right;">Email : </td>
            <td><asp:TextBox ID="TextBoxEmail" runat="server" Width="500px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right;">Konu : </td>
            <td><asp:TextBox ID="TextBoxKonu" runat="server" Width="500px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style=" vertical-align: top; text-align: right;">Message : </td>
            <td>
                <cc1:Editor ID="Editor1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style=" vertical-align: top; text-align: right;">&nbsp;</td>

            <td>
              
                <asp:Button ID="Button1" runat="server" Text="Gönder" OnClick="Gonder" />
            </td>
        </tr>
    </table>
</asp:Content>
