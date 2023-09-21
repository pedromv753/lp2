using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyNeptuno2023MVC.Models
{
    public class pa_pedidos_cliente
    {
        public int IdPedido { get; set; }
        public DateTime FechaPedido { get; set; }
        public string Apellidos { get; set; }
        public decimal Importe { get; set; }

    }
}