using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projeto.Models
{
	public class Livro
	{
		public int Id { get; set; }
		public int IdDono { get; set; }
		public string Nome { get; set; }
		public string NomeNormalizado { get; set; }
		public string Autor { get; set; }
		public string AutorNormalizado { get; set; }
		public int IdGenero { get; set; }
		public string Genero { get; set; }
		public string Sinopse { get; set; }
		public int Didatico { get; set; }
		public int Trocado  { get; set; }
	}
}
