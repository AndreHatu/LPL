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
	public partial class cadastro_livros1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (IsPostBack == false)
			{
				dropGeneros.Items.Add(new ListItem("SELECIONE", "0"));
                using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlCommand cmd = new SqlCommand("SELECT Id, Nome FROM tbGenero ORDER BY Nome ASC", conn))
					{
						using (SqlDataReader reader = cmd.ExecuteReader())
						{
							while (reader.Read() == true)
							{
								int idGenero = reader.GetInt32(0);
								string nome = reader.GetString(1);
								dropGeneros.Items.Add(new ListItem(nome, idGenero.ToString()));
							}
						}
					}
				}
			}
		}

		protected void btnCadastrarLivro_Click(object sender, EventArgs e)
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
			HttpPostedFile foto = txtFoto.PostedFile;
			if (foto == null)
			{
				lblErroCapa.Text = "Por favor, selecione uma foto";
				return;
			}

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
                                //*****************************************************************************
                                //MUDAR O ID PRA O USUARIO ATUAL DPS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//
                                //*****************************************************************************

								id = (int)cmd.ExecuteScalar();
							}

							ImageSaver.SaveImage(id, foto);

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

            txtAutor.Text = "";
            txtNomeLivro.Text = "";
            txtResumo.Text = "";
            chkDidatico.Checked = false;
            chkNaoDidatico.Checked = false;
            lblSucesso.Text = "Livro Adicionado com Sucesso! :D";

        }
	}
}