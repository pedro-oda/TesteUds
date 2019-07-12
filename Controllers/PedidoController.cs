using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using System.Web.Routing;
using TesteUds.Entity;
using TesteUds.Models;

namespace TesteUds.Controllers
{
    [RoutePrefix("api/pedido")]
    public class PedidoController : ApiController
    {
        [HttpPost]
        [Route("cadastro")]
        /// <summary>
        /// Endpoint de inicialização de pedido, neste endPoint são definidos os primeiros parametros do pedido como sabor e tamanho.
        /// </summary>
        public IHttpActionResult CadastrarPedido([FromBody] RequestApiParameters parameters)
        {
            var model = new Pedido();

            using (var context = new PizzariaUdsEntities())
            {
                var tamanho = context.Tamanho.FirstOrDefault(t => t.Tamanho1.ToLower() == parameters.Tamanho.ToLower());

                if (tamanho == null)
                    return BadRequest("O tamanho da pizza informado não foi encontrado!");

                var sabor = context.Sabor.FirstOrDefault(s => s.Sabor1.ToLower() == parameters.Sabor.ToLower());

                if (sabor == null)
                    return BadRequest("O sabor da pizza informado não foi encontrado!");


                model.SaborId = sabor.Id;
                model.TamanhoId = tamanho.Id;

                context.Entry(model).State = EntityState.Added;
                context.SaveChanges();
            }

            return Ok(model.Id);
        }

        [HttpPost]
        [Route("pedido-personalizacao")]
        /// <summary>
        /// Endpoint de personalização de pedido, neste endPoint deve ser informado o Id do pedido que 
        /// esta em andamento para que seja possivel personalizar
        /// </summary>
        public IHttpActionResult PersonalizarPedido([FromBody] RequestApiParameters parameters)
        {
            var model = new PedidoModel();
            using (var context = new PizzariaUdsEntities())
            {
                var pedido = context.Pedido.FirstOrDefault(p => p.Id == parameters.PedidoId);

                if (pedido == null)
                    return BadRequest("O pedido não foi encontrado!");


                if (parameters.ListPersonalizacao != null && parameters.ListPersonalizacao.Count > 0)
                {
                    var listPersonalizacao = new List<PedidoPersonalizacao>();

                    foreach (var personalizacao in parameters.ListPersonalizacao.Distinct(StringComparer.InvariantCultureIgnoreCase))
                    {
                        var personalizacaoModel = context.Personalizacao.FirstOrDefault(p => p.Personalizacao1.ToLower() == personalizacao.ToLower());

                        if (personalizacaoModel == null)
                            return BadRequest($"A personalização {personalizacao} não foi encontrada!");

                        var pizzaPersonalizacaoModel = new PedidoPersonalizacao();
                        pizzaPersonalizacaoModel.PedidoId = pedido.Id;
                        pizzaPersonalizacaoModel.PersonalizacaoId = personalizacaoModel.Id;

                        model.ListPersonalizacao.Add(new PersonalizacaoModel
                        {
                            Id = personalizacaoModel.Id,
                            Tempo = personalizacaoModel.Tempo,
                            Personalizacao = personalizacaoModel.Personalizacao1,
                            Valor = personalizacaoModel.Valor
                        });

                        listPersonalizacao.Add(pizzaPersonalizacaoModel);
                    }
                    foreach (var item in listPersonalizacao)
                    {
                        context.Entry(item).State = EntityState.Added;
                    }
                    context.SaveChanges();

                    var pedido_Result = context.Fn_Pedido(parameters.PedidoId).FirstOrDefault();
                    model.Sabor = pedido_Result.sabor;
                    model.Tamanho = pedido_Result.tamanho;
                    model.TempoTotal = pedido_Result.tempoTotal;
                    model.Valor = pedido_Result.valor;
                    model.ValorTotal = pedido_Result.valorTotal;
                }

            }
            return Ok(model);

        }

        [HttpPost]
        [Route("resumo-pedido")]
        /// <summary>
        /// Endpoint que traz o resumo de um pedido realizado, nele precisa ser informado o Id do pedido em que deseja pegar o resumo
        /// </summary>
        public IHttpActionResult ResumoPedido([FromBody] RequestApiParameters parameters)
        {
            var model = new PedidoModel();
            using (var context = new PizzariaUdsEntities())
            {
                var pedido_Result = context.Fn_Pedido(parameters.PedidoId).FirstOrDefault();

                if (pedido_Result == null)
                    return BadRequest("O pedido não foi encontrado!");

                model.Sabor = pedido_Result.sabor;
                model.Tamanho = pedido_Result.tamanho;
                model.TempoTotal = pedido_Result.tempoTotal;
                model.Valor = pedido_Result.valor;
                model.ValorTotal = pedido_Result.valorTotal;

                var listPersonalizacoes = context.PedidoPersonalizacao.Include(p => p.Personalizacao).Where(p => p.PedidoId == parameters.PedidoId).ToList();

                if (listPersonalizacoes != null && listPersonalizacoes.Count > 0)
                {
                    foreach (var item in listPersonalizacoes)
                    {
                        model.ListPersonalizacao.Add(new PersonalizacaoModel
                        {
                            Id = item.PersonalizacaoId,
                            Personalizacao = item.Personalizacao.Personalizacao1,
                            Valor = item.Personalizacao.Valor,
                            Tempo = item.Personalizacao.Tempo
                        });
                    }
                }

            }
            return Ok(model);

        }
    }


    public class RequestApiParameters
    {
        public int PedidoId { get; set; }

        public string Tamanho { get; set; }

        public string Sabor { get; set; }

        public List<string> ListPersonalizacao { get; set; }
    }

}