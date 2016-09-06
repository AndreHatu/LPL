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
	public partial class Edicao : System.Web.UI.Page
	{
		protected void UCLogin_Load(object sender, EventArgs e)
		{
			int id;
			if (int.TryParse(Request.QueryString["id"], out id) == false)
			{
				Response.Redirect("EdicaoErro.aspx");
				return;
			}


			using (SqlConnection conn = Sql.OpenConnection())
			{
				using (SqlCommand cmd = new SqlCommand("SELECT Id FROM tbLivro WHERE Id = @id AND IdDono = @idDono", conn))
				{
					cmd.Parameters.AddWithValue("@id", id);
					cmd.Parameters.AddWithValue("@idDono", UCLogin.Usuario.Id);

					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						if (reader.Read() == false)
						{
							Response.Redirect("EdicaoErro.aspx");
							return;
						}
					}
				}

				if (IsPostBack == false)
				{
					int didatico = 0;
					int GeneroID = 0;

					dropGeneros.Items.Add(new ListItem("[SELECIONE]", "0"));

					using (SqlCommand cmd = new SqlCommand("SELECT Id, Nome FROM tbGenero ORDER BY Nome DESC", conn))
					{
						using (SqlDataReader reader = cmd.ExecuteReader())
						{
							while (reader.Read() == true)
							{

								int idGenero = reader.GetInt32(0);
								string nome = reader.GetString(1);
								dropGeneros.Items.Insert(0, new ListItem(nome, id.ToString()));
							}
						}
					}

					using (SqlCommand cmd = new SqlCommand("SELECT Nome, Autor, IdGenero, Didatico, Sinopse FROM tbLivro WHERE Id = @id", conn))
					{
						cmd.Parameters.AddWithValue("@id", id);

						using (SqlDataReader reader = cmd.ExecuteReader())
						{
							if (reader.Read() == true)
							{
								txtNomeLivro.Text = reader.GetString(0);
								txtAutor.Text = reader.GetString(1);
								GeneroID = reader.GetInt32(2);
								didatico = reader.GetInt32(3);
								txtResumo.Text = reader.GetString(4);
							}
							else
							{
								Response.Redirect("EdicaoErro.aspx");
								return;
							}
						}
					}

					dropGeneros.SelectedIndex = GeneroID;
					if (didatico == 0)
					{
						chkDidatico.Checked = true;
					}
					else
					{
						chkNaoDidatico.Checked = true;
					}

					imgLoad.ImageUrl = "Cover.ashx?id=" + id;
				}

			}
		}

		protected void btnSalvar_Click(object sender, EventArgs e)
		{


			lblErroAutor.Text = "";
			lblErroDidatico.Text = "";
			lblErroSinopse.Text = "";
			lblErroLivro.Text = "";
			lblErroGenero.Text = "";
			lblErroCapa.Text = "";

			//NOME DO LIVRO
			if (string.IsNullOrWhiteSpace(txtNomeLivro.Text) || txtNomeLivro.Text.Length > 128)
			{
				lblErroLivro.Text = "Nome do Livro Inválido ou longo demais";
				return;
			}
			string nome = txtNomeLivro.Text.Trim();



			//AUTOR
			if (string.IsNullOrWhiteSpace(txtAutor.Text) || txtAutor.Text.Length > 128)
			{
				lblErroAutor.Text = "Nome do autor inválido ou muito longo";
			}
			string autor = txtAutor.Text.Trim();



			//GENEROS
			ListItem item = dropGeneros.SelectedItem;
			if (item == null)
			{
				lblErroGenero.Text = "Nenhum Item Selecionado";
				return;
			}
			string IdGenerostring = item.Value;
			int idGenero;
			int.TryParse(IdGenerostring, out idGenero);
			if (idGenero == 0)
			{
				lblErroGenero.Text = "Nenhum Item Selecionado";
				return;
			}



			//DIDATICO OU NAO
			int didatico;
			if (chkDidatico.Checked)
			{
				didatico = 1;
			}
			else if (chkNaoDidatico.Checked)
			{
				didatico = 0;
			}
			else
			{
				lblErroDidatico.Text = "Selecione Didático ou Não Didático";
				return;
			}



			//RESUMO
			if (string.IsNullOrWhiteSpace(txtResumo.Text) || txtResumo.Text.Length > 500)
			{
				lblErroSinopse.Text = "Sinopse Inválida ou longa demais";
				return;
			}
			string sinopse = txtResumo.Text.Trim();

			// Se isso fosse um cadastro normal, os demais dados deveriam
			// ser validados aqui, antes de validar o arquivo
			HttpPostedFile foto = null;
			if (txtFoto.HasFile == true)
			{
				foto = txtFoto.PostedFile;

				if (foto.ContentType != "image/png" && foto.ContentType != "image/jpeg")
				{
					lblErroCapa.Text = "Por favor, selecione uma foto PNG ou JPEG";
					return;
				}

				if (foto.ContentLength > 10000000)
				{
					lblErroCapa.Text = "Por favor, selecione uma foto com até 10 MB";
					return;
				}
			}

			try
			{
				using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlTransaction tran = conn.BeginTransaction())
					{
						try
						{
							int id;

							// Cria um comando para inserir um novo registro à tabela
							using (SqlCommand cmd = new SqlCommand("INSERT INTO tbLivro (Nome, NomeNormalizado, Autor, AutorNormalizado, IdGenero, Sinopse, Didatico, Trocado, IdDono) OUTPUT INSERTED.Id VALUES (@nome, @nome, @autor, @autor, @IdGenero, @sinopse, @didatico, 0, @idDono)", conn, tran))
							{
								cmd.Parameters.AddWithValue("@nome", nome);
								cmd.Parameters.AddWithValue("@autor", autor);
								cmd.Parameters.AddWithValue("@IdGenero", idGenero);
								cmd.Parameters.AddWithValue("@sinopse", sinopse);
								cmd.Parameters.AddWithValue("@didatico", didatico);
								cmd.Parameters.AddWithValue("@idDono", UCLogin.Usuario.Id);

								int.TryParse(Request.QueryString["id"], out id);


							}

							if (foto != null)
							{
								ImageSaver.SaveImage(id, foto);
							}

							tran.Commit();
						}
						catch (Exception ex)
						{
							tran.Rollback();

							throw ex;
						}
					}
				}
			}
			catch (Exception ex)
			{
				lblErroGenero.Text = "Erro de banco de dados: " + ex.Message;
				return;
			}

			lblSucesso.Text = "Livro Alterado com sucesso! C:";
		}
	}
}