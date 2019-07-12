using System.Collections.Generic;

namespace TesteUds.Models
{
    public class PedidoModel
    {
        public PedidoModel()
        {
          ListPersonalizacao = new List<PersonalizacaoModel>();
        }

        public int Id { get; set; }

        public string Tamanho{ get; set; }

        public string Sabor { get; set; }

        public decimal Valor { get; set; }

        public int? TempoTotal { get; set; }

        public decimal? ValorTotal { get; set; }

        public List<PersonalizacaoModel> ListPersonalizacao{ get; set; }

    }
}