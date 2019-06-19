using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Universidad
{
    class Calificaciones
    {
        public static DataSet cargar_tabla()
        {
            DataSet ds = ConexionSql.EjecutarComando(String.Format("exec ver_registro 'Calificaciones'"));

            return ds;
        }

        public static DataSet ver_calificaciones(int matricula)
        {
            DataSet ds = ConexionSql.EjecutarComando(String.Format("exec ver_calificaciones {0}", matricula));

            return ds;
        }
    }
}
