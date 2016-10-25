using Projeto.Models;
using System;
using System.Data.SqlClient;
using Projeto.Utils;
using Exemplos.Utils;

namespace Projeto
{
	public partial class UCLogin : System.Web.UI.UserControl
	{
		public Usuario Usuario { get; set; }
		public string CaminhoDaImagem { get; set; }
		public bool IgnorarRedir { get; set; }
		public int IdUsuario;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (IgnorarRedir == true)
			{
				return;
			}
			Usuario = Usuario.Validar();
			if (Usuario == null)
			{
				Response.Redirect("Default.aspx", true);
			}
			else
			{
				IdUsuario = Usuario.Id;
				lblNome.Text = Usuario.Nome;
				int count = 0;

				using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlCommand cmd = new SqlCommand("SELECT COUNT(Trocado) FROM tbLivro WHERE idDono=@id AND Trocado=1", conn))

					{
						cmd.Parameters.AddWithValue("@id", Usuario.Id);

						count = (int)cmd.ExecuteScalar();
					}
				}
				lblTrocados.Text = count.ToString();

				string countstring = count.ToString();

				switch (countstring)
				{
					case "0":
						CaminhoDaImagem = "0";
						break;

					case "1":
					case "2":
					case "3":
					case "4":
						CaminhoDaImagem = "1";
						break;


					case "5":
					case "6":
					case "7":
					case "8":
					case "9":
						CaminhoDaImagem = "2";
						break;


					case "10":
					case "11":
					case "12":
					case "13":
					case "14":
						CaminhoDaImagem = "3";
						break;


					case "15":
					case "16":
					case "17":
					case "18":
					case "19":
						CaminhoDaImagem = "4";
						break;

					case "20":
					case "21":
					case "22":
					case "23":
					case "24":
						CaminhoDaImagem = "5";
						break;

					case "25":
					case "26":
					case "27":
					case "28":
					case "29":
						CaminhoDaImagem = "6";
						break;

					case "30":
					case "31":
					case "32":
					case "33":
					case "34":
						CaminhoDaImagem = "7";
						break;
				}
			}
		}
	}
}
