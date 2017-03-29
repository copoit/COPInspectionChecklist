using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace COPInspectionChecklistProject {
    public class ViolationDataAccessLayer
    {
        public class Violation
        {
            public string CaseNumber { get; set; }
            public string Section_ID { get; set; }
            public string Notes { get; set; }
            public bool Major { get; set; }
            public bool Minor { get; set; }
        }
        public static List<Violation> GetAllViolations()
        {
            List<Violation> listViolations = new List<Violation>();

            string CS = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select * from Violations", conn);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Violation violate = new Violation();
                    violate.CaseNumber = rdr["CaseNumber"].ToString();
                    violate.Section_ID = rdr["Section_ID"].ToString();
                    violate.Notes = rdr["Notes"].ToString();
                    violate.Major = (bool)rdr["Major"];
                    violate.Minor = (bool)rdr["Minor"];
                    listViolations.Add(violate);
                }
                return listViolations;
            }

        }
        public static void UpdateViolation(string num, string section, string note, bool major, bool minor)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBOIT"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string updateQuery = "Update Violations SET Case_Num = @Case_Num,  " +
                    "Section_ID = @Section, Notes = @Note, Major = @Major, Minor = @Minor WHERE Case_Num = @Case_Num ";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                SqlParameter paramNumber = new SqlParameter("@Case_Num", num);
                cmd.Parameters.Add(paramNumber);
                SqlParameter paramSection = new SqlParameter("@Section", section);
                cmd.Parameters.Add(paramSection);
                SqlParameter paramNotes = new SqlParameter("@Note", note);
                cmd.Parameters.Add(paramNotes);
                SqlParameter paramMajor = new SqlParameter("@Major", major);
                cmd.Parameters.Add(paramMajor);
                SqlParameter paramMinor = new SqlParameter("@Minor", minor);
                cmd.Parameters.Add(paramMinor);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}