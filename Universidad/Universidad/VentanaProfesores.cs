using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Universidad
{
    public partial class VentanaProfesores : Form
    {
        public VentanaProfesores()
        {
            InitializeComponent();
        }

        private void VentanaProfesores_Load(object sender, EventArgs e)
        {
            /*Este método se invoca al activarse este Form
             por lo que es aquí donde se debe cargar el DataGridView con la
             informacion correspondiente de la base de datos*/
            DataSet ds = ConexionSql.EjecutarComando("exec ver_registro 'Profesor'");
            dataGridViewProfesor.DataSource = ds.Tables[0];
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (!(e.RowIndex > -1)) return;

            DataGridViewRow rowProfesor = dataGridViewProfesor.Rows[e.RowIndex];
            int dniProfesor = Convert.ToInt32(rowProfesor.Cells[0].Value);
            dataGridViewAsignProf.DataSource = ConexionSql.EjecutarComando(String.Format("exec ver_asignaturas_profesor {0}", dniProfesor)).Tables[0];
        }
    }
}
