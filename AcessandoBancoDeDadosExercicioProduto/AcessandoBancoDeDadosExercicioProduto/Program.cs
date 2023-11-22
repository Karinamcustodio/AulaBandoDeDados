using AcessandoBancoDeDadosExercicioProduto.Classes;
using AcessandoBancoDeDadosExercicioProduto.BancoDados;

namespace AcessandoBancoDeDadosExercicioProduto
{
    class Program
    {
        static void Main(string[] args)
        {
            //cadastrarCategoria();
            //consultarCategoria();
            //alterarCategoria();
            deletarCategoria();

            //cadastrarProduto();
            //consultarProduto();
            Console.ReadKey();
        }

        static void cadastrarCategoria()
        {
            Categoria categ = new Categoria(1, "Blusas");
            DaoCategoria daoCategoria = new DaoCategoria();
            if (daoCategoria.adicionar(categ))
            {
                Console.WriteLine("Categoria salva com sucesso!");
            }
        }

        static void consultarCategoria()
        {
            DaoCategoria daoCategoria = new DaoCategoria();
            List<Categoria> categorias = daoCategoria.consultar();
            foreach (Categoria cat in categorias)
            {
                Console.WriteLine(cat.ToString());
            }
        }

        static void alterarCategoria()
        {

            Categoria categorianova = new Categoria(1, "Calça");
            DaoCategoria daoCategoria = new DaoCategoria();
            if (daoCategoria.alterar(categorianova))
            {
                Console.WriteLine("Atualizado com sucesso!");

            };

        }

        static void deletarCategoria()
        {
            Categoria categoria = new Categoria(5);
            Categoria categoria1 = new Categoria(6);
            DaoCategoria daoCategoria = new DaoCategoria();
            if (daoCategoria.deletar(categoria)) 
            {
                Console.WriteLine("Deletado");
            };
            if (daoCategoria.deletar(categoria1))
            {
                Console.WriteLine("Deletado");
            };
           
        }

        static void cadastrarProduto()
        {
            Categoria cat = new Categoria() { Id=5, Descricao="Saia"};

            Produto prod = new Produto(1, "Top de alça", 12.20, 2, cat);
            DaoProduto daoProduto = new DaoProduto();
            if (daoProduto.adicionar(prod))
            {
                Console.WriteLine("Produto salvo com sucesso!");
            }
        }

        static void consultarProduto()
        {
            DaoProduto daoProduto = new DaoProduto();
            List<Produto> produtos = daoProduto.consultar();
            foreach(Produto prod in produtos)
            {
                Console.WriteLine(prod.ToString());
            }
        }
    }
}