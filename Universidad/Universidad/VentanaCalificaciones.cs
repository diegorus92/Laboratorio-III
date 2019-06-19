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
    public partial class VentanaCalificaciones : Form
    {

        private int matricula = -1;
        private string asignatura = "";
        private DataSet asignaturaId;
        private DataGridViewRow rowCalificacion = null;

        public VentanaCalificaciones()
        {
            InitializeComponent();
        }

        //Boton Inscribir a
        private void button1_Click(object sender, EventArgs e)
        {
            asignaturaId = ConexionSql.EjecutarComando(String.Format("select asignaturaId  from Asignatura where nombre = '{0}'", asignatura));
            try
            {
                asignatura = asignaturaId.Tables[0].Rows[0][0].ToString();
                Console.WriteLine(Convert.ToInt32(asignatura));
                DataSet dsTemp = ConexionSql.EjecutarComando(String.Format("exec inscribir_alumno {0}, {1}", matricula, Convert.ToInt32(asignatura)));
                MessageBox.Show(dsTemp.Tables[0].Rows[0][0].ToString());
            }
            catch (IndexOutOfRangeException ex)
            {
                Console.WriteLine(ex.Message);
            }
            catch (NullReferenceException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                comboBoxAsignaturas.Text = "Asignatura";
            }

            dataGridViewCalificaciones.DataSource = Calificaciones.ver_calificaciones(matricula).Tables[0];
        }

        private void dataGridViewAlumnos_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void VentanaCalificaciones_Load(object sender, EventArgs e)
        {
            dataGridViewAlumnos.DataSource = Alumno.cargar_tabla().Tables[0];
        }

        private void dataGridViewAlumnos_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (!(e.RowIndex > -1)) return;

            DataGridViewRow rowAlumno = dataGridViewAlumnos.Rows[e.RowIndex];
            matricula = Convert.ToInt32(rowAlumno.Cells[0].Value);
            groupBox1.Text = ("Calificaciones: "+rowAlumno.Cells["apellido"].Value.ToString() +" "+rowAlumno.Cells["nombre"].Value.ToString());

            dataGridViewCalificaciones.DataSource = ConexionSql.EjecutarComando(String.Format("exec ver_calificaciones {0}", matricula)).Tables[0];

            comboBoxAsignaturas.Items.Clear();
            comboBoxAsignaturas.Items.AddRange(Asignatura.cargar_asignaturas(Convert.ToInt32(rowAlumno.Cells[5].Value)));
        }

        private void dataGridViewCalificaciones_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (!(e.RowIndex > -1)) return;

            rowCalificacion = dataGridViewCalificaciones.Rows[e.RowIndex];

            textBoxParcial1.Text = rowCalificacion.Cells[3].Value.ToString();
            textBoxParcial2.Text = rowCalificacion.Cells[4].Value.ToString();
            textBoxParcial3.Text = rowCalificacion.Cells[5].Value.ToString();
            textBoxRecup1.Text = rowCalificacion.Cells[6].Value.ToString();
            textBoxRecup2.Text = rowCalificacion.Cells[7].Value.ToString();
            labelResultCondicion.Text = (rowCalificacion.Cells[8].Value.ToString().ToLower().Equals("true")) ? "Aprobado":"No aprobado";
        }

        private void comboBoxAsignaturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            asignatura = comboBoxAsignaturas.Text;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void buttonModifCalif_Click(object sender, EventArgs e)
        {
            DataSet dataIdAsignatura = ConexionSql.EjecutarComando(String.Format("select top 1 asign.asignaturaId from Asignatura asign inner join Calificaciones calif on calif.matricula1 = {0} and asign.nombre = '{1}'", 
                                                    matricula, 
                                                    rowCalificacion.Cells[2].Value.ToString()));

            ConexionSql.EjecutarComando(String.Format("exec modificar_calificaciones {0}, {1}, {2}, {3}, {4}, {5}, {6}",
                                        matricula,
                                        Convert.ToInt32(dataIdAsignatura.Tables[0].Rows[0][0].ToString()),
                                        Double.Parse(textBoxParcial1.Text.Replace(",", ".")),
                                        Double.Parse(textBoxParcial2.Text.Replace(",", ".")),
                                        Double.Parse(textBoxParcial3.Text.Replace(",", ".")),
                                        Double.Parse(textBoxRecup1.Text.Replace(",", ".")),
                                        Double.Parse(textBoxRecup2.Text.Replace(",", "."))));
            ConexionSql.EjecutarComando(String.Format("exec establecer_aprobacion_asignatura {0}, {1}", matricula, dataIdAsignatura.Tables[0].Rows[0][0].ToString()));

            dataGridViewCalificaciones.DataSource = ConexionSql.EjecutarComando(String.Format("exec ver_calificaciones {0}", matricula)).Tables[0];

            Console.WriteLine(matricula + " " + dataIdAsignatura.Tables[0].Rows[0][0].ToString());
            Console.WriteLine(String.Format("Parcial 1 = {0}", Convert.ToDouble(("5,5").ToString().Replace(",", "."))));
            Console.WriteLine(Double.Parse("8,75".Replace(",", ".")));
        }
    }
}
