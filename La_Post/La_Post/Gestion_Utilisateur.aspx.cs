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
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlDataReader dr;
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            string connection = instance.connection;
            instance.con = new SqlConnection(connection);
            instance.con.Open();
            if (!IsPostBack)
                FillGridViewFromSearch();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                instance.cmd = new SqlCommand("SP_SearchByCodeNomCodeAgenceProfile", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                instance.cmd.Parameters.AddWithValue("@SearchValue", nom_utilisateur.Value);
                instance.adapter = new SqlDataAdapter(instance.cmd);
                instance.adapter.Fill(ds, "utilisateur");
                Utilisateur_GridView.DataSource = ds.Tables[0];
                Utilisateur_GridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        private void FillGridViewFromSearch()
        {
            try
            {
                instance.cmd = new SqlCommand("SP_SearchByCodeNomCodeAgenceProfile", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                instance.cmd.Parameters.AddWithValue("@SearchValue", nom_utilisateur.Value);
                instance.adapter = new SqlDataAdapter(instance.cmd);
                instance.adapter.Fill(ds, "utilisateur");
                Utilisateur_GridView.DataSource = ds.Tables[0];
                Utilisateur_GridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        private void FillGridView()
        {
            try
            {
                instance.cmd = new SqlCommand("SP_SelectFromUtilisateur", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                instance.adapter = new SqlDataAdapter(instance.cmd);
                instance.adapter.Fill(ds, "utilisateur");
                Utilisateur_GridView.DataSource = ds.Tables[0];
                Utilisateur_GridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void Utilisateur_GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Utilisateur_GridView.PageIndex = e.NewPageIndex;
            FillGridView();
        }

        protected void Utilisateur_GridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
                 Utilisateur_GridView.EditIndex = e.NewEditIndex;
                 FillGridViewFromSearch();
        }

        protected void Utilisateur_GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
                CheckBox cb = Utilisateur_GridView.Rows[e.RowIndex].FindControl("CheckBox1") as CheckBox;
                Label l = Utilisateur_GridView.Rows[e.RowIndex].FindControl("Label6") as Label;
                instance.cmd = new SqlCommand("update utilisateur set active=@statue where code_utilisateur=@code", instance.con);
                instance.cmd.Parameters.AddWithValue("@statue", cb.Checked == true ? 1 : 0);
                instance.cmd.Parameters.AddWithValue("@code", l.Text);
                instance.cmd.ExecuteNonQuery();
                Utilisateur_GridView.EditIndex = -1;
                FillGridViewFromSearch();
        }

        protected void Utilisateur_GridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Utilisateur_GridView.EditIndex = -1;
            FillGridViewFromSearch();
        }

        protected void Utilisateur_GridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
  }
