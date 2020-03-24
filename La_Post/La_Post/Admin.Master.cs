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
    public partial class header : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                int id = int.Parse(Session["id"].ToString());
                get_list_menu(id);
                nom_utilisateur.InnerHtml = "Welcome MR " + Session["user_name"];
            }
        }
        DataTable table = new DataTable();

        private void get_list_menu(int identity)
        {
            DataTable table = new DataTable();
            table.Clear();
            instance.cmd = new SqlCommand("get_menu", instance.con);
            instance.cmd.CommandType = CommandType.StoredProcedure;
            instance.cmd.Parameters.AddWithValue("@identité", identity);
            table.Load(instance.cmd.ExecuteReader());

            Menu menu = (Menu)Page.Master.FindControl("menu_dynamic");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                menu.Items.Add(new MenuItem(table.Rows[i][0].ToString(), null, null, table.Rows[i][1].ToString()));
            }
        }

        protected void ContentPlaceHolder1_Load(object sender, EventArgs e)
        {
            try
            {
                int j = 1;
                int id;
                id = int.Parse(Session["id"].ToString());
                DataTable table = new DataTable();
                table.Clear();
                instance.cmd = new SqlCommand("get_menu", instance.con);
                instance.cmd.CommandType = CommandType.StoredProcedure;
                instance.cmd.Parameters.AddWithValue("@identité", id);
                table.Load(instance.cmd.ExecuteReader());
                string page = Page.AppRelativeVirtualPath;

                for (int i = 0; i < table.Rows.Count; i++)
                {
                    string xpage = table.Rows[i][1].ToString();
                    if (page == "~/default_welcome.aspx")
                    {
                        j = 1; break;
                    }
                    else if (page != "~/" + table.Rows[i][1].ToString())
                    {
                        j = 0;
                    }
                    else if (page == "~/")
                    {
                        j = 1;
                    }
                    else
                    {
                        j = 1; break;
                    }
                }
                if (j == 0)
                {
                    Response.Redirect("404.aspx");
                }
            }
            catch
            {
                Response.Redirect("404.aspx");
            }
        }

        protected void sign_out_Click(object sender, EventArgs e)
        {
            FormsAuthentication.RedirectFromLoginPage("login.aspx",false);
            FormsAuthentication.SignOut();
            Session.Clear();
            Response.Redirect("login.aspx");
            
        }

   

            }
        }

