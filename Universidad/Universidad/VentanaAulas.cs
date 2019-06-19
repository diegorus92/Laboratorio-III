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
    public partial class VentanaAulas : Form
    {
        DataSet dataAula;
        DataSet dataAulaAlumnos;

        public VentanaAulas()
        {
            InitializeComponent();
        }

        private Object[] cargar_Aulas()
        {
            DataSet dataAulas = ConexionSql.EjecutarComando("exec ver_registro 'Aula'");
            Object [] listaAulas = new object[dataAulas.Tables[0].Rows.Count];

            for (int i = 0; i < listaAulas.Length; i++)
            {
                listaAulas[i] = dataAulas.Tables[0].Rows[i][0];
            }
            return listaAulas;
        }

        private void VentanaAulas_Load(object sender, EventArgs e)
        {
            comboBoxAulas.Items.AddRange(cargar_Aulas());
        }

        private void comboBoxAulas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int aulaSeleccionada = Convert.ToInt32(comboBoxAulas.SelectedItem);

            //Extracción de información del aula seleccionada
            dataAula = ConexionSql.EjecutarComando(String.Format("select * from obtener_aula({0})", aulaSeleccionada));
            textBoxIdAula.Text = dataAula.Tables[0].Rows[0][0].ToString();
            labelCurso.Text = dataAula.Tables[0].Rows[0][4].ToString();
            textBoxCapMax.Text = dataAula.Tables[0].Rows[0][1].ToString();
            labelCapActual.Text = ConexionSql.EjecutarComando(String.Format("select count(*) from ver_alumnos_en_aula ({0})", dataAula.Tables[0].Rows[0][4].ToString())).Tables[0].Rows[0][0].ToString();

            if (Convert.ToBoolean(dataAula.Tables[0].Rows[0][3])) radioButtonConectSi.Checked = true;
            else radioButtonConectNo.Checked = true;

            if (Convert.ToBoolean(dataAula.Tables[0].Rows[0][2])) radioButtonProyecSi.Checked = true;
            else radioButtonProyecNo.Checked = true;
                

            //Extracción de información de alumnos en el aula seleccionada
            dataAulaAlumnos = ConexionSql.EjecutarComando(String.Format("select * from ver_alumnos_en_aula({0})",
                                                            dataAula.Tables[0].Rows[0][4].ToString()));
            dataGridViewAlumnosAula.DataSource = dataAulaAlumnos.Tables[0];
        }

        //Boton Modificar
        private void buttonModifAula_Click(object sender, EventArgs e)
        {
            if(dataAula == null)
            {
                MessageBox.Show("Debe seleccionar un aula primero");
                return;
            }

            if(Convert.ToInt32(textBoxCapMax.Text) < dataAulaAlumnos.Tables[0].Rows.Count)
            {
                MessageBox.Show("La capacidad máxima debe ser superior a la cantidad actual de alumnos");
                return;
            }
            else
            {
                ConexionSql.EjecutarComando(String.Format("exec modificar_aula {0}, {1}, {2}, {3}, {4}",
                                                        dataAula.Tables[0].Rows[0][0],
                                                        Convert.ToInt32(textBoxIdAula.Text),
                                                        Convert.ToInt16(textBoxCapMax.Text),
                                                        (radioButtonProyecSi.Checked) ? "true":"false",
                                                        (radioButtonConectSi.Checked) ? "true":"false" ));

                            //Limpia los items y vuelve a cargar las aulas
                            comboBoxAulas.Items.Clear();
                            comboBoxAulas.Items.AddRange(cargar_Aulas());
            }
            
        }
    }
}
