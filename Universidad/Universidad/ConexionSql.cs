using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Universidad
{
    class ConexionSql
    {
        private static SqlConnection conexion = new SqlConnection("Data Source=DIEGO-PC\\SQLEXPRESS;Initial Catalog=Universidad;Integrated Security=True");

        public static DataSet EjecutarComando(String comando)
        {
            
            try
            {
                conexion.Open();
                Console.WriteLine("Conexión a base de datos abierta");

                DataSet dataSet = new DataSet();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(comando, conexion);
                sqlDataAdapter.Fill(dataSet);

                return dataSet;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error disparado\n" + ex.Message);
                return null;
            }
            finally
            {
                if (conexion.State != ConnectionState.Closed)
                {
                    conexion.Close();
                    Console.WriteLine("Conexión a base de datos cerrada");
                }
            }
        }
    }
}
