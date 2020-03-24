<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="ajouter_utilisateur.aspx.cs" Inherits="La_Post.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="au_form_content" runat="server" id="au_form_content">
                <div class="au_left_form">
                    <div class="input">
                        <label class="lbl">
                            Type Utilisateur
                        </label>
                        <asp:DropDownList runat="server" ID="type_utilisateur" AutoPostBack="True" OnSelectedIndexChanged="type_utilisateur_SelectedIndexChanged"
                            ViewStateMode="Enabled">
                        </asp:DropDownList>
                    </div>
                    <div class="input">
                        <label class="lbl">
                            Nom Utilisateur
                        </label>
                        <input class="au_input" type="text" runat="server" id="nom_utilisateur" causesvalidation="True" />
                    </div>
                    <hr />
                    <div class="input">
                        <label class="lbl">
                            Type de mot de passe
                        </label>
                        <asp:DropDownList ID="PasswordLevel" runat="server" OnSelectedIndexChanged="PasswordLevel_SelectedIndexChanged">
                            <asp:ListItem>Moyen</asp:ListItem>
                            <asp:ListItem>Elevé</asp:ListItem>
                            <asp:ListItem>Faible</asp:ListItem>
                            <asp:ListItem>Chiffres seulement</asp:ListItem>
                            <asp:ListItem>Caractères seulement</asp:ListItem>
                            <asp:ListItem>Chiffres et Caractères</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Button class="genererPassword" ID="Button1" runat="server" Text="Générer un password"
                            OnClick="Button1_Click" BackColor="Transparent" CausesValidation="False" />
                        <label class="lbl">
                            Mot de passe
                        </label>
                        <input class="au_input" type="text" runat="server" id="passowrd" />
                    </div>
                    <hr />
                    <div class="input">
                        <label class="lbl" id="lblCodeAgence" runat="server">
                            Code Agence
                        </label>
                        <input class="au_input" type="text" runat="server" id="code_agence" /><br />
                        <br />
                        <asp:Button ID="ShowHideListAgences" class="genererPassword" runat="server" Text="Afficher la liste des agences"
                            OnClick="ShowHideListAgences_Click" />
                    </div>
                    <hr />
                    <asp:Button class="genererPassword" ID="Button2" runat="server" Text="Ajouter" OnClick="Button2_Click"
                        CausesValidation="False" /><br />
                    <br />
                    <label id="message" runat="server" style="color: Red;">
                    </label>
                </div>
                <div class="au_right_form" style="float:left">
                    <asp:GridView ID="MenueAutorise" runat="server" AutoGenerateColumns="False" 
                        CellPadding="15" BorderStyle="None"
                     GridLines="Horizontal" Style="margin-right: 0px" ForeColor="Black"
                        BorderWidth="1px" BorderColor="#CCCCCC" BackColor="White" 
                        onrowcancelingedit="MenueAutorise_RowCancelingEdit" 
                        onrowediting="MenueAutorise_RowEditing" onrowupdating="MenueAutorise_RowUpdating"
                    >
                        <Columns>
                            <asp:CommandField CancelText="Annuler" EditText="Modifier" 
                                ShowEditButton="True" UpdateText="Enregistrer" />
                            <asp:TemplateField HeaderText="Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("code_profile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Titre">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("titre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Statut">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("statut") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server"  Enabled="false" Checked='<%#Eval("statut") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                    <div style="    float: left; margin-left: 100px; margin-top: -10px;">
                    <div class="input">
                        <label class="lbl">
                            Libelle Profile
                        </label>
                        <input class="au_input" type="text" runat="server" id="LibelleProfile" causesvalidation="True" />
                    </div>
                    <asp:GridView ID="ListTitres" runat="server" AutoGenerateColumns="False"  GridLines="Horizontal"
                        Style="margin-right: 0px" ForeColor="Black" BorderWidth="1px" BorderColor="#CCCCCC"
                        BackColor="White" OnPageIndexChanging="AU_GRIDVIEW_PageIndexChanging" CellPadding="15"
                        BorderStyle="None" >
                        <Columns>
                            <asp:TemplateField HeaderText="Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"  Text='<%#Eval("code_menu") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Titre">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server"  Text='<%#Eval("titre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                            </asp:TemplateField>
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
                    <asp:Button ID="AjouterProfile" class="genererPassword" runat="server" 
                        Text="Ajouter Profile" onclick="AjouterProfile_Click"/>
                        </div>
                <div class="flex_shadow" runat="server" id="flex_shadow">
                    <div class="flexbox" runat="server" id="flexbox" style="background-color:transparent"> 
                     <asp:LinkButton ID="close_btn" OnClick="close_btn_Click" runat="server"><i class="fa fa-times close" aria-hidden="true"></i></asp:LinkButton>
                    <asp:GridView ID="AU_GRIDVIEW" runat="server" AllowPaging="True" CellPadding="15"
                        BorderStyle="None" PageSize="6" AutoGenerateColumns="true" GridLines="Horizontal"
                        Style="margin-right: 0px ; margin-left: 25px; margin-top: 50px;" ForeColor="Black" BorderWidth="1px" BorderColor="#CCCCCC"
                        BackColor="White" OnPageIndexChanging="AU_GRIDVIEW_PageIndexChanging">
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
                    </div>
                  </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
