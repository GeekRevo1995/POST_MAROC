<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Afficher_Client.aspx.cs" Inherits="La_Post.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<script type="text/javascript">
    function print_btn_Click() {
        var contents = document.getElementById("print_client_changer_adresse");
        var frame1 = document.createElement('iframe');
        frame1.name = "frame1";
        frame1.style.position = "absolute";
        frame1.style.top = "-1000000px";
        document.body.appendChild(frame1);
        var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
        frameDoc.document.open();
        frameDoc.document.write('<html><head><link href="StyleSheet.css" rel="stylesheet" type="text/css">');
        frameDoc.document.write('</head><body onload="window.print()">');
        frameDoc.document.write(contents.innerHTML);
        frameDoc.document.write('</body></html>');
        frameDoc.document.close();
        return false;

    }
</script>

    <h2 style="font-family:Sans-Serif";color:"#272262">Les clients changer l'adresse:</h2>
      Date debut
    <input class="au_input" type="text" style="margin:0 40px;" runat="server" id="DateInitia" readonly="readonly" />
    <i class="fa fa-calendar" id="Image3" aria-hidden="true"></i>

     <asp:ImageButton runat="server" ImageUrl="recherche.png" 
        style="position: relative;top: 19px;" CssClass="recherche_btn" CausesValidation="false"
               ID="recherche_btn_facteur" onclick="recherche_btn_facteur_Click">
        </asp:ImageButton>  

<div id="print_client_changer_adresse">
<h2 style="text-align:center;margin:50px auto;font-family:Sans-Serif">List Client :</h2>
    <asp:GridView runat="server" ID="list_adresse_client" 
    CssClass="list_adresse_client" CellPadding="10" AllowPaging="True" 
        onpageindexchanging="list_adresse_client_PageIndexChanging">
      <FooterStyle BackColor="#272262" ForeColor="white" />
            <HeaderStyle BackColor="#272262" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#272262" ForeColor="white" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="black" />
            <SelectedRowStyle BackColor="#f5f5f5" ForeColor="#000" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
</div>

 <asp:ImageButton ID="print_btn" CssClass="print_btn" runat="server" 
                    ImageUrl="~/icon_printer.png" OnClientClick="print_btn_Click()"/>

    <div class="new-div" style="margin-top:50px;padding-bottom:60px" ><table class="" id="hor_zebra" visible="false" runat="server"><thead><tr>
        <th>APPELATION</th><th>OLD_ADRESSE</th><th>NEW_ADRESSE</th><th>DATE_CHANGEMENT</th></tr></thead><tbody><tr class="footerTable"><td colspan="4">
        <label>Aucune changement trouvé .</label><br></td></tr></tbody></table><div class="ambre"></div></div>



    <!--------------- script calnder -------------------->

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= DateInitia.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d ",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: true,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            $("#<%=DateInitia.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d ",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: true,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
</script>
   
</asp:Content>
