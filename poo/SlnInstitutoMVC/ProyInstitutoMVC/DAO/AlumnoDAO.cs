using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

// importar a los modelos
using ProyInstitutoMVC.Models;

namespace ProyInstitutoMVC.DAO
{
    public class AlumnoDAO
    {
        // variable que almacene los datos en una
        // colección
        private static List<Alumno> alumnos = new List<Alumno>()
        {
            new Alumno(1001, "Fernando Torres", 
                new DateTime(2001,4,24), "Lima", 450),
            new Alumno(1002, "Paola Saavedra",
                new DateTime(2002, 10, 10), "SJL", 420),
            new Alumno(1003, "Manuel Rengifo",
                new DateTime(2001,12,2), "SJL", 450),
            new Alumno(1004, "Pedro Sanchez",
                new DateTime(2001, 6, 20), "Rimac", 420)
        };

        public string GrabarAlumno(Alumno obj)
        { 
            alumnos.Add(obj);
            return "El alumno: " + obj.nom_alumno + 
                   " fué registrado correctamente";
        }

        public List<Alumno> ListarAlumnos()
        {
            return alumnos;
        }

        public List<Alumno> ListarAlumnosDistrito(string nomdis)
        {
            //var listado = alumnos.Where(a => a.distrito.ToUpper().Equals(nomdis.ToUpper()))
            //                     .ToList();

            var listado = alumnos.Where(a => a.distrito.Equals(nomdis))
                                 .ToList();

            return listado;
        }

        public List<Alumno> ListarAlumnosPension(double xpension)
        {
            var listado = alumnos.Where(a => a.pension >= xpension)
                                 .ToList();

            return listado;
        }

    } 
}