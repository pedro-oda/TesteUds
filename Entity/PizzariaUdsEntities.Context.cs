﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TesteUds.Entity
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class PizzariaUdsEntities : DbContext
    {
        public PizzariaUdsEntities()
            : base("name=PizzariaUdsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Pedido> Pedido { get; set; }
        public virtual DbSet<PedidoPersonalizacao> PedidoPersonalizacao { get; set; }
        public virtual DbSet<Personalizacao> Personalizacao { get; set; }
        public virtual DbSet<Sabor> Sabor { get; set; }
        public virtual DbSet<Tamanho> Tamanho { get; set; }
    
        [DbFunction("PizzariaUdsEntities", "Fn_Pedido")]
        public virtual IQueryable<Fn_Pedido_Result> Fn_Pedido(Nullable<int> pedidoId)
        {
            var pedidoIdParameter = pedidoId.HasValue ?
                new ObjectParameter("pedidoId", pedidoId) :
                new ObjectParameter("pedidoId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<Fn_Pedido_Result>("[PizzariaUdsEntities].[Fn_Pedido](@pedidoId)", pedidoIdParameter);
        }
    }
}