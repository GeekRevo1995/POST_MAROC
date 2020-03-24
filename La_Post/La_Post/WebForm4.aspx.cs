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
    public partial class WebForm4 : System.Web.UI.Page
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
                instance.cmd = new SqlCommand("insert into type_client values (@libelle,@statue,@tva,@mt_ht)", instance.con);
                instance.cmd.Parameters.AddWithValue("@libelle", type_txt.Value);
                instance.cmd.Parameters.AddWithValue("@statue", 1);
                instance.cmd.Parameters.AddWithValue("@tva", TVA_txt.Value);
                instance.cmd.Parameters.AddWithValue("@mt_ht", MT_HT_txt.Value);
                instance.cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Insert is successfull')", true);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('error verfier vos informations !!')", true);
            }
        }
    
    }
}