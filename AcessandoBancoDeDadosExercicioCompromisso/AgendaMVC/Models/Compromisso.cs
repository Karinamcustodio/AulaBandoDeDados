namespace AgendaMVC.Models
{
    public class Compromisso
    {
          // Compromisso deve ter: Id, descrição, data, hora, local, contato e status.
            public int Id { get; set; }
            public string Descricao { get; set; }
            public DateTime DataHora { get; set; }
            public Contato Contato { get; set; }
            public Local Local { get; set; }
    }
}


	