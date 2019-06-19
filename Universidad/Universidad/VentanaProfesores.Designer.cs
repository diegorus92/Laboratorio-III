namespace Universidad
{
    partial class VentanaProfesores
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridViewProfesor = new System.Windows.Forms.DataGridView();
            this.groupBoxAsignProf = new System.Windows.Forms.GroupBox();
            this.dataGridViewAsignProf = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewProfesor)).BeginInit();
            this.groupBoxAsignProf.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAsignProf)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewProfesor
            // 
            this.dataGridViewProfesor.AllowUserToAddRows = false;
            this.dataGridViewProfesor.AllowUserToDeleteRows = false;
            this.dataGridViewProfesor.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewProfesor.Location = new System.Drawing.Point(12, 12);
            this.dataGridViewProfesor.MultiSelect = false;
            this.dataGridViewProfesor.Name = "dataGridViewProfesor";
            this.dataGridViewProfesor.ReadOnly = true;
            this.dataGridViewProfesor.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewProfesor.Size = new System.Drawing.Size(553, 130);
            this.dataGridViewProfesor.TabIndex = 0;
            this.dataGridViewProfesor.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // groupBoxAsignProf
            // 
            this.groupBoxAsignProf.Controls.Add(this.dataGridViewAsignProf);
            this.groupBoxAsignProf.Location = new System.Drawing.Point(13, 149);
            this.groupBoxAsignProf.Name = "groupBoxAsignProf";
            this.groupBoxAsignProf.Size = new System.Drawing.Size(174, 134);
            this.groupBoxAsignProf.TabIndex = 1;
            this.groupBoxAsignProf.TabStop = false;
            this.groupBoxAsignProf.Text = "Asignaturas dictadas";
            // 
            // dataGridViewAsignProf
            // 
            this.dataGridViewAsignProf.AllowUserToAddRows = false;
            this.dataGridViewAsignProf.AllowUserToDeleteRows = false;
            this.dataGridViewAsignProf.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewAsignProf.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridViewAsignProf.Location = new System.Drawing.Point(3, 16);
            this.dataGridViewAsignProf.MultiSelect = false;
            this.dataGridViewAsignProf.Name = "dataGridViewAsignProf";
            this.dataGridViewAsignProf.ReadOnly = true;
            this.dataGridViewAsignProf.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewAsignProf.Size = new System.Drawing.Size(168, 115);
            this.dataGridViewAsignProf.TabIndex = 0;
            // 
            // VentanaProfesores
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(577, 295);
            this.Controls.Add(this.groupBoxAsignProf);
            this.Controls.Add(this.dataGridViewProfesor);
            this.Name = "VentanaProfesores";
            this.Text = "VentanaProfesores";
            this.Load += new System.EventHandler(this.VentanaProfesores_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewProfesor)).EndInit();
            this.groupBoxAsignProf.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAsignProf)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewProfesor;
        private System.Windows.Forms.GroupBox groupBoxAsignProf;
        private System.Windows.Forms.DataGridView dataGridViewAsignProf;
    }
}