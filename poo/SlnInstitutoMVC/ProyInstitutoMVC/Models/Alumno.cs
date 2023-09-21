using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyInstitutoMVC.Models
{
    public class Alumno
    {
        // propiedad: escribimos "prop" y 1 TAB
        public int cod_alumno { get; set; }
        public string nom_alumno { get; set; }
        public DateTime fecha_nac { get; set; }
        public string distrito { get; set; }
        public double pension { get; set; }

        // constructor: escribir "ctor" y 1 TAB
        public Alumno() { }
        public Alumno(int cod, string nom, DateTime fec,
                      string dis, double pen)
        {
            cod_alumno = cod;
            nom_alumno = nom;
            fecha_nac = fec;
            distrito = dis;
            pension = pen;
        }

    }
 
}