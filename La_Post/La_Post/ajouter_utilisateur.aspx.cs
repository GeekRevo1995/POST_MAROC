using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using passwordGeneratorV01;
namespace La_Post
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable dt2 = new DataTable();
        DataTable dt = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataSet ds = new DataSet();
        static bool Show = false;
        static int dt5Count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            AU_GRIDVIEW.Visible = false;
            if (!IsPostBack)
            {
                string connection = instance.connection;
                instance.con = new SqlConnection(connection);
                instance.con.Open();
                instance.cmd = new SqlCommand("select * from profile", instance.con);
                dt.Load(instance.cmd.ExecuteReader());
                type_utilisateur.DataSource = dt;
                type_utilisateur.DataTextField = "libelle";
                type_utilisateur.DataValueField = "code_profile";
                type_utilisateur.DataBind();
                instance.cmd = new SqlCommand("select * from utilisateur", instance.con);
                dt3.Load(instance.cmd.ExecuteReader());
                fillGridView();
                AU_GRIDVIEW.DataBind();
                fillFormsautoriseGridView();
                MenueAutorise.DataBind();
                fillListTitres();
                dt5Count = dt5.Rows.Count;
            }
            else
                AU_GRIDVIEW.Visible = true;
        }

        protected void type_utilisateur_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillGridView();
            AU_GRIDVIEW.DataBind();
            fillFormsautoriseGridView();
        }

        private void fillGridView()
        {
            instance.cmd = new SqlCommand("SP_Select_from_agences", instance.con);
            instance.cmd.CommandType = CommandType.StoredProcedure;
            instance.cmd.Parameters.AddWithValue("@type_utilisateur", type_utilisateur.SelectedValue);
            dt2.Load(instance.cmd.ExecuteReader());
            AU_GRIDVIEW.DataSource = dt2;
        }
        private void fillFormsautoriseGridView() {
            instance.cmd = new SqlCommand("SP_AfficherListMenu", instance.con);
            instance.cmd.CommandType = CommandType.StoredProcedure;
            instance.cmd.Parameters.AddWithValue("@code_profile", type_utilisateur.SelectedValue);
            dt4.Load(instance.cmd.ExecuteReader());
            MenueAutorise.DataSource = dt4;
            MenueAutorise.DataBind();
        }
        private void fillListTitres() {
            instance.cmd = new SqlCommand("select code_menu, titre from menu ", instance.con);
            dt5.Load(instance.cmd.ExecuteReader());
            ListTitres.DataSource = dt5;
            ListTitres.DataBind();
        }
        SoufianePassword sp = new SoufianePassword();
        protected void Button1_Click(object sender, EventArgs e)
        {
            int index = PasswordLevel.SelectedIndex;
            switch (index)
            {
                case 0: passowrd.Value = sp.Generate(6, SoufianePassword.complexityDegree.medium); break;
                case 1: passowrd.Value = sp.Generate(6, SoufianePassword.complexityDegree.high); break;
                case 2: passowrd.Value = sp.Generate(6, SoufianePassword.complexityDegree.low); break;
                case 3: passowrd.Value = sp.Generate(6, SoufianePassword.Type.digits); break;
                case 4: passowrd.Value = sp.Generate(6, SoufianePassword.Type.Characters); break;
                case 5: passowrd.Value = sp.Generate(6, SoufianePassword.Type.CharactersAnddigits); break;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (nom_utilisateur.Value != "" && passowrd.Value != "" && code_agence.Value != "")
            {
                int done;
                try
                {
                    instance.cmd = new SqlCommand("SP_Ajouter_utilisateur", instance.con);
                    instance.cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter[] p = {
                               new SqlParameter("@nom_utilisateur",nom_utilisateur.Value),
                               new SqlParameter("@pwd",passowrd.Value),
                               new SqlParameter("@code_agence",code_agence.Value),
                               new SqlParameter("@code_profile",type_utilisateur.SelectedValue),
                               new SqlParameter("@done",DbType.Int32){
                                Direction= ParameterDirection.Output
                               }
                               };
                    instance.cmd.Parameters.AddRange(p);
                    done = (int)instance.cmd.ExecuteScalar();
                    switch (done)
                    {
                        case 0: message.InnerHtml = "Ce nom d'itullisateur deja existe"; break;
                        case 1: message.InnerHtml = "Bien Ajouter!!"; break;
                        case 2: message.InnerHtml = "Tu peux pas ajouter un utilisateur pour une une agence inactive!!"; break;
                        case 3: message.InnerHtml = "Le code d'agence que vous avez entrer n'est pas d'une agence principale !!"; break;
                        case 4: message.InnerHtml = "Agence que vous avez entrer n'existe pas"; break;
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('error verfier vos informations" + ex.Message + " !!')", true);
                }
            }
            else
                message.InnerHtml = "Remplir tous les champs ";
        }

        protected void AU_GRIDVIEW_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            fillGridView();
            AU_GRIDVIEW.PageIndex = e.NewPageIndex;
            AU_GRIDVIEW.DataBind();
        }

        protected void PasswordLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void ShowHideListAgences_Click(object sender, EventArgs e)
        {
                flex_shadow.Style.Add("visibility", "visible");
                flexbox.Style.Add("display", "block");
                AU_GRIDVIEW.Visible = true;
        }

        protected void close_btn_Click(object sender, EventArgs e)
        {
            flex_shadow.Style.Add("visibility", "hidden");
            flexbox.Style.Add("display", "none");
            AU_GRIDVIEW.Visible = false;
        }

        protected void MenueAutorise_RowEditing(object sender, GridViewEditEventArgs e)
        {
            MenueAutorise.EditIndex = e.NewEditIndex;
            fillFormsautoriseGridView();

        }

        protected void MenueAutorise_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CheckBox cb = MenueAutorise.Rows[e.RowIndex].FindControl("CheckBox1") as CheckBox;
            Label l = MenueAutorise.Rows[e.RowIndex].FindControl("Label1") as Label;
            instance.cmd = new SqlCommand("update menu_par_profil set statut=@statut where code_profile=@code ", instance.con);
            instance.cmd.Parameters.AddWithValue("@statut", cb.Checked == true ? 1 : 0);
            instance.cmd.Parameters.AddWithValue("@code", l.Text);
            instance.cmd.ExecuteNonQuery();
            MenueAutorise.EditIndex = -1;
            fillFormsautoriseGridView();
        }

        protected void MenueAutorise_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MenueAutorise.EditIndex = -1;
            fillFormsautoriseGridView();
        }

        protected void AjouterProfile_Click(object sender, EventArgs e)
        {
            try
            {
                instance.cmd = new SqlCommand("insert into profile values(@libelle) ", instance.con);
                instance.cmd.Parameters.AddWithValue("@libelle", LibelleProfile.Value);
                instance.cmd.ExecuteNonQuery();
                instance.cmd = new SqlCommand("select max(code_profile) from profile", instance.con);
                int code_profile = (int)instance.cmd.ExecuteScalar();
                instance.adapter = new SqlDataAdapter("select * from menu_par_profil where code_profile="+code_profile+"", instance.con);
                instance.adapter.Fill(ds, "menu_par_profile");
                instance.adapter.FillSchema(ds.Tables[0], SchemaType.Mapped);
                for (int i = 0; i < dt5Count; i++)
                {
                    if ((ListTitres.Rows[i].Cells[2].FindControl("CheckBox1") as CheckBox).Checked)
                    {
                        ds.Tables[0].Rows.Add(code_profile,int.Parse(((ListTitres.Rows[i].Cells[0].Controls[1])as Label).Text),1);
                    }
                }
                SqlCommandBuilder cmb = new SqlCommandBuilder(instance.adapter);
                instance.adapter.Update(ds, "menu_par_profile");
            }
            catch { }
        }
    }
}