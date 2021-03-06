﻿using System;
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
	public partial class gerenciar_livros : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void UCLogin_Load(object sender, EventArgs e)
		{
			if (IsPostBack == false)
			{
				Listar();
			}
		}

		protected void btnExluir_Command(object sender, CommandEventArgs e)
		{
			int idlivro = int.Parse(e.CommandArgument.ToString());
			try
			{
				using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlCommand cmd = new SqlCommand("UPDATE tbLivro SET Trocado = 2 WHERE tbLivro.Id = @id", conn))
					{
						cmd.Parameters.AddWithValue("@id", idlivro);

						cmd.ExecuteNonQuery();

						System.IO.File.Delete(Server.MapPath("~/App_Data/" + idlivro + ".jpg"));

						Listar();
					}
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		private void Listar()
		{
			List<Livro> livros = new List<Livro>();

			// Cria e abre a conexão com o banco de dados
			using (SqlConnection conn = Sql.OpenConnection())
			{

				// Cria um comando para selecionar registros da tabela
				using (SqlCommand cmd = new SqlCommand("SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Autor, tbLivro.IdGenero, tbGenero.Nome FROM tbLivro INNER JOIN tbGenero ON tbLivro.IdGenero = tbGenero.Id WHERE tbLivro.IdDono = @iddono AND tbLivro.Trocado = 0 ORDER BY tbLivro.Nome ASC", conn))
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

			if (livros.Count == 0)
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

		protected void btnTrocado_Command(object sender, CommandEventArgs e)
		{
			int idlivro = int.Parse(e.CommandArgument.ToString());
			try
			{
				using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlCommand cmd = new SqlCommand("UPDATE tbLivro SET Trocado = 1 WHERE tbLivro.Id = @id", conn))
					{
						cmd.Parameters.AddWithValue("@id", idlivro);

						cmd.ExecuteNonQuery();

						System.IO.File.Delete(Server.MapPath("~/App_Data/" + idlivro + ".jpg"));

						Listar();
					}
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
	}
}
