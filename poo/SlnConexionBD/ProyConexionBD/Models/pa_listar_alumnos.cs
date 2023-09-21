using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyConexionBD.Models
{
    public class pa_listar_alumnos
    {
        public int codalu { get; set; }
        public string nomalu { get; set; }
        public decimal pension { get; set; }
        public DateTime fecha_nac { get; set; }
        public int codcar { get; set; }
        public string nomcar { get; set; }
    }
}