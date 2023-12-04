namespace AgendaMVC.Dados
{
	public class DataBase
	{
        public static List<Models.Contato> contatos = new() 
        { new Models.Contato() { Id = 1, Nome = "Karina", Email = "karina@gmail.com", Telefone = "(47)996161518" } };
        
        public static List<Models.Local> locais = new() 
        { new Models.Local() { Id = 1, NomeLocal = "Proway", Rua = "7 de Setembro", Numero = "1600", Bairro = "Centro", Cidade = "Blumenau", Uf = "SC", Cep = "89010-204" } };

        public static List<Models.Compromisso> compromissos = new() 
        { new Models.Compromisso() { Id = 1, Descricao = "AulaC#", DataHora = DateTime.Now,
            Contato = new Models.Contato() { Id = 1, Nome = "Karina", Email = "karina@gmail.com", Telefone = "(47)996161518" },
            Local = new Models.Local() { Id = 1, NomeLocal = "Proway", Rua = "7 de Setembro", Numero = "1600", Bairro = "Centro", Cidade = "Blumenau", Uf = "SC", Cep = "89010-204" } } };
    }
}
