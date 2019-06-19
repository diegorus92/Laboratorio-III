using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Universidad
{
    class Alumno
    {


        public Alumno()
        {

        }

        /*Extrae los registros de Alumnos de la BD,
         modifica el nombre de las columnas y devuelve el ds con los registros
         para poder cargarla en el DataGridView*/
        public static DataSet cargar_tabla()
        {
            DataSet ds = ConexionSql.EjecutarComando("exec ver_registro 'Alumno'");
            
            ds.Tables[0].Columns["matricula"].ColumnName = "Matricula";
            ds.Tables[0].Columns["apellido"].ColumnName = "Apellido";
            ds.Tables[0].Columns["nombre"].ColumnName = "Nombre";
            ds.Tables[0].Columns["direccion"].ColumnName = "Dirección";
            ds.Tables[0].Columns["telefono"].ColumnName = "Teléfono";
            ds.Tables[0].Columns["cursoId4"].ColumnName = "Curso";
            ds.Tables[0].Columns["nombre1"].ColumnName = "División";

            return ds;
        }
    }
}
