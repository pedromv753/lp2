using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using ProyNeptuno2023MVC.Models;
using ProyNeptuno2023MVC.DAO;

namespace ProyNeptuno2023MVC.Controllers
{
    public class ConsultasController : Controller
    {
        // definimos la variable del DAO
        ConsultasDAO dao = new ConsultasDAO();

        // GET: Consultas
        public ActionResult PedidosCliente(string Codigo = "")
        {
            var listado = dao.PedidosPorCliente(Codigo);

            ViewBag.Cantidad = listado.Count;

            return View(listado);
        }

        // GET: Consultas
        public ActionResult PedidosClienteAnio(string Codigo = "", int anio = 0)
        {
            var listado = dao.PedidosClienteAnio(Codigo, anio);

            ViewBag.Cantidad = listado.Count;

            // recuperar la lista de clientes y almacenarlo en un viewbag
            ViewBag.Clientes = new SelectList(
                dao.ListarClientes(), // Data para al dropdownlist
                "IdCliente", // Nombre del campo principal - PK
                "NombreCliente" // Nombre del campo a mostrarse en el dropdownlist
                );
            //
            return View(listado);
        }

        // paginacion de resultado MVC
        // Paginación de resultados MVC

        public ActionResult PedidosClientePaginacion(int nro_pag = 0,

                               string Codigo = "")

        {

            var listado = dao.PedidosPorCliente(Codigo);
            ViewBag.Cantidad = listado.Count;

            // return View(listado);
            ViewBag.Clientes = new SelectList(

      dao.ListarClientes(),

      "IdCliente",

      "NombreCliente"

      );



            ViewBag.Codigo = Codigo;

            // Paginación

            int n = listado.Count;



            // definir las variables ViewBag necesarias para la vista

            ViewBag.CONTADOR = n;



            // variables para la paginación

            int cant_filas_page = 5;



            // calcular la cantidad de paginas

            //int cant_paginas =

            // (n % cant_filas_page == 0) ? n / cant_filas_page : n / cant_filas_page + 1;



            int cant_paginas = 0;

            if (n % cant_filas_page == 0)

                cant_paginas = n / cant_filas_page;

            else

                cant_paginas = n / cant_filas_page + 1;



            ViewBag.CANT_PAGINAS = cant_paginas;



            // enviamos los datos del modelo a la vista

            return View(listado.Skip(nro_pag * cant_filas_page).Take(cant_filas_page));



        }

        public ActionResult PedidosClienteAnioPaginacion(int nro_pag=0,string Codigo = "", int anio = 0)
        {
            var listado = dao.PedidosClienteAnio(Codigo, anio);

            ViewBag.Cantidad = listado.Count;

            // recuperar la lista de clientes y almacenarlo en un viewbag
            ViewBag.Clientes = new SelectList(
                dao.ListarClientes(), // Data para al dropdownlist
                "IdCliente", // Nombre del campo principal - PK
                "NombreCliente" // Nombre del campo a mostrarse en el dropdownlist
                );
            //

            ViewBag.codigo = Codigo;
            ViewBag.anio = anio;

            //
            int n = listado.Count;



            // definir las variables ViewBag necesarias para la vista

            ViewBag.CONTADOR = n;



            // variables para la paginación

            int cant_filas = 5;



            // calcular la cantidad de paginas

            int cant_paginas = (n % cant_filas == 0) ? n / cant_filas : n / cant_filas + 1;



            ViewBag.CANT_PAGINAS = cant_paginas;



            // enviamos los datos del modelo a la vista

            return View(listado.Skip(nro_pag * cant_filas).Take(cant_filas));


    
        }
    }
}
