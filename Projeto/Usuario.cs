using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web;

//***********************************************************************
//Altere esse using para coincidir com o namespace da classe PasswordHash
//***********************************************************************
using Sistema.Utils;

namespace Sistema.Models {
	public class Usuario {
		public const int TamanhoMaximoDoLogin = 32;
		public const int TamanhoMaximoDoNome = 32;
		public const int TamanhoMaximoDoPassword = 20;

		public int Id;
		public string Login;
		public string Nome;
		public string Token;

		public Usuario(int id, string login, string nome, string token) {
			Id = id;
			Login = login;
			Nome = nome;
			Token = token;
		}

		private static Usuario PegarDoCliente() {
			HttpCookie cookie = HttpContext.Current.Request.Cookies["user"];
			if (cookie == null) {
				return null;
			}

			string[] values = cookie.Value.Split('|');
			if (values.Length != 2) {
				return null;
			}

			// O objeto Usuario que vem do cliente tem apenas o Id e o Token
			return new Usuario(int.Parse(values[0]), "", "", values[1]);
		}

		private string EnviarParaCliente() {
			string value = Id + "|" + Token;

			HttpCookie cookie = new HttpCookie("user", value);

			cookie.Expires = DateTime.UtcNow.AddYears(1);

			HttpContext.Current.Response.SetCookie(cookie);

			return "user=" + value + ";";
		}

		private void RemoverDoCliente() {
			HttpCookie cookie = new HttpCookie("user", "");

			cookie.Expires = DateTime.UtcNow.AddYears(-1);

			HttpContext.Current.Response.SetCookie(cookie);
		}

		public static Usuario Criar(string login, string nome, string password) {
			if (string.IsNullOrWhiteSpace(login) || login.Length > TamanhoMaximoDoLogin) {
				throw new Exception("Login inválido");
			}

			if (string.IsNullOrWhiteSpace(nome) || nome.Length > TamanhoMaximoDoNome) {
				throw new Exception("Nome inválido");
			}

			if (string.IsNullOrEmpty(password) || password.Length > TamanhoMaximoDoPassword) {
				throw new Exception("Password inválido");
			}

			using (SqlConnection conn = new SqlConnection("COLE A CONNECTION STRING AQUI")) {

				conn.Open();

				// Para outros SQL Server
				// using (SqlCommand command = new SqlCommand("INSERT INTO tbUsuario (Login, Nome, Password, Token) OUTPUT tbUser.Id VALUES (@login, @nome, @password, '')", conn)) {

				// Para o Azure
				using (SqlCommand command = new SqlCommand("INSERT INTO tbUsuario (Login, Nome, Password, Token) OUTPUT INSERTED.Id VALUES (@login, @nome, @password, '')", conn)) {

					command.Parameters.AddWithValue("@login", login);
					command.Parameters.AddWithValue("@nome", nome);
					command.Parameters.AddWithValue("@password", PasswordHash.CreateHash(password));

					int id = (int)command.ExecuteScalar();

					// Como esse usuário acabou de ser criado, ele não está logado, por isso não tem token
					return new Usuario(id, login, nome, "");
				}
			}
		}

		public static Usuario Validar() {
			Usuario usuario = PegarDoCliente();

			if (usuario == null) {
				return null;
			}

			using (SqlConnection conn = new SqlConnection("COLE A CONNECTION STRING AQUI")) {

				conn.Open();

				using (SqlCommand command = new SqlCommand("SELECT Login, Nome, Token FROM tbUsuario WHERE Id = @id", conn)) {

					command.Parameters.AddWithValue("@id", usuario.Id);

					using (SqlDataReader reader = command.ExecuteReader()) {

						if (reader.Read() == false ||
							string.IsNullOrWhiteSpace(usuario.Token) ||
							string.Equals(usuario.Token, reader.GetString(2), StringComparison.Ordinal) == false) {

							return null;
						}

						usuario.Login = reader.GetString(0);
						usuario.Nome = reader.GetString(1);
					}
				}
			}

			return usuario;
		}

		public static Usuario ValidarException() {
			Usuario usuario = Validar();

			if (usuario == null) {
				throw new Exception("Usuário inválido ou não conectado");
			}

			return usuario;
		}

		public static string FazerLogin(string login, string password) {
			int id;
			string hash;

			using (SqlConnection conn = new SqlConnection("COLE A CONNECTION STRING AQUI")) {

				conn.Open();

				using (SqlCommand command = new SqlCommand("SELECT Id, Password FROM tbUsuario WHERE Login = @login", conn)) {

					command.Parameters.AddWithValue("@login", login);

					using (SqlDataReader reader = command.ExecuteReader()) {
						if (reader.Read() == false) {
							return null;
						}

						id = reader.GetInt32(0);
						hash = reader.GetString(1);
					}
				}

				if (PasswordHash.ValidatePassword(password, hash)) {
					using (SqlCommand command = new SqlCommand("UPDATE tbUsuario SET Token = @token WHERE Id = @id", conn)) {

						string token = Guid.NewGuid().ToString("N");
						command.Parameters.AddWithValue("@token", token);
						command.Parameters.AddWithValue("@id", id);

						command.ExecuteNonQuery();

						// Tanto o nome quanto o login não interessam para enviar para o cliente
						Usuario usuario = new Usuario(id, "", "", token);

						return usuario.EnviarParaCliente();
					}
				}
			}

			return null;
		}

		public void FazerLogout() {
			using (SqlConnection conn = new SqlConnection("COLE A CONNECTION STRING AQUI")) {

				conn.Open();

				using (SqlCommand command = new SqlCommand("UPDATE tbUsuario SET Token = '' WHERE Id = @id", conn)) {

					command.Parameters.AddWithValue("@id", Id);

					command.ExecuteNonQuery();

					RemoverDoCliente();
				}
			}
		}
	}
}
