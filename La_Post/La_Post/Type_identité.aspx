<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="La_Post.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="au_form_content">
                <div class="au_left_form">
                    <div class="input">
                        <label class="lbl">
                            Libellé identité
                        </label>
                        <input class="au_input" type="text" runat="server" id="libelle" />
                    </div>
                    <asp:Button class="genererPassword" ID="Button1" runat="server" Text="Ajouter" 
                        onclick="Button1_Click"/>
                </div>
                <div class="au_right_form">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="15" DataKeyNames="code_identite" 
                        DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="500px" style="text-align:center">
                        <Columns>
                            <asp:CommandField CancelText="Annuler" EditText="Modifier" 
                                ShowEditButton="True" UpdateText="Enregistrer"/>
                            <asp:BoundField DataField="code_identite" HeaderText="Code" 
                                InsertVisible="False" ReadOnly="True" SortExpression="code_identite" />
                            <asp:BoundField DataField="libelle_identite" HeaderText="Libelle" 
                                SortExpression="libelle_identite" />
                            <asp:CheckBoxField DataField="statue" HeaderText="Active" 
                                SortExpression="statue" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#272262" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EFF_2016ConnectionString %>" 
                        SelectCommand="SELECT * FROM [type_identite]" UpdateCommand="update [type_identite] set libelle_identite=@libelle_identite,statue =@statue where code_identite=@code_identite"></asp:SqlDataSource>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
