using Projeto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            }
        }
    }
}