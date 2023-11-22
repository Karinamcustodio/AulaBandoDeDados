using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Intrinsics.X86;
using System.Text;
using System.Threading.Tasks;

namespace AcessandoBancoDeDadosExercicioProduto.Classes
{
    public class Produto 
    {
        public int Id {  get; set; }
        public string Nome {  get; set; }
        public double ValorUnitario { get; set; }
        public int QuantidadeEstoque {  get; set; }
        public Categoria PCategoria { get; set; }

        public Produto() { }
        public Produto(int id, string nome, double valorUnitario, int quantidadeEstoque, Categoria categoria)
        {
            Id = id;
            Nome = nome;
            ValorUnitario = valorUnitario;
            QuantidadeEstoque = quantidadeEstoque;
            PCategoria = categoria;
        }

        public override string ToString()
        {
            return $"Id: {Id}, Produto: {Nome.Trim()}, Valor Unitário: {ValorUnitario}, Quantidade Estoque: {QuantidadeEstoque}, Categoria: {PCategoria.Id.ToString()}";
        }
    }
}
