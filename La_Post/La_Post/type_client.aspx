<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="La_Post.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
            <div class="au_form_content">
                <div class="au_left_form">
                    <div class="input">
                        <label class="lbl">
                          Type  de client
                        </label>
                        <input class="au_input" type="text" runat="server" id="type_txt" />
                    </div>
                    <div class="input">
                        <label class="lbl">
                            TVA
                        </label>
                        <input class="au_input" type="text" runat="server" id="TVA_txt" />
                    </div>
                    <div class="input">
                        <label class="lbl">
                            MT_HT
                        </label>
                        <input class="au_input" type="text" runat="server" id="MT_HT_txt" />
                    </div>
                    <asp:Button class="genererPassword" ID="Button1" runat="server" Text="Ajouter" OnClick="Button1_Click" />
                </div>
                <div class="au_right_form">
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderStyle="None"  
                        CellPadding="15" DataKeyNames="code_type_client" DataSourceID="SqlDataSource1">
                      <Columns>
                          <asp:CommandField CancelText="Annuler" EditText="Modifier" 
                              ShowEditButton="True" UpdateText="Enregistrer" />
                          <asp:BoundField DataField="code_type_client" HeaderText="code_type_client" 
                              ReadOnly="True" SortExpression="code_type_client" />
                          <asp:BoundField DataField="libelle_type_client" 
                              HeaderText="libelle_type_client" SortExpression="libelle_type_client" ReadOnly=true/>
                          <asp:TemplateField HeaderText="MT_HT" SortExpression="MT_HT">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Width="80px" Text='<%# Bind("MT_HT") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("MT_HT") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="TVA" SortExpression="TVA">
                              <ItemTemplate>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("TVA") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" Width="80px" runat="server" Text='<%# Bind("TVA") %>'></asp:TextBox>
                              </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:CheckBoxField DataField="statue" HeaderText="active" 
                              SortExpression="statue" />
                      </Columns>
                      <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                      <HeaderStyle BackColor="#272262" Font-Bold="True" ForeColor="white" CssClass="header_table_style" />
                      <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                      <RowStyle BackColor="White" ForeColor="#003399" />
                      <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                      <SortedAscendingCellStyle BackColor="#EDF6F6" />
                      <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                      <SortedDescendingCellStyle BackColor="#D6DFDF" />
                      <SortedDescendingHeaderStyle BackColor="#002876" />

            </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EFF_2016ConnectionString %>" 
                        SelectCommand="SELECT [code_type_client], [libelle_type_client], [MT_HT], [TVA], [statue] FROM [type_client]"
                        UpdateCommand="update type_client set statue = @statue , MT_HT=@MT_HT ,TVA = @TVA  where code_type_client = @code_type_client"
                        >
                        
                    </asp:SqlDataSource>
                    
                </div>
            </div>

</asp:Content>
