using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using ProyNeptuno2023MVC.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ProyNeptuno2023MVC.DAO
{
    public class ConsultasDAO
    {
        string cad_cn =
            ConfigurationManager.ConnectionStrings["cn1"].ConnectionString;

        public List<pa_clientes> ListarClientes()
        { 
            var lista = new List<pa_clientes>();

            using (SqlConnection cnx = new SqlConnection(cad_cn))
            {
                cnx.Open();

                // el proced almacenado no tiene parametros 
                SqlCommand comando = new SqlCommand("execute pa_clientes", cnx);

                SqlDataReader dr = comando.ExecuteReader();

                pa_clientes obj = null;

                while (dr.Read())
                {
                    // obtener los datos de las filas
                    obj = new pa_clientes() { 
                        IdCliente = dr.GetString(0),
                        NombreCliente = dr.GetString(1),
                        Telefono = dr.GetString(2),
                        Pais = dr.GetString(3)
                    };
                    // agregar el nuevo objeto a la lista
                    lista.Add(obj);
                }
                dr.Close();
                cnx.Close();
            }

            return lista;
        }

        public List<pa_pedidos_cliente> PedidosPorCliente(string codigo)
        {
            var lista = new List<pa_pedidos_cliente>();
            //
            using (SqlConnection cnx = new SqlConnection(cad_cn))
            {
                cnx.Open();

                // el proced almacenado tiene 1 parametro 
                SqlCommand comando = new SqlCommand("pa_pedidos_cliente", cnx);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idcliente", codigo);

                SqlDataReader dr = comando.ExecuteReader();

                pa_pedidos_cliente obj = null;

                while (dr.Read())
                    {
                        // obtener los datos de las filas
                        obj = new pa_pedidos_cliente()
                        {
                            IdPedido = dr.GetInt32(0),
                            FechaPedido = dr.GetDateTime(1),
                            Apellidos = dr.GetString(2),
                            Importe = dr.GetDecimal(3)
                        };
                        // agregar el nuevo objeto a la lista
                        lista.Add(obj);
                    }
                dr.Close();
                cnx.Close();
            }
            //
            return lista;
        }

        public List<pa_pedidos_cliente_anio> PedidosClienteAnio(
                                              string codigo, int anio)
        {
            var lista = new List<pa_pedidos_cliente_anio>();
            //
            using (SqlConnection cnx = new SqlConnection(cad_cn))
            {
                cnx.Open();

                // el proced almacenado tiene 1 parametro 
                SqlCommand comando = new SqlCommand("pa_pedidos_cliente_anio", cnx);
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.Add("@idcliente", SqlDbType.Char, 5).Value = codigo;
                comando.Parameters.Add("@anio", SqlDbType.Int).Value = anio;

                SqlDataReader dr = comando.ExecuteReader();

                pa_pedidos_cliente_anio obj = null;

                while (dr.Read())
                {
                    // obtener los datos de las filas
                    obj = new pa_pedidos_cliente_anio()
                    {
                        IdPedido = dr.GetInt32(0),
                        FechaPedido = dr.GetDateTime(1),
                        Apellidos = dr.GetString(2),
                        Importe = dr.GetDecimal(3)
                    };
                    // agregar el nuevo objeto a la lista
                    lista.Add(obj);
                }
                dr.Close();
                cnx.Close();
            }
            //
            return lista;
        }
    }
}