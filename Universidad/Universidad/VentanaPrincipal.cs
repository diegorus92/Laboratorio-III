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
    public partial class VentanaPrincipal : Form
    {
        public VentanaPrincipal()
        {
            InitializeComponent();
            
        }

        private void VentanaPrincipal_Load(object sender, EventArgs e)
        {
            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            
        }

        private void alumnadoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void ventanaPrincipalToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void PanelBienvenida_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void profesoresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Instancia una VentanaProfesores y la muestra
            VentanaProfesores ventanaProfesores = new VentanaProfesores();
            ventanaProfesores.ShowDialog();
        }

        

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void calificacionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VentanaCalificaciones ventanaCalificaciones = new VentanaCalificaciones();
            ventanaCalificaciones.ShowDialog();
        }

        private void alumnosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Instancia una VentanaAlumnado y la muestra
            VentanaAlumnado ventanaAlumnado = new VentanaAlumnado();
            ventanaAlumnado.ShowDialog();
        }

        private void aulasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Instancia una VentanaCursos y la muestra
            VentanaAulas ventanaAulas = new VentanaAulas();
            ventanaAulas.ShowDialog();
        }
    }
}
