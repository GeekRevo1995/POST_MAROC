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
    public partial class WebForm8 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connection = instance.connection;
                instance.con = new SqlConnection(connection);
                instance.con.Open();
                int id = int.Parse(Session["id"].ToString());
                if (id == 1)
                {
                    if (!IsPostBack)
                    {
                        drp_name_agence();
                        between_date();
                        CodeAgence.Visible = true;
                        hor_zebra.Visible = true;
                    }
                }
                else
                {
                    if (!IsPostBack)
                    {
                        CodeAgence.Visible = false;
                        between_date();
                        RemplirGridView_listClient();
                    }
                }
            }
            catch
            {
                Response.Redirect("404.aspx");
            }
        }

        private void drp_name_agence()
        {
            instance.cmd = new SqlCommand("select CODE_AGENCE , RESEAU from agences",instance.con);
            DataTable table = new DataTable();
            table.Load(instance.cmd.ExecuteReader());
            CodeAgence.DataSource = table;
            CodeAgence.DataTextField = "RESEAU";
            CodeAgence.DataValueField = "CODE_AGENCE";
            CodeAgence.DataBind();
        }

        private void between_date()
        {
            DateInitial.Value = DateTime.Now.ToString("yyyy/MM/dd");
            DateFinal.Value = DateTime.Now.ToString("yyyy/MM/dd");
        }
        private void RemplirGridView_listClient()
        {
            try
            {
                instance.cmd = new SqlCommand("SelectClientBetweenDates", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                instance.cmd.Parameters.AddWithValue("@DateInitial", DateInitial.Value);
                instance.cmd.Parameters.AddWithValue("@DateFinal", DateFinal.Value);
                dt.Load(instance.cmd.ExecuteReader());
                GridView_listClient.DataSource = dt;
                GridView_listClient.DataBind();
                if (dt.Rows.Count > 0)
                {
                    hor_zebra.Visible = false;
                }
                else
                { hor_zebra.Visible = true; }
            }
            catch { }
        }
        private void RemplirGrid_lisClientAdmin()
        {
            try
            {
                instance.cmd = new SqlCommand("SelectClientBetweenDatesAdmin", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                instance.cmd.Parameters.AddWithValue("@DateInitial", DateInitial.Value);
                instance.cmd.Parameters.AddWithValue("@DateFinal", DateFinal.Value);
                instance.cmd.Parameters.AddWithValue("@CodeAgance", int.Parse(CodeAgence.SelectedItem.Value));
                dt.Load(instance.cmd.ExecuteReader());
                GridView_listClient.DataSource = dt;
                GridView_listClient.DataBind();
                if (dt.Rows.Count > 0)
                {
                    hor_zebra.Visible = false;
                }
                else
                { hor_zebra.Visible = true; }
            }
            catch
            {

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["id"].ToString());
            if (id == 1)
            {
                RemplirGrid_lisClientAdmin();
            }
            else
                RemplirGridView_listClient();
        }
    }

}
