using Projeto.Models;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projeto
{
	public partial class Foda : System.Web.UI.Page
	{
		public Usuario usuarioLogado;

		protected void Page_Load(object sender, EventArgs e)
		{
			usuarioLogado = Usuario.Validar();
			if (usuarioLogado == null)
			{
				Response.Redirect("/Default.aspx", true);
				return;
			}


			List<Livro> livros = new List<Livro>();

			for (int i = 0; i < 20; i++)
			{
				livros.Add(new Livro()
				{
					Id = i
				});
			}
			
			fodinha.DataSource = livros;
			fodinha.DataBind();
		}

		protected void btnTeste_Click(object sender, EventArgs e)
		{
			//login...

			//if (Usuario.FazerLogin(txtEmail.Text, txtPassword.Text) == null)
			//{
			//	//usuario ou senha invalidos
			//	return;
			//}
			//else
			//{
			//	Response.Redirect("/PaginaLegal.aspx");
			//}


			//logout

			usuarioLogado.FazerLogout();

		}
	}
}
