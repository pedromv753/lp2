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
using ProyConexionBD.Models;
using System.Web.UI.WebControls;

namespace ProyConexionBD.Controllers
{
    public class ConsultasController : Controller
    {
        // recuperar la cadena de conexion
        string cad_cn = ConfigurationManager.ConnectionStrings["cn1"].ConnectionString;

        private List<pa_listar_alumnos> Listar_Alumnos()
        { 
            var lista = new List<pa_listar_alumnos>();
            //
            SqlConnection cnx = new SqlConnection(cad_cn);
            cnx.Open();

            SqlCommand comando = new SqlCommand("execute pa_listar_alumnos", cnx);
            // comando.CommandType = CommandType.Text;

            SqlDataReader dr = comando.ExecuteReader();

            while (dr.Read()) {
                var obj = new pa_listar_alumnos();
                obj.codalu = dr.GetInt32(0);
                obj.nomalu = dr.GetString(1);
                obj.pension = dr.GetDecimal(2);
                obj.fecha_nac = dr.GetDateTime(3);
                obj.codcar = dr.GetInt32(4);
                obj.nomcar = dr.GetString(5);
                //
                lista.Add(obj);
            }
            dr.Close();

            cnx.Close();
            //
            return lista;
        }

        // GET: Consultas
        public ActionResult ListadoAlumnos()
        {
            //var listado = Listar_Alumnos();
            //return View(listado);

            return View(Listar_Alumnos());
        }
    }
}