using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projeto.Models
{
	public class Match
	{
		public class Curtida
		{
			public int IdUsuario { get; set; }
			public int IdLivro { get; set; }
			public string NomeUsuario { get; set; }
			public string NomeMatch { get; set; }
			public string LivroNomeUsuario { get; set; }
			public string LivroNomeMatch { get; set; }



		}
	}
}
