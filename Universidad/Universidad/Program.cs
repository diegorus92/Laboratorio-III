using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Windows.Forms;

namespace Universidad
{
   
    class Program
    {
        static void Main(String [] args)
        {

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new VentanaPrincipal());

            /*
             * //------------Testeo en consola------------
             * DataSet ds = new DataSet();

            int matricula = 555, curso = 1, division = 1;
            String apellido = "Sdsfdf", nombre = "dfsfsdf", direccion = "ladireccion 333";
            long telefono = 379154895622;

            ds = ConexionSql.EjecutarComando("exec ver_registro 'Alumno'");

            if (ds != null && ds.Tables.Count > 0)
            {
                Console.WriteLine("\n<<Tabla Alumnos>>\n");
                for (int i = 0; i <= (ds.Tables[0].Rows.Count - 1); i++)
                {
                    Console.Write(ds.Tables[0].Rows[i]["matricula"] + "-- ");
                    Console.Write(ds.Tables[0].Rows[i]["apellido"] + "-- ");
                    Console.Write(ds.Tables[0].Rows[i]["nombre"] + " --");
                    Console.Write(ds.Tables[0].Rows[i]["direccion"] + "-- ");
                    Console.Write(ds.Tables[0].Rows[i]["telefono"] + " " + "\n\n");
                }
            }

            Console.ReadKey();
            */
        }
    }
}
