using AgendaMVC.Interfaces;
using AgendaMVC.Models;
using System.Data.SqlClient;
using System.Data;

namespace AgendaMVC.Dao
{
    public class DaoLocal : ICrud<Local>
    {
        public bool create(Local local)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = DaoConexao.stringConexao; 

                SqlCommand cn = new SqlCommand();
                cn.CommandType = CommandType.Text;
                cn.CommandText = "insert into local([nomeLocal],[rua],[numero],[bairro],[cidade],[uf],[cep])values(@nomeLocal,@rua,@numero,@bairro,@cidade,@uf,@cep)";

                cn.Parameters.Add("nomeLocal", SqlDbType.NVarChar).Value = local.NomeLocal;
                cn.Parameters.Add("rua", SqlDbType.NVarChar).Value = local.Rua;
                cn.Parameters.Add("numero", SqlDbType.NVarChar).Value = local.Numero;
                cn.Parameters.Add("bairro", SqlDbType.NVarChar).Value = local.Bairro;
                cn.Parameters.Add("cidade", SqlDbType.NVarChar).Value = local.Cidade;
                cn.Parameters.Add("uf", SqlDbType.NVarChar).Value = local.Uf;
                cn.Parameters.Add("cep", SqlDbType.NVarChar).Value = local.Cep;

                con.Open();
                cn.Connection = con;

                return cn.ExecuteNonQuery() > 0;
            }
        }

        public void delete(int id)
        {
            throw new NotImplementedException();
        }

        public Local details(int id)
        {
            throw new NotImplementedException();
        }

        public List<Local> details()
        {
            throw new NotImplementedException();
        }

        public bool edit(Local t)
        {
            throw new NotImplementedException();
        }
    }
}