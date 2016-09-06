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

namespace Projeto
{
	public partial class UCGuest : System.Web.UI.UserControl
	{
		public bool AlgoDeuErrado;
		protected void btnEntrar_Click(object sender, EventArgs e)
		{
			if (Usuario.FazerLogin(txtEmail.Text, txtSenha.Text) != null)
			{
				Response.Redirect("logado_default.aspx");
			}
			else
			{
				AlgoDeuErrado = true;
				lblMsg.Text = "Usuário ou senha inválidos!";
			}

		}
	}
}