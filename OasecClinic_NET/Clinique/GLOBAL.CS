using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Security.Principal;
using System.Web;
using System.Web.SessionState;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;

namespace CliniqueSite
{
	public class Global : System.Web.HttpApplication
	{
		protected void Application_Error(Object sender, EventArgs e)
		{
			System.Exception error = Server.GetLastError().GetBaseException();
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open();
			try{
				SqlCommand command = new SqlCommand ("MarqueErreur", connection);	
				command.CommandType = CommandType.StoredProcedure;	
				command.Parameters.Add("@Message",error.Message.ToString());
				command.Parameters.Add("@Date_Heure",DateTime.Now);
				command.Parameters.Add("@Source",error.Source.ToString());
				command.Parameters.Add("@Url",Request.Url.ToString());
				command.ExecuteNonQuery ();
			}
			finally{
				connection.Close ();
			}
		}
		protected void Application_AuthenticateRequest (Object sender, EventArgs e)
		{		
			HttpApplication app = (HttpApplication) sender;
			if (app.Request.IsAuthenticated && app.User.Identity is FormsIdentity) 
			{
				FormsIdentity identity = (FormsIdentity) app.User.Identity;
				Functions fun = new Functions();
				string droit = fun.GetUserRole(identity.Name);
				Application["droit"] = droit;
				if (droit != null)
					app.Context.User = new GenericPrincipal (identity, new string[] { droit });
			}
		}
		protected void Session_Start(Object sender, EventArgs e)
		{
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);		
			string Lien = Request.ServerVariables["HTTP_REFERER"];
			string Navigateur = Request.ServerVariables["HTTP_USER_AGENT"];
			string Language = Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"];
			string IpAddress = Request.ServerVariables["LOCAL_ADDR"];
			if (IpAddress == "" || IpAddress == null)
				IpAddress =	Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
			if (IpAddress == "" || IpAddress == null)	
				IpAddress =	Request.ServerVariables["REMOTE_ADDR"];			
			if (IpAddress == "" || IpAddress == null) IpAddress = "127.0.0.1";
			if (Lien == "" || Lien == null) Lien = "Unknouw";
			if (Navigateur == "" || Navigateur == null) Navigateur = "Unknouw";
			if (Language == "" || Language == null) Language = "Unknouw";
			
			String[] aIp = IpAddress.Split(new char[] {'.'}, 4);
			long NumericIp = 0;
			for(int i=0; i<=3; i++)
				NumericIp = NumericIp + long.Parse(aIp[i]) * ((long ) Math.Pow(255 , (3 - i)));
			try {
				connection.Open();	
				SqlCommand command = new SqlCommand	("NewVisiteur", connection);
				command.CommandType = CommandType.StoredProcedure;				
				command.Parameters.Add("@Ip_Adress", NumericIp);
				command.Parameters.Add("@Lien", Lien);
				command.Parameters.Add("@Navigateur", Navigateur);
				command.Parameters.Add("@Language", Language);
				command.Parameters.Add("@Date_Heure", DateTime.Now);
				command.ExecuteNonQuery ();
			}
			finally {
				connection.Close();
			}
		}		
	}
}