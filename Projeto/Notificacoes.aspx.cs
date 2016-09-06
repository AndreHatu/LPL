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
	public partial class Notificacoes : System.Web.UI.Page
	{
		public class Dono
		{
			public int Id { get; set; }
			public string Nome { get; set; }
			public string Email { get; set; }
			public List<Livro> LivrosElaGosta { get; set; }
			public List<Livro> LivrosEuGosto { get; set; }
		}

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

		private void Listar()
		{
			List<Dono> donos = new List<Dono>();

			// Cria e abre a conexão com o banco de dados
			using (SqlConnection conn = Sql.OpenConnection())
			{

				// Cria um comando para selecionar registros da tabela
				using (SqlCommand cmd = new SqlCommand(@"
					SELECT tbLivro.Id [IdLivro], tbLivro.Nome [NomeLivro], tbUsuario.Id [IdDono], tbUsuario.Nome [NomeDono], tbUsuario.Email [EmailDono]
					FROM tbLivro
					INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
					INNER JOIN (SELECT DISTINCT tbUsuario.Id
						FROM tbUsuario
						INNER JOIN tbCurtida ON tbUsuario.Id = tbCurtida.IdUsuario
						INNER JOIN tbLivro ON tbCurtida.IdLivro = tbLivro.Id
						WHERE tbLivro.IdDono = @iddono AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0) temp ON tbLivro.IdDono = temp.Id
					INNER JOIN tbUsuario ON tbLivro.IdDono = tbUsuario.Id
					WHERE tbCurtida.IdUsuario = @iddono AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0
					ORDER BY tbUsuario.Id, tbLivro.Nome"
					, conn))
				{
					cmd.Parameters.AddWithValue("@iddono", UCLogin.Usuario.Id);

					Dono ultimoDono = null;

					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						//Obtém os registros, um por vez
						while (reader.Read() == true)
						{
							//[IdLivro], [NomeLivro], [IdDono], [NomeDono], [EmailDono]
							int IdDono = reader.GetInt32(2);

							if (ultimoDono == null || ultimoDono.Id != IdDono)
							{
								ultimoDono = new Dono();
								ultimoDono.Id = IdDono;
								ultimoDono.Nome = reader.GetString(3);
								ultimoDono.Email = reader.GetString(4);
								ultimoDono.LivrosElaGosta = new List<Livro>();
								ultimoDono.LivrosEuGosto = new List<Livro>();
								donos.Add(ultimoDono);
							}

							Livro livro = new Livro();
							livro.Id = reader.GetInt32(0);
							livro.IdDono = IdDono;
							livro.Nome = reader.GetString(1);
							ultimoDono.LivrosEuGosto.Add(livro);
						}
					}
				}
				for (int i = 0; i < donos.Count; i++)
				{
					// Cria um comando para selecionar registros da tabela
					using (SqlCommand cmd = new SqlCommand(@"
						SELECT tbLivro.Id [IdLivro], tbLivro.Nome [NomeLivro]
						FROM tbLivro
						INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
						WHERE tbCurtida.IdUsuario = @iddono AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0 AND tbLivro.IdDono = @meuid
						ORDER BY tbLivro.Nome"
						, conn))
					{
						cmd.Parameters.AddWithValue("@iddono", donos[i].Id);
						cmd.Parameters.AddWithValue("@meuid", UCLogin.Usuario.Id);

						using (SqlDataReader reader = cmd.ExecuteReader())
						{
							//Obtém os registros, um por vez
							while (reader.Read() == true)
							{
								//[IdLivro], [NomeLivro]
								Livro livro = new Livro();
								livro.Id = reader.GetInt32(0);
								livro.IdDono = UCLogin.Usuario.Id;
								livro.Nome = reader.GetString(1);
								donos[i].LivrosElaGosta.Add(livro);
							}
						}
					}

				}
			}

			listRepeater.DataSource = donos;
			listRepeater.DataBind();

            if (donos.Count == 0)
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

		protected void listRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				Dono dono = (Dono)e.Item.DataItem;
				Repeater listRepeaterLivrosElaGosta = (Repeater)e.Item.FindControl("listRepeaterLivrosElaGosta");
				listRepeaterLivrosElaGosta.DataSource = dono.LivrosElaGosta;
				listRepeaterLivrosElaGosta.DataBind();
				Repeater listRepeaterLivrosEuGosto = (Repeater)e.Item.FindControl("listRepeaterLivrosEuGosto");
				listRepeaterLivrosEuGosto.DataSource = dono.LivrosEuGosto;
				listRepeaterLivrosEuGosto.DataBind();
			}
		}
	}
}