using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Universidad
{
    public class Asignatura
    {
        public Asignatura()
        {

        }

        //Carga un array object con las asignaturas correspondientes a un curso particular
        public static object [] cargar_asignaturas(int curso)
        {
            DataSet ds = ConexionSql.EjecutarComando(String.Format("select nombre from obtener_asignaturas_Curso({0})", curso));
            object[] listaAsignaturas = new object[ds.Tables[0].Rows.Count];

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                listaAsignaturas[i] = ds.Tables[0].Rows[i]["nombre"];

            return listaAsignaturas;
        }
    }
}