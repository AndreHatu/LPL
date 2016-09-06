using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Projeto.Models;
using Projeto.Utils;
using Exemplos.Utils;

namespace Projeto {
	public partial class Default : System.Web.UI.Page {

		protected void Page_Load(object sender, EventArgs e)
		{
			Usuario usuario = Usuario.Validar();
			if (usuario != null)
			{
				Response.Redirect("logado_default.aspx");
			}
		}

		
	}
}