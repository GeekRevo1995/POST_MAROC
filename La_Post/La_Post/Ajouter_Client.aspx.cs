using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace La_Post
{
    public partial class WebForm5 : System.Web.UI.Page
    {
          private Boolean etat = false;
          DataTable dt = new DataTable();

          private void Remp_DRP_Type_Contrat() {
              dt.Rows.Clear();
              drp_type_contrat.DataSource = null;
              instance.cmd = new SqlCommand("select * from type_contrat",instance.con);
              dt.Load(instance.cmd.ExecuteReader());
              drp_type_contrat.DataSource = dt;
              drp_type_contrat.DataTextField = "nom_contrat";
              drp_type_contrat.DataValueField = "id_contrat";
              drp_type_contrat.DataBind();
          }
          private void Remp_DRP_Type_ContratA()
          {
              dt.Rows.Clear();
              drp_type_contrat.DataSource = null;
              instance.cmd = new SqlCommand("select * from type_contrat where nom_contrat<>'R'", instance.con);
              dt.Load(instance.cmd.ExecuteReader());
              drp_type_contrat.DataSource = dt;
              drp_type_contrat.DataTextField = "nom_contrat";
              drp_type_contrat.DataValueField = "id_contrat";
              drp_type_contrat.DataBind();
          }

          protected void Page_Load(object sender, EventArgs e)
        {
                if(!Page.IsPostBack){
                string connection = instance.connection;
                instance.con = new SqlConnection(connection);
                instance.con.Open();
                remplir_dropdown_list();
                Remp_DRP_Type_Contrat();
                drp_type_contrat.Enabled = false;
                }
        }

        private void remplir_dropdown_list(){

            DataTable table = new DataTable();
            instance.cmd = new SqlCommand("select * from type_identite", instance.con);
            instance.reader = instance.cmd.ExecuteReader();
            table.Load(instance.reader);
            drp_type_identité_recherche.DataSource = table;
            drp_type_identité_recherche.DataTextField = "libelle_identite";
            drp_type_identité_recherche.DataValueField = "code_identite";
            drp_type_identité_recherche.DataBind();

            drp_type_identité.DataSource = table;
            drp_type_identité.DataTextField = "libelle_identite";
            drp_type_identité.DataValueField = "code_identite";
            drp_type_identité.DataBind();

            DataTable type_client = new DataTable();
            
            instance.cmd = new SqlCommand("select * from type_client", instance.con);
            instance.reader = instance.cmd.ExecuteReader();
            type_client.Load(instance.reader);
            drp_type_client.DataSource = type_client;
            drp_type_client.DataTextField = "libelle_type_client";
            drp_type_client.DataValueField = "code_type_client";
            drp_type_client.DataBind();

            
        }

        protected void recherche_btn_Click(object sender, ImageClickEventArgs e)
        {
            get_client();
        }
        
        private void get_client(){
            instance.cmd = new SqlCommand("sp_recherche_client", instance.con);
            instance.cmd.CommandType = CommandType.StoredProcedure;
            instance.cmd.Parameters.AddWithValue("@type_idenité", drp_type_identité_recherche.SelectedValue);
            instance.cmd.Parameters.AddWithValue("@identité", identité_client_recherche.Value);
            instance.reader = instance.cmd.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(instance.reader);
            list_client.DataSource = table;
            list_client.DataBind();
            hor_zebra.Visible = false;
            if (table.Rows.Count == 0)
            {
                hor_zebra.Visible = true;
            }
        }
        protected void ajouter_client_Click(object sender, EventArgs e)
        {
            try
            {
             instance.cmd = new SqlCommand("sp_add_client", instance.con);
            instance.cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter[] p = {
                    new SqlParameter("@id_utilisateur",Session["code_utilisateur"]),
                    new SqlParameter("@code_type_client",drp_type_client.SelectedValue),
                    new SqlParameter("@appellation",appelation.Value),
                    new SqlParameter("@email_client",Email_client.Value),
                    new SqlParameter("@telephone",telephone_client.Value),
                    new SqlParameter("@code_type_identité",drp_type_identité.SelectedValue),
                    new SqlParameter("@identity",identité_client.Value),
                    new SqlParameter("@adresse",Adresse_client.Value),
                                };
            Session["identité"] = identité_client.Value;
            Session["type_client"] = drp_type_client.SelectedItem.Text; 
            instance.cmd.Parameters.AddRange(p);
            instance.cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Insert is successfull')", true);
            type_identité.InnerText = drp_type_identité.SelectedItem.Text;
            identite_client.InnerText = identité_client.Value;
            type_client.InnerText = drp_type_client.SelectedItem.Text;
            contrat.InnerText = drp_type_contrat.SelectedItem.Text;
            name_client.InnerText = appelation.Value;
            Email.InnerText = Email_client.Value;
            telephone.InnerText = telephone_client.Value;
            adresse.InnerText = Adresse_client.Value;
            Hortax.InnerText = input_HT.Value;
            TVA.InnerText = input_TVA.Value;
            flex_shadow.Style.Add("visibility", "visible");
            flexbox.Style.Add("display", "block");
            datetime.Text = DateTime.Now.ToString();
            clear_textbox();
            }
            catch{
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('error verfier vos information !!')", true);
            }
        }

        protected void list_client_RowEditing(object sender, GridViewEditEventArgs e)
        {
            list_client.EditIndex = e.NewEditIndex;
            get_client();
        }

        protected void list_client_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
           
            list_client.EditIndex = -1;
            get_client();
        }

       private void get_HT_TVA(){
           DataTable table = new DataTable();
           instance.cmd = new SqlCommand("get_HT_TVA", instance.con);
           instance.cmd.CommandType = CommandType.StoredProcedure;
           instance.cmd.Parameters.AddWithValue("@type_client", drp_type_client.SelectedItem.Text);
           table.Load(instance.cmd.ExecuteReader());
           input_TVA.Value = table.Rows[0][0].ToString();
           input_HT.Value = table.Rows[0][1].ToString();
       }

        protected void drp_type_client_SelectedIndexChanged(object sender, EventArgs e)
        {
            get_HT_TVA();
        }

        protected void list_client_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                CheckBox check = list_client.Rows[e.RowIndex].FindControl("CheckBox1") as CheckBox;
                Label Label2 = list_client.Rows[e.RowIndex].FindControl("Label2") as Label;
                instance.cmd = new SqlCommand("update client set status = @status where identite = @code", instance.con);
                instance.cmd.Parameters.AddWithValue("@status", check.Checked == true ? 1 : 0);
                instance.cmd.Parameters.AddWithValue("@code", Label2.Text);
                instance.cmd.ExecuteNonQuery();
                list_client.EditIndex = -1;
                get_client();
            }
            catch
            {
            }
        }

        protected void annuler_btn_Click(object sender, EventArgs e)
        {
            flex_shadow.Style.Add("visibility", "hidden");
            flexbox.Style.Add("display", "none");
        }
        private void clear_textbox(){
            identité_client.Value = string.Empty;
            appelation.Value = string.Empty;
            Email_client.Value = string.Empty;
            telephone_client.Value = string.Empty;
            Adresse_client.Value = string.Empty;
            input_HT.Value = string.Empty;
            input_TVA.Value = string.Empty;
            
        }

         protected void list_client_SelectedIndexChanged(object sender, EventArgs e)
         {
                    GridViewRow row = list_client.SelectedRow;     
                    string per  = (row.FindControl("Label3") as Label).Text;
                     string type_identité = (row.FindControl("Label1") as Label).Text;
                    if (type_identité == "CIN") drp_type_identité.SelectedIndex = 0; else drp_type_identité.SelectedIndex = 1;
                    try
                    {
                        instance.cmd = new SqlCommand("check_update_client", instance.con);
                        instance.cmd.CommandType = CommandType.StoredProcedure;
                        instance.cmd.Parameters.AddWithValue("@id", (row.FindControl("Label4") as Label).Text);
                        int i = (int)instance.cmd.ExecuteScalar();
                        if (i == 1)
                        {
                            if (per == "personnel") drp_type_client.SelectedIndex = 1; else drp_type_client.SelectedIndex = 0;
                            drp_type_client.Enabled = true;
                            Remp_DRP_Type_Contrat();
                        }
                        else
                        {
                            drp_type_client.Enabled = false;
                            Remp_DRP_Type_ContratA();
                        }
                    }
                    catch
                    {

                    }
                    drp_type_contrat.SelectedItem.Value= (row.FindControl("lblContrat") as Label).Text;
                    identité_client.Value = (row.FindControl("Label2") as Label).Text;
                    appelation.Value = (row.FindControl("Label5") as Label).Text;
                    Email_client.Value = (row.FindControl("Label6") as Label).Text;
                    telephone_client.Value = (row.FindControl("Label7") as Label).Text;
                    Adresse_client.Value = (row.FindControl("Label8") as Label).Text;
                    get_HT_TVA();
                    drp_type_contrat.Enabled = true;

                }

        protected void list_client_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
        }

        protected void modifier_client_Click(object sender, EventArgs e)
        {
                    if (etat)
                    {
                        update_client_methode();
                        type_identité.InnerText = drp_type_identité.SelectedItem.Text;
                        identite_client.InnerText = identité_client.Value;
                        type_client.InnerText = drp_type_client.SelectedItem.Text;
                        contrat.InnerText = drp_type_contrat.SelectedItem.Text;
                        name_client.InnerText = appelation.Value;
                        Email.InnerText = Email_client.Value;
                        telephone.InnerText = telephone_client.Value;
                        adresse.InnerText = Adresse_client.Value;
                        Hortax.InnerText = input_HT.Value;
                        TVA.InnerText = input_TVA.Value;
                        flex_shadow.Style.Add("visibility", "visible");
                        flexbox.Style.Add("display", "block");
                        datetime.Text = DateTime.Now.ToString();
                        clear_textbox();
                    }
                    else
                    {
                        update_client_methode();
                    }
        }
        

        protected void drp_type_contrat_SelectedIndexChanged(object sender, EventArgs e)
        {
            etat = true;
        }
        private void update_client_methode(){
            try
            {
                GridViewRow row = list_client.SelectedRow;
                string id_client = (row.FindControl("Label4") as Label).Text;
                instance.cmd = new SqlCommand("update_client", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter[] range = {
                    new SqlParameter("@id_client",int.Parse(id_client)),
                    new SqlParameter("@code_type_client",drp_type_client.SelectedValue),
                    new SqlParameter("@appelation",appelation.Value),
                    new SqlParameter("@email_client",Email_client.Value),
                    new SqlParameter("@telephone_client",telephone_client.Value),
                    new SqlParameter("@adresse",Adresse_client.Value),
                    new SqlParameter("@code_type_identité",drp_type_identité.SelectedValue),
                    new SqlParameter("@identité",identité_client.Value),
                    new SqlParameter("@contrat",drp_type_contrat.SelectedItem.Text),
                                   };
                instance.cmd.Parameters.AddRange(range);
                instance.cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Succes :)')", true);
                drp_type_contrat.Enabled = false;
                list_client.DataBind();
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('error information non valid !!')", true);
            }
        }

    }
}
