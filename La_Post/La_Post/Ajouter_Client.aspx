<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ajouter_Client.aspx.cs" Inherits="La_Post.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<script type="text/javascript">
    function print_btn_Click() {
        var contents = document.getElementById("panel_print_client");
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

     <div class="client_form_content">
    <fieldset class="field_add_client">
    <legend>Recherche Client</legend> 

      <div class="row" id="dropdown_row">
       <div class="dropdow_group_client">
       <div class="dropdown_region">
        <span class="lbl">Select type identité</span>
        <asp:DropDownList ID="drp_type_identité_recherche" CssClass="drpdown_style" runat="server" AutoPostBack="true" 
               CausesValidation=false >    
        </asp:DropDownList>
        </div>

         <div class="input">
          <span class="lbl">Identité client</span>
          <input type="text" style="margin-top:9px ; margin-left:0 !important" ID="identité_client_recherche" class="client_input" runat=server/>
         </div>

        <asp:ImageButton runat="server" ImageUrl="recherche.png" CssClass="recherche_btn" CausesValidation="false"
               ID="recherche_btn" onclick="recherche_btn_Click">
        </asp:ImageButton>  
       
        </div>
        </div>
          <div class="new-div"><table  class="" id="hor_zebra" runat="server"><thead><tr>
        <th>CODE Client</th><th>Type Client</th><th>Email</th><th>Telephone</th><th>adresse</th><th>Identité</th><th>Contrat</th></tr></thead><tbody><tr id="footerTable" class="footerTable"><td colspan="7">
        <label>Aucune Client trouvé.</label><br></td></tr></tbody></table><div class="ambre"></div></div> 
     <div style="position: relative; right: 13px;">
          <asp:GridView runat="server" ID="list_client" CellPadding="8" 
              BorderStyle=None PageSize="6" 
              style="margin-right: 0px;margin-top: 50px"  GridLines=Horizontal ForeColor=Black
               BorderWidth="1px"  
              BorderColor="#CCCCCC" BackColor="White" 
               onrowediting="list_client_RowEditing" 
              onrowcancelingedit="list_client_RowCancelingEdit" 
              AutoGenerateColumns="False" onrowupdating="list_client_RowUpdating" 
            onrowdatabound="list_client_RowDataBound" AutoGenerateSelectButton="True" onselectedindexchanged="list_client_SelectedIndexChanged" 
              >
               <Columns>
                   <asp:CommandField CancelText="Annuler" EditText="Modifier" 
                       ShowEditButton="True" UpdateText="Enregistrer" CausesValidation="false" />
                   <asp:TemplateField HeaderText="ID_CLient">
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Eval("id_client") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="libelle_identite">
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%#Eval("libelle_identite") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="identite">
                    
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%#Eval("identite") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="libelle_type_client">
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%#Eval("libelle_type_client") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="contrat">
                       <ItemTemplate>
                           <asp:Label ID="lblContrat" runat="server" Text='<%# Eval("contrat") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="appellation">
                     
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%#Eval("appellation") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="email_client">
                  
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%#Eval("email_client") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="telephone_client">
                      
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%#Eval("telephone_client") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="adresse">
                       <ItemTemplate>
                           <asp:Label ID="Label8" runat="server" Text='<%#Eval("adresse") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle Width="200px" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="status">
                       <EditItemTemplate>
                           <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("status") %>'/>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked='<%#Eval("status") %>'/>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
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
        </fieldset>
        </div>
 
         
<div class="client_right_form">
<fieldset class="field_add_client">
    <legend>Gestion Client :</legend>
     <div class="client_left_form">
     <div class="row">
       <div class="dropdown_type_client">
        <span class="lbl">Select Type Client</span>
        <asp:DropDownList ID="drp_type_client" CssClass="drpdown_style_client" runat="server" 
               CausesValidation=false  AutoPostBack="true"
               onselectedindexchanged="drp_type_client_SelectedIndexChanged"> </asp:DropDownList>
        </div>
          <div class="dropdown_type_client">
        <span class="lbl">Select Type Identité</span>
        <asp:DropDownList ID="drp_type_identité" CssClass="drpdown_style_client" runat=server 
               CausesValidation=false> </asp:DropDownList>
        </div>
      <div class="dropdown_type_client">
        <span class="lbl">Contrat</span>
        <asp:DropDownList ID="drp_type_contrat" CssClass="drpdown_style_client" runat=server 
               CausesValidation=false 
              onselectedindexchanged="drp_type_contrat_SelectedIndexChanged">
        </asp:DropDownList>
        </div>
        
        </div>
        <div class="row">
        <div class="input">
          <span class="lbl">Identité client</span>
          <input type="text" ID="identité_client" class="client_input"  runat=server/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="identité_client" Display="Dynamic" 
                ErrorMessage="identité client required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="input">
          <span class="lbl">Appelation client</span>
          <input type="text" ID="appelation" class="client_input"  runat=server/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="appelation" Display="Dynamic" 
                ErrorMessage="appelation required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="input">
          <span class="lbl">Email</span>
          <input type="text" ID="Email_client" class="client_input"  runat=server/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="Email_client" ErrorMessage="email n'est pas valid !!" 
                ForeColor="Red" 
                
                ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" 
                Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="Email_client" Display="Dynamic" 
                ErrorMessage="Email Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

       </div>
       <div class="row">
           <div class="input">
          <span class="lbl">Telephone</span>
          <input type="text" ID="telephone_client" class="client_input"  runat=server/>
               <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="telephone_client" 
                ErrorMessage="numero de telephone non valid" 
                
                ValidationExpression="^\+(?:[0-9]●?){6,14}[0-9]$" 
                ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                   ControlToValidate="telephone_client" Display="Dynamic" 
                   ErrorMessage="Telephone required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
           <div class="input">
          <span class="lbl">Adresse client</span>
          <input type="text" ID="Adresse_client" class="client_input"  runat=server/>
               <br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                   ControlToValidate="Adresse_client" Display="Dynamic" 
                   ErrorMessage="Adresse Required" ForeColor="Red"></asp:RequiredFieldValidator>
           </div> 

           <div class="client_HT_TVA">
              <div class="input">
                <span class="lbl">HT</span>
                <input type="text" ID="input_HT" class="client_input_HT_TVA" readonly="readonly"  runat=server/>
               <br />
             
             </div>
                <div class="input">
                <span class="lbl">TVA</span>
                <input type="text" ID="input_TVA" class="client_input_HT_TVA" readonly="readonly"  runat=server/>
               <br />
          
             </div>  
           </div>

       </div>
       <div class="row">
  
         <asp:Button runat="server" ID="ajouter_client" style="margin-left:30px" Text="AJOUTER CLIENT" 
                     CssClass="btn_primary btn" onclick="ajouter_client_Click" />
         <asp:Button runat="server" ID="modifier_client" style="margin-left:30px" Text="MODIFIER CLIENT" 
                     CssClass="btn_primary btn" onclick="modifier_client_Click" />

                   
         </div>


       </div>
       </fieldset>
      </div>
 <div class="flex_shadow" runat="server" id="flex_shadow">
   <div class="flexbox" runat="server" id="flexbox">  
    
  <div CssClass="print_client" ID="panel_print_client">
      <asp:Label runat="server" style="    position: absolute; color: white; left: 50px;top:20px" BackColor="Transparent" ID="datetime"></asp:Label>
   <center>
            <header class="header_page_print">
            <div class="logo">
            <img src="logo-poste.png" />
            </div>
            </header>
    </center>

    <fieldset class="field_add_client">
    <legend>Information Client :</legend>
     <div class="client_left_form" style="width:100%">

        <div class="row">
        <div class="input_print">
          <span class="lbl">Type Client</span>
             <label runat="server" id="type_client"> </label>
             </div>
        <div class="input_print">
     <span class="lbl"> Type Identité</span>
          <label runat="server" id="type_identité"> </label>
          </div>
 
        <div class="input_print">
     <span class="lbl"> Contrat</span>
                 <label runat="server" id="contrat"> </label>
   
   </div>
   </div>
     
        <div class="row">
        <div class="input_print">
          <span class="lbl">Identité client</span>
            <label runat="server" id="identite_client"> </label>
        </div>
        <div class="input_print">
          <span class="lbl">Appelation client</span>
         
              <label runat="server" id="name_client"> </label>
          </div>
        <div class="input_print">
          <span class="lbl">Email</span>
          
             <label runat="server" id="Email"> </label>
        </div>

       </div>
       <div class="row">
           <div class="input_print">
          <span class="lbl">Telephone</span>
             <label runat="server" id="telephone" > </label>
        </div>
           <div class="input_print">
          <span class="lbl">Adresse client</span>
              <label runat="server" id="adresse"></label>
            </div>
         
           <div class="client_HT_TVA">
              <div class="input_print">
                <span class="lbl">HT</span>
                 <label runat="server" id="Hortax"> </label>
               <br />
             
             </div>
                <div class="input_print">
                <span class="lbl">TVA</span>
                  <label runat="server" id="TVA"> </label>
               <br />
          
             </div>  
           </div>

         </div>  
           <div class="row" style="float: right;margin-top: 15px;margin-right: 50px;">
              <label runat="server" style="padding-right: 40px; font-family: sans-serif;font-size: 14px;"> Signature Chef d'Agence</label>
              <label runat="server" style="font-family: sans-serif;font-size: 14px;"> Signature Client</label>
           </div> 
       </div>
       </fieldset>
      </div>
       <div class="row">
               <asp:ImageButton ID="print_btn" CssClass="print_btn" runat="server" 
                    ImageUrl="~/icon_printer.png" OnClientClick="print_btn_Click();" />
               <asp:LinkButton ID="annuler_btn" Text="ANNULER" runat="server" CausesValidation="false"
                    style="margin:30px 100px;" onclick="annuler_btn_Click"></asp:LinkButton>
       </div>
   </div>
</div>

</asp:Content>
