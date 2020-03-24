<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="consultation.aspx.cs" Inherits="La_Post.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="margin-top:50px">

    <asp:DropDownList runat="server" CssClass="drpdown_style" ID="CodeAgence" AutoPostBack="true">
    </asp:DropDownList>

   <span class="date_input"> Date debut</span>
    <input class="au_input date_input" type="text" runat="server" id="DateInitial" readonly="readonly" />
       <i class="fa fa-calendar date_input" id="Image2" aria-hidden="true"></i>

 <span class="date_input">Date Fin</span>
<input class="au_input date_input" type="text" runat="server" id="DateFinal" readonly="readonly" />
      <i class="fa fa-calendar date_input" id="Image1" aria-hidden="true"></i>

         <asp:ImageButton runat="server" ImageUrl="recherche.png" 
        style="position: relative;top: 19px; margin-left:0" CssClass="recherche_btn" CausesValidation="false"
               ID="Button1" onclick="Button1_Click">
        </asp:ImageButton> 
</div>
    <asp:GridView ID="GridView_listClient" runat="server"
    CellPadding="8" 
              BorderStyle=None PageSize="6" 
              style="margin-right: 0px;margin-top: 100px"  GridLines=Horizontal ForeColor=Black
               BorderWidth="1px"  
              BorderColor="#CCCCCC" BackColor="White"
    >

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


        <div class="new-div" style="margin-top:100px ; padding-bottom:100px"><table class="" id="hor_zebra" visible="false" runat="server"><thead><tr>
        <th>Type de client </th><th>Appelation</th><th> Email </th><th>Tele</th><th>adresse</th><th>libelle_identite</th><th>identite</th><th>Identite</th><th>Contrat</th><th> Status</th></tr></thead><tbody><tr class="footerTable"><td colspan="10">
        <label>Aucune client enregistrer entre cette date trouvé .</label><br></td></tr></tbody></table><div class="ambre"></div></div>
  
  <!--------------- script calnder -------------------->

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=DateInitial.ClientID %>").dynDateTime({
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
            $("#<%=DateInitial.ClientID %>").dynDateTime({
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
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=DateFinal.ClientID %>").dynDateTime({
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
            $("#<%=DateFinal.ClientID %>").dynDateTime({
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
