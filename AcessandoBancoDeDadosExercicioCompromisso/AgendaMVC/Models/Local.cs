namespace AgendaMVC.Models
{
    public class Local
    {
        //Local deve ter: Id, nome, rua, numero, bairro, cidade, cep e uf.
        public int Id { get; set; }
        public string NomeLocal {  get; set; }
        public string Rua {  get; set; }
        public string Numero { get; set; }
        public string Bairro {  get; set; }
        public string Cidade { get; set;}
        public string Uf { get; set;}
        public string Cep { get; set; }
    }
}
