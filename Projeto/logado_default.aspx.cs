using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Exemplos.Utils;
using Projeto.Models;
using Projeto.Utils;


namespace Projeto
{
    public partial class logado_default : System.Web.UI.Page
    {
		public int IdLivro;
		protected void Page_Load(object sender, EventArgs e)
        {

        }
		protected void UCLogin1_Load(object sender, EventArgs e)
		{
			using (SqlConnection conn = Sql.OpenConnection())
			{
				using (SqlCommand cmd = new SqlCommand("SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Sinopse FROM tbLivro LEFT JOIN (SELECT IdLivro FROM tbCurtida WHERE IdUsuario = @id) temp ON tbLivro.Id = temp.IdLivro WHERE tbLivro.Trocado = 0 AND temp.IdLivro IS NULL AND tbLivro.IdDono <> @id ORDER BY tbLivro.Id DESC", conn))

				{
					cmd.Parameters.AddWithValue("@id", UCLogin1.Usuario.Id);

					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						if (reader.Read() == true)
						{
							IdLivro = reader.GetInt32(0);
							lblNome.Text = reader.GetString(1);
							lblSinopse.Text = reader.GetString(2);
						}
						else
						{
							//nada mais para exibir!!!
							//mostrar uma msg! :)
							lblNome.Text = "Não há mais livros por enquanto! Volte mais tarde para explorar mais livros!";

						}
					}
				}
			}
			lblID.Text = IdLivro.ToString();
		}
		protected void click_like(object sender, EventArgs e)
		{
			lblLikeDislike.Text = "";
			try
			{
				using (SqlConnection conn = Sql.OpenConnection())
				{

					//Cria um comando para inserir um novo registro à tabela

					using (SqlCommand cmd = new SqlCommand("DELETE FROM tbCurtida WHERE tbCurtida.IdUsuario = @id AND tbCurtida.IdLivro = @idlivro", conn))
					{

						cmd.Parameters.AddWithValue("@id", UCLogin1.Usuario.Id);
						cmd.Parameters.AddWithValue("@idlivro", lblID.Text);

						cmd.ExecuteNonQuery();
					}
				}

				using (SqlConnection conn = Sql.OpenConnection())
				{

					//Cria um comando para inserir um novo registro à tabela

					using (SqlCommand cmd = new SqlCommand("INSERT INTO tbCurtida (IdUsuario, IdLivro, Curtida) VALUES (@idusuario, @idlivro, 1)", conn))
					{

						cmd.Parameters.AddWithValue("@idusuario", UCLogin1.Usuario.Id);
						cmd.Parameters.AddWithValue("@idlivro", lblID.Text);

						cmd.ExecuteNonQuery();
					}
				}
			}
			catch (Exception ex)
			{
				lblLikeDislike.Text = "Erro de banco de dados: " + ex.Message;
				return;
			}

			//Response.Redirect("logado_default.aspx");
		}
		protected void click_dislike(object sender, EventArgs e)
		{
			lblLikeDislike.Text = "";
			try
			{
				using (SqlConnection conn = Sql.OpenConnection())
				{

					//Cria um comando para inserir um novo registro à tabela

					using (SqlCommand cmd = new SqlCommand("DELETE FROM tbCurtida WHERE tbCurtida.IdUsuario = @id AND tbCurtida.IdLivro = @idlivro", conn))
					{

						cmd.Parameters.AddWithValue("@id", UCLogin1.Usuario.Id);
						cmd.Parameters.AddWithValue("@idlivro", lblID.Text);

						cmd.ExecuteNonQuery();
					}
				}

				using (SqlConnection conn = Sql.OpenConnection())
				{

					//Cria um comando para inserir um novo registro à tabela

					using (SqlCommand cmd = new SqlCommand("INSERT INTO tbCurtida (IdUsuario, IdLivro, Curtida) VALUES (@idusuario, @idlivro, 0)", conn))
					{

						cmd.Parameters.AddWithValue("@idusuario", UCLogin1.Usuario.Id);
						cmd.Parameters.AddWithValue("@idlivro", lblID.Text);

						cmd.ExecuteNonQuery();
					}
				}
			}
			catch (Exception ex)
			{
				lblLikeDislike.Text = "Erro de banco de dados: " + ex.Message;

				return;
			}
			//Response.Redirect("logado_default.aspx");
		}

	}
}