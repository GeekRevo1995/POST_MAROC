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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          if(!Page.IsPostBack){
            string connection = instance.connection;
            instance.con = new SqlConnection(connection);
            
                instance.con.Open();
               get_adresse_client();
         }
        }

        private void get_adresse_client(){
            try
            {
                instance.cmd = new SqlCommand("get_adresse_client", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                int para = (int)Session["code_utilisateur"];
                instance.cmd.Parameters.AddWithValue("@code_util", para);
                DataTable table = new DataTable();
                table.Load(instance.cmd.ExecuteReader());
                list_adresse_client.DataSource = table;
                list_adresse_client.DataBind();
            }
            catch
            {
                Response.Redirect("404.aspx");
            }
        }
        protected void list_adresse_client_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
         list_adresse_client.PageIndex = e.NewPageIndex;
                get_adresse_client();
        }

        protected void recherche_btn_facteur_Click(object sender, ImageClickEventArgs e)
        {
            instance.cmd = new SqlCommand("chercher_into_changment_adresse", instance.con);
            instance.cmd.CommandType = CommandType.StoredProcedure;
            instance.cmd.Parameters.AddWithValue("@date", DateInitia.Value);
            DataTable table = new DataTable();
            table.Load(instance.cmd.ExecuteReader());
            if (table.Rows.Count > 0)
            {
                hor_zebra.Visible = false;
                list_adresse_client.Visible = true;
                list_adresse_client.DataSource = table;
            }
            else
            {
                list_adresse_client.Visible = false;
                hor_zebra.Visible = true;
            }
        }
    }
}