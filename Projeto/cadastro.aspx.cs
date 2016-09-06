using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Exemplos.Utils;
using System.Security.Cryptography;
using Projeto.Models;
using Projeto.Utils;


namespace Projeto
{
    public partial class cadastro : System.Web.UI.Page

    {

		private static char[] caracteresInvalidos = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '{', '}', '|', '[', ']', ',', '.', '<', '>', ';', ':', '/', '_', '-', '=', '+', '\'', '\"', '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '^', '´', '`', '~', '¹', '²', '³', '£', '¢', '¬', '§' };

		protected void Page_Load(object sender, EventArgs e)
		{
			Usuario usuario = Usuario.Validar();
			if (usuario != null)
			{
				Response.Redirect("logado_default.aspx");
			}
		}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtNome.Text) || txtNome.Text.Length < 6 || txtNome.Text.IndexOfAny(caracteresInvalidos) >= 0)
            {
                lblNome.Text = "Nome inválido!";
                return;
            }
            else
            {
                lblNome.Text = "";
            }
            DateTime nascimento;
            if (DateTime.TryParse(txtNascimento.Text, System.Globalization.CultureInfo.GetCultureInfo("pt-br"), System.Globalization.DateTimeStyles.None, out nascimento) == false ||
                nascimento >= DateTime.Now)
            {
                lblNascimento.Text = "Nascimento Inválido!";
                return;
            }
            else
            {
                lblNascimento.Text = "";
            }


            string email = txtEmailcadastro.Text.Trim().ToLower();
            int arroba, arroba2, ponto;

            arroba = email.IndexOf('@');
            arroba2 = email.LastIndexOf('@');
            ponto = email.LastIndexOf('.');

            if (arroba <= 0 || ponto <= (arroba + 1) || ponto == (email.Length - 1) || arroba2 != arroba)
            {
                // E-mail inválido!
                lblEmail.Text = "Email Inválido!";
                // O return encerra a execução por aqui
                return;
            }
            else
            {
                lblEmail.Text = "";
            }


            if (string.IsNullOrWhiteSpace(txtCionfEmail.Text) || txtCionfEmail.Text != txtEmailcadastro.Text)
            {
                lblConfEmail.Text = "Email Inválido!";
                return;
            }
            else
            {
                lblConfEmail.Text = "";
            }


            if (string.IsNullOrWhiteSpace(txtSenhaCadastro.Text) || txtSenhaCadastro.Text.Length < 6 || txtSenhaCadastro.Text.Length > 128)
            {
                lblSenha.Text = "Senha muito curta ou Inválida!";
                return;
            }
            else
            {
                lblSenha.Text = "";
            }
            string password = txtSenhaCadastro.Text;


            if (string.IsNullOrWhiteSpace(txtConfSenha.Text) || txtSenhaCadastro.Text != txtConfSenha.Text)
            {
                lblConfSenha.Text = "Senha Não Correspondente!";
                return;
            }
            else
            {
                lblConfSenha.Text = "";
            }

            

            string nome = txtNome.Text.Trim();
            string estado = "SP";

            try
            {
                Models.Usuario.Criar(email, nome, nascimento, password, estado);
            }
            catch (Exception ex)
            {
                if (ex.Message.IndexOf("DUPLICATED", StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    lblEmail.Text = "Email já cadastrado";
                }
                else
                {
                    lblEmail.Text = "Erro de banco de dados: " + ex.Message;
                }
                return;
            }

            try { 
            Models.Usuario.FazerLogin(email, password);
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                Response.Redirect("ComplementosEdicao.aspx");
            }

        }
    }
}
            //***************************************************
            //ERRO AQUI, NAO SEI COMO PEGAR ID DO USUARIO OU USAR AQUELE COISO DE AVATAR 3RD PARTY
            //**********************************************************
            //using (SqlConnection conn = Sql.OpenConnection())
            //{

//	using (SqlTransaction tran = conn.BeginTransaction())
//	{
//		try
//		{
//			int id = ;

//			AvatarSaver.SaveImage(id, foto);

//			tran.Commit();
//		}
//		catch (Exception ex)
//		{
//			tran.Rollback();

//			throw ex;
//		}
//	}
//}
//Response.Redirect("logado_default.aspx");

//using (SqlConnection conn = Sql.OpenConnection())
//{

//    //Cria um comando para inserir um novo registro à tabela

//    using (SqlCommand cmd = new SqlCommand("INSERT INTO tbPessoa (Nome, Email, Localizacao, Nascimento, Password, Token) VALUES (@nome, @email, @localizacao, @nascimento)", conn))
//    {

//        cmd.Parameters.AddWithValue("@Email", email);
//        cmd.Parameters.AddWithValue("@Nome", nome);
//        cmd.Parameters.AddWithValue("@Localizacao", CEP);
//        cmd.Parameters.AddWithValue("@Nascimento", Nascimento);

//        cmd.ExecuteNonQuery();
//    }
//}





//response.redirect("cadastro_livros.aspx");

