using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web;
using Projeto.Utils;
using Exemplos.Utils;

namespace Projeto.Models
{
	public class Usuario
	{
		public const int TamanhoMaximoDoEmail = 128;
		public const int TamanhoMaximoDoNome = 128;
		public const int TamanhoMaximoDoPassword = 32;

		public int Id { get; set; }
		public string Email { get; set; }
		public string Nome { get; set; }
		public DateTime Nascimento { get; set; }
		public string Token { get; set; }
        public string Estado { get; set; }
		public string Livro { get; set; }
		public string LivroMatch { get; set; }


		public Usuario()
		{

		}
		public Usuario(int id, string token)
		{
			Id = id;
			Token = token;
		}

		public Usuario(int id, string email, string nome, DateTime nascimento)
		{
			Id = id;
			Email = email;
			Nome = nome;
			Nascimento = nascimento;
		}

		private static Usuario PegarDoCliente()
		{
			HttpCookie cookie = HttpContext.Current.Request.Cookies["user"];
			if (cookie == null)
			{
				return null;
			}

			string[] values = cookie.Value.Split('|');
			if (values.Length != 2)
			{
				return null;
			}

			// O objeto Usuario que vem do cliente tem apenas o Id e o Token
			return new Usuario(int.Parse(values[0]), values[1]);
		}

		private string EnviarParaCliente()
		{
			string value = Id + "|" + Token;

			HttpCookie cookie = new HttpCookie("user", value);

			cookie.Expires = DateTime.UtcNow.AddYears(1);

			HttpContext.Current.Response.SetCookie(cookie);

			return "user=" + value + ";";
		}

		private void RemoverDoCliente()
		{
			HttpCookie cookie = new HttpCookie("user", "");

			cookie.Expires = DateTime.UtcNow.AddYears(-1);

			HttpContext.Current.Response.SetCookie(cookie);
		}

		public static Usuario Criar(string email, string nome, DateTime nascimento, string password, string estado)
		{
            if (string.IsNullOrWhiteSpace(email) || email.Length > TamanhoMaximoDoEmail)
            {
                throw new Exception("E-mail inválido");
            }

            if (string.IsNullOrWhiteSpace(nome) || nome.Length > TamanhoMaximoDoNome)
            {
                throw new Exception("Nome inválido");
            }

            if (string.IsNullOrEmpty(password) || password.Length > TamanhoMaximoDoPassword)
            {
                throw new Exception("Password inválido");
            }



            using (SqlConnection conn = Sql.OpenConnection())
			{

				//conn.Open();

				// Para outros SQL Server
				// using (SqlCommand command = new SqlCommand("INSERT INTO tbUsuario (Login, Nome, Password, Token) OUTPUT tbUser.Id VALUES (@login, @nome, @password, '')", conn)) {

				// Para o Azure
				using (SqlCommand command = new SqlCommand("INSERT INTO tbUsuario (Email, Nome, Nascimento, Password, Token) OUTPUT INSERTED.Id VALUES (@email, @nome, @nascimento, @password, '')", conn))
				{

					command.Parameters.AddWithValue("@email", email);
					command.Parameters.AddWithValue("@nome", nome);
                    command.Parameters.AddWithValue("@nascimento", nascimento);
					command.Parameters.AddWithValue("@password", PasswordHash.CreateHash(password));

					int id = (int)command.ExecuteScalar();

					// Como esse usuário acabou de ser criado, ele não está logado, por isso não tem token
					return new Usuario(id, email, nome, nascimento);
				}
			}
		}

		public static Usuario Validar()
		{
			Usuario usuario = PegarDoCliente();

			if (usuario == null)
			{
				return null;
			}

			using (SqlConnection conn = Sql.OpenConnection())
			{

				//conn.Open();

				using (SqlCommand command = new SqlCommand("SELECT Email, Nome, Token FROM tbUsuario WHERE Id = @id", conn))
				{

					command.Parameters.AddWithValue("@id", usuario.Id);

					using (SqlDataReader reader = command.ExecuteReader())
					{

						if (reader.Read() == false ||
							string.IsNullOrWhiteSpace(usuario.Token) ||
							string.Equals(usuario.Token, reader.GetString(2), StringComparison.Ordinal) == false)
						{

							return null;
						}

						usuario.Email = reader.GetString(0);
						usuario.Nome = reader.GetString(1);
					}
				}
			}

			return usuario;
		}

		public static Usuario ValidarException()
		{
			Usuario usuario = Validar();

			if (usuario == null)
			{
				throw new Exception("Usuário inválido ou não conectado");
			}

			return usuario;
		}

		public static string FazerLogin(string email, string password)
		{
			int id;
			string hash;

			using (SqlConnection conn = Sql.OpenConnection())
			{

				//conn.Open();

				using (SqlCommand command = new SqlCommand("SELECT Id, Password FROM tbUsuario WHERE Email = @email", conn))
				{

					command.Parameters.AddWithValue("@email", email);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						if (reader.Read() == false)
						{
							return null;
						}

						id = reader.GetInt32(0);
						hash = reader.GetString(1);
					}
				}

				if (PasswordHash.ValidatePassword(password, hash))
				{
					using (SqlCommand command = new SqlCommand("UPDATE tbUsuario SET Token = @token WHERE Id = @id", conn))
					{

						string token = Guid.NewGuid().ToString("N");
						command.Parameters.AddWithValue("@token", token);
						command.Parameters.AddWithValue("@id", id);

						command.ExecuteNonQuery();

						// Tanto o nome quanto o login não interessam para enviar para o cliente
						Usuario usuario = new Usuario(id, token);

						return usuario.EnviarParaCliente();
					}
				}
			}

			return null;
		}

		public void FazerLogout()
		{
			using (SqlConnection conn = Sql.OpenConnection())
			{

				//conn.Open();

				using (SqlCommand command = new SqlCommand("UPDATE tbUsuario SET Token = '' WHERE Id = @id", conn))
				{

					command.Parameters.AddWithValue("@id", Id);

					command.ExecuteNonQuery();

					RemoverDoCliente();
				}
			}
		}
	}
}
