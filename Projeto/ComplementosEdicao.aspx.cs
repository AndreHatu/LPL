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
	public partial class ComplementosEdicao : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}
		protected void UCLogin_Load(object sender, EventArgs e)
		{
			int id = UCLogin.Usuario.Id;

			using (SqlConnection conn = Sql.OpenConnection())
			{
				using (SqlCommand cmd = new SqlCommand("select id from tbusuario where id = @id", conn))
				{

					cmd.Parameters.AddWithValue("@id", id);

					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						if (reader.Read() == false)
						{
							Response.Redirect("complementoserro.aspx");
							return;
						}
					}
				}

				if (IsPostBack == false)
				{

					using (SqlCommand cmd = new SqlCommand("select estado, sobremim, celular from tbusuario where id = @id", conn))
					{
						cmd.Parameters.AddWithValue("@id", id);

						using (SqlDataReader reader = cmd.ExecuteReader())
						{
							if (reader.Read() == true)
							{
								object x = reader.GetValue(0);
								dropEstados.SelectedValue = (x == DBNull.Value) ? "" : (string)x;

								x = reader.GetValue(1);
								txtSobremim.Text = (x == DBNull.Value) ? "" : (string)x;

								x = reader.GetValue(2);
								txtCelular.Text = (x == DBNull.Value) ? "" : (string)x;
							}
							else
							{
								Response.Redirect("complementoserro.aspx");
								return;
							}
						}
					}



					imgLoad.ImageUrl = "avatar.ashx?id=" + id;
				}
			}
		}




		protected void btnSalvar_Click(object sender, EventArgs e)
		{
			string estado = "";
			if (dropEstados.SelectedIndex != 0)
			{
				estado = dropEstados.SelectedValue;
			}

			HttpPostedFile foto = null;
			if (fuFoto.HasFile == true)
			{
				foto = fuFoto.PostedFile;

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

			string SobreMim = txtSobremim.Text.Trim();
			if (SobreMim.Length > 500)
			{
				lblErroSobre.Text = "Resumo longo demais";
				return;
			}


			string celular = txtCelular.Text.Trim();
			if (string.IsNullOrWhiteSpace(celular) == false)
			{
				if (txtCelular.Text.Length < 10)
				{
					lblErroCelular.Text = "Celular Inválido";
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


							int id = UCLogin.Usuario.Id;
							// Cria um comando para inserir um novo registro à tabela
							using (SqlCommand cmd = new SqlCommand("UPDATE tbUsuario SET Estado=@estado, Sobremim=@sobreMim, Celular=@celular WHERE id=@id", conn, tran))
							{
								cmd.Parameters.AddWithValue("@estado", estado);
								cmd.Parameters.AddWithValue("@sobreMim", SobreMim);
								cmd.Parameters.AddWithValue("@celular", celular);
								cmd.Parameters.AddWithValue("@id", UCLogin.Usuario.Id);

								cmd.ExecuteNonQuery();
							}

							if (foto != null)
							{
								AvatarSaver.SaveImage(id, foto);
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
				lblErroCapa.Text = "Erro de banco de dados: " + ex.Message;
				return;
			}

			lblSucesso.Text = "Perfil Alterado com sucesso! Clique aqui para voltar para a página principal.";
			
        }
	}
}
