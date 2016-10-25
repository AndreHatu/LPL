using Exemplos.Utils;
using Projeto.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projeto
{
	public partial class Validar : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string sid = Request.QueryString["id"];
			string guid = Request.QueryString["guid"];
			int id;

			if (int.TryParse(sid, out id) == true)
			{
				//validar no banco de dados

				using (SqlConnection conn = Sql.OpenConnection())
				{
					using (SqlCommand command = new SqlCommand("SELECT guid FROM tbUsuario WHERE id = @id", conn))
					{

						command.Parameters.AddWithValue("@id", id);

						using (SqlDataReader reader = command.ExecuteReader())
						{
							if (reader.Read() == true)
							{
								string guidNoBanco = reader.GetString(0);

								if (guid == guidNoBanco)
								{
									//update

									using (SqlCommand cmd = new SqlCommand("UPDATE tbUsuario SET Validado=1 WHERE id = @id", conn))
									{
										command.Parameters.AddWithValue("@id", id);
									}

									panelErro.Visible = false;
									panelOK.Visible = true;
								}
							}
						}
					}
				}
			}
		}
	}
}
