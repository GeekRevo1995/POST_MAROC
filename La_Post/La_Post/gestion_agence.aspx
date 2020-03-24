<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="gestion_agence.aspx.cs" Inherits="La_Post.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
   <div class="agence_form_content">
     <div class="agence_left_form">
        <div class="input">
          <span class="lbl">Code Agence</span>
          <input type="text" ID="code_agence" class="agence_input" required runat=server/>
        </div>
        <div class="input">
          <span class="lbl">Rezeau Agence</span>
          <input type="text" ID="rezeau_agence" class="agence_input" required runat=server/>
        </div>
        <div class="input">
          <span class="lbl">Commun Agence</span>
          <input type="text" ID="commun_agence" class="agence_input" required runat=server/>
        </div>
        <div class="input">
          <span class="lbl">Province Agence</span>
          <input type="text" ID="province_agence" class="agence_input" required runat=server/>
        </div>
        <div class="input">
          <span class="lbl">Nom Region Agence</span>
          <input type="text" ID="nom_region_agence" class="agence_input" required runat=server/>
        </div>
         <div class="input">
          <span class="lbl">Adress Agence</span>
          <input type="text" ID="adresse_agence" class="agence_input" required runat=server/>
        </div>
      <asp:UpdatePanel runat="server" ID="panal_btn_ajouter">
       <ContentTemplate>
        <asp:Button runat="server" ID="ajouter_agence" Text="AJOUTER AGENCE" 
             class="btn_primary btn" onclick="ajouter_agence_Click"/>
       </ContentTemplate>
      </asp:UpdatePanel>
     </div>
     <div class="agence_right_form">
   
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
       <div class="dropdow_group">
       <div class="dropdown_region">
        <span class="lbl">Select Region</span>
        <asp:DropDownList ID="drp_region" CssClass="drpdown_style" runat=server AutoPostBack="true" 
               CausesValidation=false onselectedindexchanged="drp_region_SelectedIndexChanged"> </asp:DropDownList>
        </div>
        <div class="dropdown_province">
        <span class="lbl">Select Province</span>
        <asp:DropDownList ID="drp_province" runat=server CssClass="drpdown_style" 
                AutoPostBack="true" CausesValidation=false> </asp:DropDownList>
        </div>
          <div class="dropdown_status">
        <span class="lbl">Select Status</span>

        <asp:DropDownList ID="drp_status" runat="server" CssClass="drpdown_style" 
                AutoPostBack="true" CausesValidation=false 
                  >
           <asp:ListItem Value="true">Active</asp:ListItem>
           <asp:ListItem Value="false">Inactive</asp:ListItem>         
        </asp:DropDownList>
               
        </div>
        </div> 

        <div class="new-div" style="margin: 80px 0"><table id="hor_zebra" runat="server"><thead><tr>
        <th>CODE AGNENCE</th><th>REGION AGENCE</th><th>PROVINCE</th><th>ADRESSE</th><th>ACTIVE</th></tr></thead><tbody><tr class="footerTable"><td colspan="5">
        <label>Aucune agence trouvé.</label><br></td></tr></tbody></table><div class="ambre"></div></div>

        <asp:GridView runat="server" ID="list_agences" AllowPaging="True" CellPadding="15" 
              BorderStyle=None PageSize="6" 
              style="margin-right: 0px" AutoGenerateColumns="False" GridLines=Horizontal ForeColor=Black
              DataKeyNames="CODE_AGENCE" DataSourceID="SqlDataSource1" BorderWidth="1px" 
              BorderColor="#CCCCCC" BackColor="White"  >
            <Columns>
                <asp:CommandField CancelText="Annuler" EditText="Modifier" 
                    ShowEditButton="True" UpdateText="Enregistrer" />
                <asp:BoundField DataField="CODE_AGENCE" HeaderText="CODE_AGENCE" 
                    ReadOnly="True" SortExpression="CODE_AGENCE" />
                <asp:BoundField DataField="RESEAU" HeaderText="RESEAU" 
                    SortExpression="RESEAU" />
                <asp:BoundField DataField="NOM_REGION" HeaderText="NOM_REGION" 
                    SortExpression="NOM_REGION" ReadOnly="True" />
                <asp:BoundField DataField="PROVINCE" HeaderText="PROVINCE" 
                    SortExpression="PROVINCE" ReadOnly="True" />
                <asp:BoundField DataField="ADRESSE" HeaderText="ADRESSE" 
                    SortExpression="ADRESSE" ReadOnly="True" />
                <asp:CheckBoxField DataField="STATUE" HeaderText="STATUE" 
                    SortExpression="STATUE" />
            </Columns>
            <FooterStyle BackColor="#272262" ForeColor="white" />
            <HeaderStyle BackColor="#272262" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#272262" ForeColor="white" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="black" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
         </asp:GridView> 
          
         
          
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:EFF_2016ConnectionString %>" 
              SelectCommand="SELECT [CODE_AGENCE], [RESEAU], [NOM_REGION], [PROVINCE], [ADRESSE], [STATUE] FROM [agences] WHERE (([PROVINCE] = @PROVINCE) AND ([STATUE] = @STATUE))" 
              UpdateCommand="UPDATE [agences] SET [RESEAU] = @RESEAU ,[STATUE] = @STATUE WHERE [CODE_AGENCE] = @CODE_AGENCE">
              
            
              <SelectParameters>
                  <asp:ControlParameter ControlID="drp_province" Name="PROVINCE" 
                      PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="drp_status" Name="STATUE" 
                      PropertyName="SelectedValue" Type="Boolean" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="CODE_AGENCE" Type="Int32" />
              </UpdateParameters>
          </asp:SqlDataSource>
          
         
          
        </ContentTemplate>
        </asp:UpdatePanel>
       
     </div>
   </div>
</asp:Content>
