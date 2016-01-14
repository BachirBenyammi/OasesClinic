using System.Data;
using System.Data.SqlClient;
using System;
using System.Configuration;

namespace CliniqueSite
{
	public class Functions
	{
		public string GetUserRole (string compte)
		{
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();
			try{
				SqlCommand command = new SqlCommand("select Droit from Users where Compte = '" + compte + "'", connection);
				object role = command.ExecuteScalar ();
				if (role is DBNull)
					return null;
				return (string) role;
			}
			finally{
				connection.Close ();
			}
		}
		public void AddTach(string compte, string Tache, string Categorie)
		{
			string droit = GetUserRole(compte);
			if (droit != "Webmaster"){
				byte NuUser = 0;
				SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
				connection.Open();
				SqlCommand command = new SqlCommand	("select Nu_User from Users where Compte ='" + compte +"'", connection);
				NuUser =  (byte) command.ExecuteScalar ();
				connection.Close ();
				connection.Open();
				SqlCommand cmd = new SqlCommand	("AddTache" , connection);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("@Nu_User", NuUser);
				cmd.Parameters.Add("@Tache", Tache);
				cmd.Parameters.Add("@Categorie", Categorie);
				cmd.Parameters.Add("@Date_Heure", DateTime.Now);												
				cmd.ExecuteNonQuery();
				connection.Close ();
			}
		}
	}
}