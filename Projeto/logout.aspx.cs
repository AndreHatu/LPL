using Projeto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projeto
{
	public partial class logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Usuario usuario = Usuario.Validar();
			if (usuario != null)
			{
				usuario.FazerLogout();
			}
			Response.Redirect("Default.aspx");
		}
	}
}