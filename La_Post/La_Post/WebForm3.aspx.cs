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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connection = instance.connection;
                instance.con = new SqlConnection(connection);
                instance.con.Open();
                instance.cmd = new SqlCommand("insert into type_identite values(@lbelle,1)", instance.con);
                instance.cmd.Parameters.AddWithValue("@lbelle", libelle.Value);
                instance.cmd.ExecuteNonQuery();
                GridView1.DataBind();
            }
            catch
            {

            }
        }
    }
}