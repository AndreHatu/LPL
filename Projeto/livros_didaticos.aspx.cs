using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Exemplos.Utils;
using System.Security.Cryptography;
using Projeto.Models;
using Projeto.Utils;

namespace Projeto
{
	public partial class livros_didaticos1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (IsPostBack == false)
			{
				List<Livro> livros = new List<Livro>();

				// Cria e abre a conexão com o banco de dados
				using (SqlConnection conn = Sql.OpenConnection())
				{

					// Cria um comando para selecionar registros da tabela
					using (SqlCommand cmd = new SqlCommand("SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Autor, tbLivro.IdGenero, tbGenero.Nome FROM tbLivro INNER JOIN tbGenero ON tbLivro.IdGenero = tbGenero.Id WHERE Didatico = 1 ORDER BY tbLivro.Nome ASC", conn))
					{

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
		}
		
		protected void btnPesquisa_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrWhiteSpace(txtPesquisa.Text) == true)
			{
				return;
			}
			else
			{
				List<Livro> livrosDidaticos = new List<Livro>();

				// Cria e abre a conexão com o banco de dados
				using (SqlConnection conn = Sql.OpenConnection())
				{

					// Cria um comando para selecionar registros da tabela
					using (SqlCommand cmd = new SqlCommand("SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Autor, tbLivro.IdGenero, tbGenero.Nome FROM tbLivro INNER JOIN tbGenero ON tbLivro.IdGenero = tbGenero.Id WHERE tbLivro.Didatico = 1 AND tbLivro.Nome LIKE @pesquisa ORDER BY tbLivro.Nome ASC", conn))
					{
						cmd.Parameters.AddWithValue("@pesquisa", "%" + txtPesquisa.Text + "%");

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

								livrosDidaticos.Add(l);
							}
						}
					}
				}

				listRepeater.DataSource = livrosDidaticos;
				listRepeater.DataBind();

				if (livrosDidaticos.Count == 0)
				{
					listRepeater.Visible = false;
					painelVazio.Visible = true;
				}
				else
				{
					listRepeater.Visible = true;
					painelVazio.Visible = false;
				}
			}
		}
	}
}