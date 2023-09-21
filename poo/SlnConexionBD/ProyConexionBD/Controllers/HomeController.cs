using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

// para leer el archivo web.config
using System.Configuration;
// para utilizar los elementos del proveedor SQL Server
using System.Data;
using System.Data.SqlClient; 

namespace ProyConexionBD.Controllers
{
    public class HomeController : Controller
    {
        // recuperar la cadena de conexion
        string cad_cn = ConfigurationManager.ConnectionStrings["cn1"].ConnectionString;

        string ConectarBD()
        {
            SqlConnection cnx = null;
            string mensaje = "";
            try {
                cnx = new SqlConnection(cad_cn);
                cnx.Open();
                mensaje = "Conexión correcta con la BD";
            }
            catch (Exception ex) {
                mensaje = ex.Message;
            }
            finally {
                if (cnx.State == ConnectionState.Open)
                    cnx.Close();
            }
            return mensaje;
        }

        public ActionResult Index()
        {
            ViewBag.Mensaje = ConectarBD();
            //
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}