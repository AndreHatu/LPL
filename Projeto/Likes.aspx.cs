using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto.Models;
using Exemplos.Utils;
using System.Data.SqlClient;
using System.Data;

namespace Projeto
{
	public partial class Likes : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (IsPostBack == false)
			{

			}
		}

		protected void UCLogin_Load(object sender, EventArgs e)
		{
			if (IsPostBack == false)
			{
				ListarLike();
			}
		}

		protected void btnLike_Command(object sender, CommandEventArgs e)
		{
			int idlivro = int.Parse(e.CommandArgument.ToString());
			try
			{
				using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlCommand cmd = new SqlCommand("UPDATE tbCurtida SET Curtida = 1 WHERE tbCurtida.IdLivro = @id", conn))
					{
						cmd.Parameters.AddWithValue("@id", idlivro);

						cmd.ExecuteNonQuery();

						ListarLike();
					}
				}
				titlelike.Text = "Alterar Likes";
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		protected void btnDislike_Command(object sender, CommandEventArgs e)
		{
			int idlivro = int.Parse(e.CommandArgument.ToString());
			try
			{
				using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlCommand cmd = new SqlCommand("UPDATE tbCurtida SET Curtida = 0 WHERE tbCurtida.IdLivro = @id", conn))
					{
						cmd.Parameters.AddWithValue("@id", idlivro);

						cmd.ExecuteNonQuery();
						
						ListarDislike();
					}
				}
				titlelike.Text = "Alterar Dislikes";
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		private void ListarLike()
		{
			List<Livro> livros = new List<Livro>();

			// Cria e abre a conexão com o banco de dados
			using (SqlConnection conn = Sql.OpenConnection())
			{

				// Cria um comando para selecionar registros da tabela
				using (SqlCommand cmd = new SqlCommand("SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Autor, tbLivro.IdGenero, tbGenero.Nome, tbCurtida.IdUsuario, tbCurtida.IdLivro FROM tbLivro INNER JOIN tbGenero ON tbLivro.IdGenero = tbGenero.Id INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro WHERE tbCurtida.IdUsuario = @iddono AND tbCurtida.Curtida = 1 ORDER BY tbLivro.Nome ASC", conn))
				{
					cmd.Parameters.AddWithValue("@iddono", UCLogin.Usuario.Id);
					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						//Obtém os registros, um por vez
						while (reader.Read() == true)
						{
							Livro l = new Livro();
							l.Id = reader.GetInt32(0);
							l.Nome = reader.GetString(1);
							l.Autor = reader.GetString(2);
							l.IdGenero = reader.GetInt32(3);
							l.Genero = reader.GetString(4);

							livros.Add(l);
						}
					}
				}
			}

			listRepeater.DataSource = livros;
			listRepeater.DataBind();
		}

		private void ListarDislike()
		{
			List<Livro> livros = new List<Livro>();

			// Cria e abre a conexão com o banco de dados
			using (SqlConnection conn = Sql.OpenConnection())
			{

				// Cria um comando para selecionar registros da tabela
				using (SqlCommand cmd = new SqlCommand("SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Autor, tbLivro.IdGenero, tbGenero.Nome, tbCurtida.IdUsuario, tbCurtida.IdLivro FROM tbLivro INNER JOIN tbGenero ON tbLivro.IdGenero = tbGenero.Id INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro WHERE tbCurtida.IdUsuario = @iddono AND tbCurtida.Curtida = 0 ORDER BY tbLivro.Nome ASC", conn))
				{
					cmd.Parameters.AddWithValue("@iddono", UCLogin.Usuario.Id);
					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						//Obtém os registros, um por vez
						while (reader.Read() == true)
						{
							Livro l = new Livro();
							l.Id = reader.GetInt32(0);
							l.Nome = reader.GetString(1);
							l.Autor = reader.GetString(2);
							l.IdGenero = reader.GetInt32(3);
							l.Genero = reader.GetString(4);

							livros.Add(l);
						}
					}
				}
			}

			listRepeater.DataSource = livros;
			listRepeater.DataBind();
		}

		protected void btnLikes_Click(object sender, EventArgs e)
		{
			ListarLike();
        }

		protected void btnDislikes_Click(object sender, EventArgs e)
		{
			ListarDislike();
		}
	}
}
