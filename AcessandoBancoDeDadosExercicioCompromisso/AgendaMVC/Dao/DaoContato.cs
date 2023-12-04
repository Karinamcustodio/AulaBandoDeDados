using AgendaMVC.Interfaces;
using AgendaMVC.Models;
using System.Data;
using System.Data.SqlClient;

namespace AgendaMVC.Dao
{
    public class DaoContato : ICrud<Contato>
    {
        public bool create(Contato contato)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = DaoConexao.stringConexao;
                
                SqlCommand cn = new SqlCommand();
                cn.CommandType = CommandType.Text;
                cn.CommandText = "insert into contato([nome],[email],[telefone])values(@nome,@email,@telefone)";

                cn.Parameters.Add("nome", SqlDbType.NVarChar).Value = contato.Nome;
                cn.Parameters.Add("email", SqlDbType.NVarChar).Value = contato.Email;
                cn.Parameters.Add("telefone", SqlDbType.NVarChar).Value = contato.Telefone;

                con.Open();
                cn.Connection = con;

                return cn.ExecuteNonQuery() > 0;
            }
        }

        public void delete(int id)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = DaoConexao.stringConexao;

                SqlCommand cn = new SqlCommand();
                cn.CommandType = CommandType.Text;
                cn.CommandText = "delete from contato where id = @id";
                cn.Parameters.AddWithValue("id", id);

                con.Open();
                cn.Connection = con;

                cn.ExecuteReader();
            }
        }

        public Contato details(int id)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = DaoConexao.stringConexao;

                SqlCommand cn = new SqlCommand();
                cn.CommandType = CommandType.Text;
                cn.CommandText = "select * from contato where id = @id";
                cn.Parameters.AddWithValue("id", id);

                con.Open();
                cn.Connection = con;

                SqlDataReader dr;
                dr = cn.ExecuteReader();

                Contato ct = new Contato();
                while (dr.Read())
                {
                    ct.Id = Convert.ToInt32(dr["id"]);
                    ct.Nome = Convert.ToString(dr["nome"]);
                    ct.Email = Convert.ToString(dr["email"]);
                    ct.Telefone = Convert.ToString(dr["telefone"]);
                }
                return ct;
            }
        }

        public List<Contato> details()
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = DaoConexao.stringConexao;

                SqlCommand cn = new SqlCommand();
                cn.CommandType = CommandType.Text;
                cn.CommandText = "select * from contato";

                con.Open();
                cn.Connection = con;

                SqlDataReader dr;
                dr = cn.ExecuteReader();

                List<Contato> contatos = new List<Contato>();
                while (dr.Read())
                {
                    Contato ct = new Contato();
                    ct.Id = Convert.ToInt32(dr["id"]);
                    ct.Nome = Convert.ToString(dr["nome"]);
                    ct.Email = Convert.ToString(dr["email"]);
                    ct.Telefone = Convert.ToString(dr["telefone"]);
                    contatos.Add(ct);
                }
                return contatos;
            }
        }

        public bool edit(Contato contato)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = DaoConexao.stringConexao;

                SqlCommand cn = new SqlCommand();
                cn.CommandType = CommandType.Text;
                cn.CommandText = "update contato set [nome] = @nome, [email] = @email, [telefone] = @telefone,) where[id] = @id";

                cn.Parameters.Add("nome", SqlDbType.NVarChar).Value = contato.Nome;
                cn.Parameters.Add("email", SqlDbType.NVarChar).Value = contato.Email;
                cn.Parameters.Add("telefone", SqlDbType.NVarChar).Value = contato.Telefone;
                cn.Parameters.Add("id", SqlDbType.Int).Value = contato.Id;

                con.Open();
                cn.Connection = con;

                return cn.ExecuteNonQuery() > 0;
            }
        }
    }
}
