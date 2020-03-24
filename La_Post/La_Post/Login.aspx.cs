using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
namespace La_Post
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(Object sender, EventArgs e)
        {
            string connection = instance.connection;
            instance.con = new SqlConnection(connection);
            instance.con.Open();
        }
        protected void enter_btn_Click(object sender, EventArgs e)
        {

            try
            {
                instance.cmd = new SqlCommand("select * from FK_login (@userName,@password)", instance.con);

                //parametre
                instance.cmd.Parameters.AddWithValue("@userName", user_name.Value);
                instance.cmd.Parameters.AddWithValue("@password", password.Value);

                // execute command
                instance.reader = instance.cmd.ExecuteReader();
                DataTable table = new DataTable();
                table.Load(instance.reader);
                int type_identité = Convert.ToInt32(table.Rows[0][1]);
                int code_utilisateur = Convert.ToInt32(table.Rows[0][0]);
                // Check if the user exist
                if (table.Rows.Count > 0)
                {
                    if (Request.QueryString["ReturnURL"] != null)
                    {
                        Session["Id"] = type_identité;
                        Session["code_utilisateur"] = code_utilisateur;
                        Session["user_name"] = user_name.Value;
                        FormsAuthentication.RedirectFromLoginPage(user_name.Value, false);
                    }
                    else
                    {
                        Session["Id"] = type_identité;
                        Session["code_utilisateur"] = code_utilisateur;
                        Session["user_name"] = user_name.Value;
                        FormsAuthentication.RedirectFromLoginPage("default_welcome.aspx", false);
                        Response.Redirect("default_welcome.aspx");
                    }
                }
                else
                    msg_error.Visible = true;
            }
            catch
            {
                msg_error.Visible = true;
            }

        }

        private void get_list_menu(int identity)
        {
            DataTable table = new DataTable();
            table.Clear();
            instance.cmd = new SqlCommand("get_menu", instance.con);
            instance.cmd.CommandType = CommandType.StoredProcedure;
            instance.cmd.Parameters.AddWithValue("@identité", identity);
            table.Load(instance.cmd.ExecuteReader());

             Menu menu = (Menu)Page.Master.FindControl("menu_dynamic");
             for(int i=0;i<table.Rows.Count;i++){
                 menu.Items.Add(new MenuItem(table.Rows[i][0].ToString(),null , null, table.Rows[i][1].ToString())); 
             }
        }
    }
}