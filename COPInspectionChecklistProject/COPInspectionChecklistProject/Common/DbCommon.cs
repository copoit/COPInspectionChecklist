using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

namespace COPInspectionChecklistProject.Common
{
    public class DbCommon
    {
        public DataTable TestDBConnection(string sqlQuery)
        {
            using (SqlConnection conn = new SqlConnection())
            {
               
                string dbConnString = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;

                conn.ConnectionString = dbConnString; // "Data Source=teamdbserver.database.windows.net;Initial Catalog=OITDB;Persist Security Info=False;User ID=DBAdmin;Password=Mon#2017;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30";

                DataTable dt = new DataTable();

                try
                {
                    conn.Open();

                    SqlCommand command = new SqlCommand(sqlQuery, conn);

                    SqlDataReader dr = command.ExecuteReader(CommandBehavior.CloseConnection);

                    dt.Load(dr);

                    var cnt = dt.Rows.Count;

                    return dt;
               }
                catch (Exception e)
                {
                    throw e;
                }             
            }
        }
    }
}



