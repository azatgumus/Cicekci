<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Satis.aspx.cs" MasterPageFile="~/Admin/Admin.Master" Inherits="Cicekci.Admin.Satis" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div id="centerColumn">
        <%-- <div style="text-align: left; padding: 2em 1.5em 2em; height: 100%; width: 10em; position: relative; float: left;">
        </div>--%>
        <asp:GridView runat="server" ID="grdSatis" AutoGenerateColumns="false" Width="100%" CssClass="display">
            <Columns>
                <asp:BoundField DataField="SiparisTarihi" HeaderText="Sipariş Tarihi" />
                <asp:BoundField DataField="FaturaAdSoyad" HeaderText="Müşteri Adı" />
                <asp:BoundField DataField="SiparisTutari" HeaderText="Sipariş Tutarı" />
            </Columns>
        </asp:GridView>
    </div>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <link href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.html5.min.js"></script>
    <script src="js/jquery-3.4.1.min.js"></script>
     
    <script>
        $(function () {
            $.ajax({
                type: "POST",
                url: "Satis.aspx/GetSiparisler",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        });
        function OnSuccess(response) {
            $("[id*=grdSatis]").DataTable(
                {
                    buttons: [
                        'pdf'
                    ],
                    //bLengthChange: true,
                    //lengthMenu: [[5, 10, -1], [5, 10, "All"]],
                    //bFilter: true,
                    //bSort: true,
                    //bPaginate: true,
                    data: response.d,
                    columns: [{ 'data': 'SiparisTarihi' },
                    { 'data': 'FaturaAdSoyad' },
                    { 'data': 'SiparisTutari' }],
                });
        };
    </script>
</asp:Content>

