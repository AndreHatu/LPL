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
        public int IdUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
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
					using (SqlCommand cmd = new SqlCommand("SELECT COUNT(Trocado) FROM tbLivro WHERE idDono=@id", conn))

					{
						cmd.Parameters.AddWithValue("@id", Usuario.Id);

						count = (int) cmd.ExecuteScalar();
					}
				}
				lblTrocados.Text = count.ToString();
			}
        }
    }
}