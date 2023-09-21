using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

// importar a los modelos
using ProyInstitutoMVC.Models;
// importar a los DAO
using ProyInstitutoMVC.DAO;

namespace ProyInstitutoMVC.Controllers
{
    public class AlumnoController : Controller
    {
        // definir la variable global para el DAO
        AlumnoDAO dao = new AlumnoDAO();

        List<string> lista_distritos = new List<string>() 
        {
            "Lima", "SJL", "Rimac", "Magdalena", "Los Olivos" 
        };

        // GET: Alumno
        public ActionResult IndexAlumno()
        {
            // obtener los datos del modelo
            //List<Alumno> listado = dao.ListarAlumnos();
            var listado = dao.ListarAlumnos();
            
            // para enviarlos a la vista
            return View(listado);
        }

        public ActionResult AlumnosPension(double pension=0)
        {
            var listado = dao.ListarAlumnosPension(pension);
            //
            return View(listado);
        }

        public ActionResult AlumnosDistrito(string nombre="")
        {
            var listado = dao.ListarAlumnosDistrito(nombre);
            
            // enviando la lista de distritos "List<string>" a la vista
            // para poblar un DropDownList = ComboBox 
            ViewBag.DISTRITOS = new SelectList(lista_distritos);
            
            //
            return View(listado);

            //return View(dao.ListarAlumnosDistrito(nombre));
        }


    }
}