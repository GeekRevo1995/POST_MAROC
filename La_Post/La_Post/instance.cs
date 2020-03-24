using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace La_Post
{
    public class instance
    {
        public static string connection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        public static SqlConnection con;
        public static SqlCommand cmd;
        public static SqlDataAdapter adapter;
        public static DataSet ds = new DataSet();
        public static SqlDataReader reader;
    }
}