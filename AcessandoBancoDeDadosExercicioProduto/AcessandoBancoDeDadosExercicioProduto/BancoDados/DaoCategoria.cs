using AcessandoBancoDeDadosExercicioProduto.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessandoBancoDeDadosExercicioProduto.BancoDados
{
    class DaoCategoria
    {
        public bool adicionar(Categoria categoria)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=bd_gerenciarProduto;Integrated Security=True;Connect Timeout=30;Encrypt=False";
                
                SqlCommand catg = new SqlCommand();
                catg.CommandType = CommandType.Text;
                catg.CommandText = "INSERT INTO categoria([descricao])VALUES(@descricao)";

                catg.Parameters.Add("descricao", SqlDbType.NVarChar).Value = categoria.Descricao;

                con.Open();
                catg.Connection = con;

                /*executa a conexão*/
                return catg.ExecuteNonQuery() > 0;
            }
        }

        public Categoria consultar(int id)
        {
            Categoria cat = new Categoria();

            if (id > 0)
            {
                cat.Id = id;
            }
            return cat;
        }

        public List<Categoria> consultar()
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=bd_gerenciarProduto;Integrated Security=True;Connect Timeout=30;Encrypt=False";

                SqlCommand catg = new SqlCommand();
                catg.CommandType = CommandType.Text;
                catg.CommandText = "SELECT * FROM categoria";

                con.Open();
                catg.Connection = con;

                /*executa a conexão*/
                SqlDataReader dr;
                dr = catg.ExecuteReader();

                List<Categoria> categorias = new List<Categoria>();

                while (dr.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.Id = Convert.ToInt32(dr["id"]);
                    categoria.Descricao = Convert.ToString(dr["descricao"]);
                    categorias.Add(categoria);
                }
                return categorias;
            }
        }
        
        public bool alterar(Categoria categoria)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=bd_gerenciarProduto;Integrated Security=True;Connect Timeout=30;Encrypt=False";

                SqlCommand cat = new SqlCommand();
                cat.CommandType = CommandType.Text;
                cat.CommandText = "UPDATE categoria SET Descricao = @Descricao WHERE Id = @Id;";

                cat.Parameters.Add("@Descricao", SqlDbType.NVarChar).Value = categoria.Descricao;
                cat.Parameters.Add("@Id", SqlDbType.NVarChar).Value = categoria.Id;

                con.Open();
                cat.Connection = con;

                /*executa a conexão*/
                return cat.ExecuteNonQuery() > 0;
            }
        }

        public bool deletar(Categoria categoria)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=bd_gerenciarProduto;Integrated Security=True;Connect Timeout=30;Encrypt=False";

                SqlCommand cat = new SqlCommand();
                cat.CommandType = CommandType.Text;
                cat.CommandText = "DELETE FROM categoria WHERE Id = @Id;";

                cat.Parameters.Add("@Id", SqlDbType.NVarChar).Value = categoria.Id;

                con.Open();
                cat.Connection = con;

                /*executa a conexão*/
                return cat.ExecuteNonQuery() > 0;
            }
        }
    }
}
