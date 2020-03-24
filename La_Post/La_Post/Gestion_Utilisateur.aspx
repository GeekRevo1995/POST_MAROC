<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Gestion_Utilisateur.aspx.cs" Inherits="La_Post.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="au_form_content" runat="server" id="au_form_content">
                <div class="au_left_form">
                    <div class="input">
                        <label class="lbl">
                            Chercher un utilisateur
                        </label>
                        <input class="au_input" type="text" runat="server" id="nom_utilisateur" causesvalidation="True" />
                        <asp:Button class="genererPassword" ID="Button1" runat="server" Text="Chercher" BackColor="Transparent"
                            CausesValidation="true" OnClick="Button1_Click" />
                    </div>
                </div>
                <div class="au_right_form">
                    <asp:GridView ID="Utilisateur_GridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        OnPageIndexChanging="Utilisateur_GridView_PageIndexChanging" OnRowCancelingEdit="Utilisateur_GridView_RowCancelingEdit"
                        OnRowEditing="Utilisateur_GridView_RowEditing" 
                        OnRowUpdating="Utilisateur_GridView_RowUpdating" CellPadding="15" BorderStyle="None"
                       PageSize="6" GridLines="Horizontal" Style="margin-right: 0px" ForeColor="Black"
                        BorderWidth="1px" BorderColor="#CCCCCC" BackColor="White" 
                        onselectedindexchanged="Utilisateur_GridView_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" CancelText="Annuler" 
                                EditText="Modifier" UpdateText="Enregistrer" />
                            <asp:TemplateField HeaderText="Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("Code") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nom Utilisateur">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("Nom Utilisateur") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mot de Pass">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("Mot de Pass") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("Active") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("Active") %>' Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Code Agence">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Code Agence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Profile">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Profile") %>'></asp:Label>
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
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
