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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string connection = instance.connection;
                instance.con = new SqlConnection(connection);
                instance.con.Open();
                remplir_dropDownList();
            }
        }

        private void remplir_dropDownList()
        {
            DataTable table = new DataTable();
            table.Clear();
            instance.cmd = new SqlCommand("select DISTINCT NOM_REGION from agences", instance.con);
            instance.reader = instance.cmd.ExecuteReader();
            table.Load(instance.reader);
            drp_region.DataSource = table;
            drp_region.DataTextField = "NOM_REGION";
            drp_region.DataBind();
        }
      
        protected void drp_region_SelectedIndexChanged(object sender, EventArgs e)
        {
            hor_zebra.Visible = false;
            DataTable table = new DataTable();
            table.Clear(); 
            drp_province.DataSource = null;
            instance.cmd = new SqlCommand("select DISTINCT PROVINCE from agences where NOM_REGION = @region", instance.con);
            instance.cmd.Parameters.AddWithValue("@region", drp_region.SelectedItem.Text);
            instance.reader = instance.cmd.ExecuteReader();
            table.Load(instance.reader);
            drp_province.DataSource = table;
            drp_province.DataTextField = "PROVINCE";
            drp_province.DataValueField = "PROVINCE";
            drp_province.DataBind();
        }

        protected void ajouter_agence_Click(object sender, EventArgs e)
        {
            try
            {
                instance.adapter = new SqlDataAdapter("sp_AjouterAgence ", instance.con);
                instance.adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                SqlParameter[] p = {
                 new SqlParameter("@code_agence",code_agence.Value),
                 new SqlParameter("@rezeau",rezeau_agence.Value),
                 new SqlParameter("@commune",commun_agence.Value),
                 new SqlParameter("@province",province_agence.Value),
                 new SqlParameter("@nom_region",nom_region_agence.Value),
                 new SqlParameter("@adresse",adresse_agence.Value)
                                   };
                instance.adapter.SelectCommand.Parameters.AddRange(p);
                instance.adapter.Fill(instance.ds, "ajouter_agence");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Insert is successfull')", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('error verfier vos information !!')", true);
            }
         }
     
       }
    }
