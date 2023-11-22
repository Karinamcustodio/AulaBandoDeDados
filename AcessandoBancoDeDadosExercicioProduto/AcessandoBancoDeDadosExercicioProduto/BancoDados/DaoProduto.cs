using AcessandoBancoDeDadosExercicioProduto.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessandoBancoDeDadosExercicioProduto.BancoDados
{
    class DaoProduto
    {
        public bool adicionar(Produto produto)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=bd_gerenciarProduto;Integrated Security=True;Connect Timeout=30;Encrypt=False";

                SqlCommand prod = new SqlCommand();
                prod.CommandType = CommandType.Text;
                prod.CommandText = "insert into produto([nome],[valorUnitario],[quantidadeEstoque],[categoria_Id])values(@nome,@valorUnitario,@quantidadeEstoque, @categoria_Id)";

                prod.Parameters.Add("nome", SqlDbType.NVarChar).Value = produto.Nome;
                prod.Parameters.Add("valorUnitario", SqlDbType.Decimal).Value = produto.ValorUnitario;
                prod.Parameters.Add("quantidadeEstoque", SqlDbType.Int).Value = produto.QuantidadeEstoque;
                prod.Parameters.Add("categoria_Id", SqlDbType.Int).Value = produto.PCategoria.Id;

                con.Open();
                prod.Connection = con;

                return prod.ExecuteNonQuery() > 0;
            }
        }

        public List<Produto> consultar()
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=bd_gerenciarProduto;Integrated Security=True;Connect Timeout=30;Encrypt=False";

                SqlCommand prod = new SqlCommand();
                prod.CommandType = CommandType.Text;
                prod.CommandText = "select * from produto";

                con.Open();
                prod.Connection = con;

                SqlDataReader dr;
                dr = prod.ExecuteReader();

                List<Produto> produtos = new();

                while (dr.Read())
                {
                    Produto produto = new Produto();
                    produto.Id = Convert.ToInt32(dr["id"]);
                    produto.Nome = Convert.ToString(dr["nome"]);
                    produto.ValorUnitario = Convert.ToDouble(dr["valorUnitario"]);
                    produto.QuantidadeEstoque = Convert.ToInt32(dr["quantidadeEstoque"]);

                    produto.PCategoria = new DaoCategoria().consultar(Convert.ToInt32(dr["categoria_Id"]));
                    produtos.Add(produto);
                }
                return produtos;
            }
        }
    }
}
