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
    public partial class VentanaAlumnado : Form
    {
        private int matriculaVieja;

        public VentanaAlumnado()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        //Uso este evento porque lo dispara a penas se clique en alguna celda
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (!(e.RowIndex > -1)) //Controla que no se haya pulsado en algun header de la tabla
                return;

            DataGridViewRow row = dataGridView1.Rows[e.RowIndex];//Toma la fila seleccionada para desde alli acceder a cada columna
            try
            {
                matriculaVieja = Convert.ToInt32(row.Cells[0].Value); //Salva la matricula original antes de que el usuario ejecute la modificación
            }
            catch (InvalidCastException ex)
            {
                Console.WriteLine(ex.Message);
            }

            cargar_camposEntrada(row); //Carga los campos de entrada textBox's y comboBox's con lo contenido en la fila pasada por parámetro
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void VentanaAlumnado_Load(object sender, EventArgs e)
        {
            /*Este método se invoca al activarse este Form
             por lo que es aquí donde se debe cargar el DataGridView con la
             informacion correspondiente de la base de datos*/

            //Agrega los datos de la tabla al DataGridView para mostrarlo en la app
            dataGridView1.DataSource = Alumno.cargar_tabla().Tables[0];
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            if (verificar_camposEntrada())
            {
                try
                {
                    String comando = String.Format("exec insertar_alumno {0}, '{1}', '{2}', '{3}', {4}, {5}, {6}",
                                                            Convert.ToInt32(textBoxMatricula.Text),
                                                            textBoxApellido.Text.Trim(),
                                                            textBoxNombre.Text.Trim(),
                                                            textBoxDireccion.Text.Trim(),
                                                            Convert.ToInt64(textBoxTelefono.Text),
                                                            Convert.ToInt32(comboBoxCurso.SelectedItem),
                                                            Convert.ToInt32(comboBoxDivision.SelectedItem));
                    limpiar_camposEntrada();
                    ConexionSql.EjecutarComando(comando);
                }
                catch (FormatException ex)
                {
                    MessageBox.Show("Se ha producido un error en la entrada de datos\n" +
                                    "ERROR disparado: " + ex.Message);
                }
                dataGridView1.DataSource = Alumno.cargar_tabla().Tables[0];
            }
            else MessageBox.Show("Debe completar todos los campos");
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void limpiar_camposEntrada()
        {
            textBoxMatricula.Text = "";
            textBoxApellido.Text = "";
            textBoxNombre.Text = "";
            textBoxDireccion.Text = "";
            textBoxTelefono.Text = "";
            comboBoxCurso.Text = "";
            comboBoxDivision.Text = "";
        }

        private bool verificar_camposEntrada()
        {
            return (textBoxMatricula.Text.Length > 0 &&
                    textBoxApellido.Text.Length > 0 &&
                    textBoxNombre.Text.Length > 0 &&
                    textBoxDireccion.Text.Length > 0 &&
                    textBoxTelefono.Text.Length > 0 &&
                    comboBoxCurso.Text.Length > 0 &&
                    comboBoxDivision.Text.Length > 0);
        }

        private void cargar_camposEntrada(DataGridViewRow dataGridViewRow)
        {
            textBoxMatricula.Text = dataGridViewRow.Cells[0].Value.ToString();
            textBoxApellido.Text = dataGridViewRow.Cells[1].Value.ToString();
            textBoxNombre.Text = dataGridViewRow.Cells[2].Value.ToString();
            textBoxDireccion.Text = dataGridViewRow.Cells[3].Value.ToString();
            textBoxTelefono.Text = dataGridViewRow.Cells[4].Value.ToString();
            comboBoxCurso.Text = dataGridViewRow.Cells[5].Value.ToString();
            comboBoxDivision.Text = dataGridViewRow.Cells[6].Value.ToString();
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(verificar_camposEntrada())
            {
                try
                {
                    ConexionSql.EjecutarComando(String.Format("exec modificar_alumno {0}, {1}, {2}, '{3}', '{4}', '{5}', {6}, {7}",
                                                            Convert.ToInt32(matriculaVieja),//matricula vieja
                                                            Convert.ToInt32(textBoxMatricula.Text), //matricula nueva
                                                            textBoxApellido.Text.Trim(),
                                                            textBoxNombre.Text.Trim(),
                                                            textBoxDireccion.Text.Trim(),
                                                            Convert.ToInt64(textBoxTelefono.Text),
                                                            Convert.ToInt32(comboBoxCurso.SelectedItem),
                                                            Convert.ToInt32(comboBoxDivision.SelectedItem)));

                    limpiar_camposEntrada();
                }
                catch(Exception ex)
                {
                    MessageBox.Show("Erros: "+ex.Message);
                }
                dataGridView1.DataSource = Alumno.cargar_tabla().Tables[0];
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            limpiar_camposEntrada();
        }

        private void textBoxBusqueda_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void buttonBuscar_Click(object sender, EventArgs e)
        {
            DataSet ds = ConexionSql.EjecutarComando(String.Format("exec buscar_alumno {0}, {1}", comboBoxFiltro.Text, textBoxBusqueda.Text));
            if(ds != null) dataGridView1.DataSource = ds.Tables[0];
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = Alumno.cargar_tabla().Tables[0];
        }

        //Boton Eliminar
        private void button3_Click(object sender, EventArgs e)
        {
            if (verificar_camposEntrada())
            {
                ConexionSql.EjecutarComando(String.Format("exec eliminar_alumno {0}", Convert.ToInt32(textBoxMatricula.Text)));
                dataGridView1.DataSource = Alumno.cargar_tabla().Tables[0];
            }
            else MessageBox.Show("Debe seleccionar un alumno primero");
        }
    }
}
