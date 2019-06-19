namespace Universidad
{
    partial class VentanaCalificaciones
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
            this.groupBoxAlumnos = new System.Windows.Forms.GroupBox();
            this.dataGridViewAlumnos = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dataGridViewCalificaciones = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.comboBoxAsignaturas = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.panelCamposCalif = new System.Windows.Forms.Panel();
            this.buttonModifCalif = new System.Windows.Forms.Button();
            this.labelResultCondicion = new System.Windows.Forms.Label();
            this.labelCondicion = new System.Windows.Forms.Label();
            this.textBoxRecup2 = new System.Windows.Forms.TextBox();
            this.textBoxRecup1 = new System.Windows.Forms.TextBox();
            this.labelRecup2 = new System.Windows.Forms.Label();
            this.labelRecup1 = new System.Windows.Forms.Label();
            this.textBoxParcial3 = new System.Windows.Forms.TextBox();
            this.textBoxParcial2 = new System.Windows.Forms.TextBox();
            this.textBoxParcial1 = new System.Windows.Forms.TextBox();
            this.labelParcial3 = new System.Windows.Forms.Label();
            this.labelParcial2 = new System.Windows.Forms.Label();
            this.labelParcial1 = new System.Windows.Forms.Label();
            this.groupBoxAlumnos.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAlumnos)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCalificaciones)).BeginInit();
            this.panel1.SuspendLayout();
            this.panelCamposCalif.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBoxAlumnos
            // 
            this.groupBoxAlumnos.Controls.Add(this.dataGridViewAlumnos);
            this.groupBoxAlumnos.Location = new System.Drawing.Point(12, 12);
            this.groupBoxAlumnos.Name = "groupBoxAlumnos";
            this.groupBoxAlumnos.Size = new System.Drawing.Size(842, 156);
            this.groupBoxAlumnos.TabIndex = 0;
            this.groupBoxAlumnos.TabStop = false;
            this.groupBoxAlumnos.Text = "Alumnos";
            // 
            // dataGridViewAlumnos
            // 
            this.dataGridViewAlumnos.AllowUserToDeleteRows = false;
            this.dataGridViewAlumnos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewAlumnos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridViewAlumnos.Location = new System.Drawing.Point(3, 16);
            this.dataGridViewAlumnos.MultiSelect = false;
            this.dataGridViewAlumnos.Name = "dataGridViewAlumnos";
            this.dataGridViewAlumnos.ReadOnly = true;
            this.dataGridViewAlumnos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewAlumnos.Size = new System.Drawing.Size(836, 137);
            this.dataGridViewAlumnos.TabIndex = 0;
            this.dataGridViewAlumnos.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewAlumnos_CellClick);
            this.dataGridViewAlumnos.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewAlumnos_CellContentClick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dataGridViewCalificaciones);
            this.groupBox1.Location = new System.Drawing.Point(15, 174);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(842, 158);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Calificaciones";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // dataGridViewCalificaciones
            // 
            this.dataGridViewCalificaciones.AllowUserToDeleteRows = false;
            this.dataGridViewCalificaciones.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewCalificaciones.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridViewCalificaciones.Location = new System.Drawing.Point(3, 16);
            this.dataGridViewCalificaciones.MultiSelect = false;
            this.dataGridViewCalificaciones.Name = "dataGridViewCalificaciones";
            this.dataGridViewCalificaciones.ReadOnly = true;
            this.dataGridViewCalificaciones.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewCalificaciones.Size = new System.Drawing.Size(836, 139);
            this.dataGridViewCalificaciones.TabIndex = 0;
            this.dataGridViewCalificaciones.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewCalificaciones_CellClick);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.comboBoxAsignaturas);
            this.panel1.Controls.Add(this.button1);
            this.panel1.Location = new System.Drawing.Point(15, 397);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(226, 41);
            this.panel1.TabIndex = 2;
            // 
            // comboBoxAsignaturas
            // 
            this.comboBoxAsignaturas.FormattingEnabled = true;
            this.comboBoxAsignaturas.Location = new System.Drawing.Point(95, 11);
            this.comboBoxAsignaturas.Name = "comboBoxAsignaturas";
            this.comboBoxAsignaturas.Size = new System.Drawing.Size(121, 21);
            this.comboBoxAsignaturas.TabIndex = 1;
            this.comboBoxAsignaturas.Text = "Asignatura";
            this.comboBoxAsignaturas.SelectedIndexChanged += new System.EventHandler(this.comboBoxAsignaturas_SelectedIndexChanged);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(4, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(85, 32);
            this.button1.TabIndex = 0;
            this.button1.Text = "Inscribir a...";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // panelCamposCalif
            // 
            this.panelCamposCalif.Controls.Add(this.buttonModifCalif);
            this.panelCamposCalif.Controls.Add(this.labelResultCondicion);
            this.panelCamposCalif.Controls.Add(this.labelCondicion);
            this.panelCamposCalif.Controls.Add(this.textBoxRecup2);
            this.panelCamposCalif.Controls.Add(this.textBoxRecup1);
            this.panelCamposCalif.Controls.Add(this.labelRecup2);
            this.panelCamposCalif.Controls.Add(this.labelRecup1);
            this.panelCamposCalif.Controls.Add(this.textBoxParcial3);
            this.panelCamposCalif.Controls.Add(this.textBoxParcial2);
            this.panelCamposCalif.Controls.Add(this.textBoxParcial1);
            this.panelCamposCalif.Controls.Add(this.labelParcial3);
            this.panelCamposCalif.Controls.Add(this.labelParcial2);
            this.panelCamposCalif.Controls.Add(this.labelParcial1);
            this.panelCamposCalif.Location = new System.Drawing.Point(247, 338);
            this.panelCamposCalif.Name = "panelCamposCalif";
            this.panelCamposCalif.Size = new System.Drawing.Size(604, 128);
            this.panelCamposCalif.TabIndex = 3;
            // 
            // buttonModifCalif
            // 
            this.buttonModifCalif.Location = new System.Drawing.Point(8, 94);
            this.buttonModifCalif.Name = "buttonModifCalif";
            this.buttonModifCalif.Size = new System.Drawing.Size(268, 23);
            this.buttonModifCalif.TabIndex = 4;
            this.buttonModifCalif.Text = "Modificar";
            this.buttonModifCalif.UseVisualStyleBackColor = true;
            this.buttonModifCalif.Click += new System.EventHandler(this.buttonModifCalif_Click);
            // 
            // labelResultCondicion
            // 
            this.labelResultCondicion.AutoSize = true;
            this.labelResultCondicion.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelResultCondicion.Location = new System.Drawing.Point(230, 68);
            this.labelResultCondicion.Name = "labelResultCondicion";
            this.labelResultCondicion.Size = new System.Drawing.Size(20, 17);
            this.labelResultCondicion.TabIndex = 11;
            this.labelResultCondicion.Text = "...";
            // 
            // labelCondicion
            // 
            this.labelCondicion.AutoSize = true;
            this.labelCondicion.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelCondicion.Location = new System.Drawing.Point(143, 66);
            this.labelCondicion.Name = "labelCondicion";
            this.labelCondicion.Size = new System.Drawing.Size(83, 20);
            this.labelCondicion.TabIndex = 10;
            this.labelCondicion.Text = "Condicion:";
            // 
            // textBoxRecup2
            // 
            this.textBoxRecup2.Location = new System.Drawing.Point(233, 35);
            this.textBoxRecup2.Name = "textBoxRecup2";
            this.textBoxRecup2.Size = new System.Drawing.Size(43, 20);
            this.textBoxRecup2.TabIndex = 9;
            this.textBoxRecup2.Text = "0";
            this.textBoxRecup2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBoxRecup1
            // 
            this.textBoxRecup1.Location = new System.Drawing.Point(233, 3);
            this.textBoxRecup1.Name = "textBoxRecup1";
            this.textBoxRecup1.Size = new System.Drawing.Size(43, 20);
            this.textBoxRecup1.TabIndex = 8;
            this.textBoxRecup1.Text = "0";
            this.textBoxRecup1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // labelRecup2
            // 
            this.labelRecup2.AutoSize = true;
            this.labelRecup2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelRecup2.Location = new System.Drawing.Point(143, 35);
            this.labelRecup2.Name = "labelRecup2";
            this.labelRecup2.Size = new System.Drawing.Size(87, 20);
            this.labelRecup2.TabIndex = 7;
            this.labelRecup2.Text = "2do Recup";
            // 
            // labelRecup1
            // 
            this.labelRecup1.AutoSize = true;
            this.labelRecup1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelRecup1.Location = new System.Drawing.Point(143, 4);
            this.labelRecup1.Name = "labelRecup1";
            this.labelRecup1.Size = new System.Drawing.Size(87, 20);
            this.labelRecup1.TabIndex = 6;
            this.labelRecup1.Text = "1er Recup.";
            // 
            // textBoxParcial3
            // 
            this.textBoxParcial3.Location = new System.Drawing.Point(94, 68);
            this.textBoxParcial3.Name = "textBoxParcial3";
            this.textBoxParcial3.Size = new System.Drawing.Size(43, 20);
            this.textBoxParcial3.TabIndex = 5;
            this.textBoxParcial3.Text = "0";
            this.textBoxParcial3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBoxParcial2
            // 
            this.textBoxParcial2.Location = new System.Drawing.Point(94, 35);
            this.textBoxParcial2.Name = "textBoxParcial2";
            this.textBoxParcial2.Size = new System.Drawing.Size(43, 20);
            this.textBoxParcial2.TabIndex = 4;
            this.textBoxParcial2.Text = "0";
            this.textBoxParcial2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBoxParcial1
            // 
            this.textBoxParcial1.Location = new System.Drawing.Point(94, 3);
            this.textBoxParcial1.Name = "textBoxParcial1";
            this.textBoxParcial1.Size = new System.Drawing.Size(43, 20);
            this.textBoxParcial1.TabIndex = 3;
            this.textBoxParcial1.Text = "0";
            this.textBoxParcial1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // labelParcial3
            // 
            this.labelParcial3.AutoSize = true;
            this.labelParcial3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelParcial3.Location = new System.Drawing.Point(4, 66);
            this.labelParcial3.Name = "labelParcial3";
            this.labelParcial3.Size = new System.Drawing.Size(83, 20);
            this.labelParcial3.TabIndex = 2;
            this.labelParcial3.Text = "3er Parcial";
            // 
            // labelParcial2
            // 
            this.labelParcial2.AutoSize = true;
            this.labelParcial2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelParcial2.Location = new System.Drawing.Point(4, 35);
            this.labelParcial2.Name = "labelParcial2";
            this.labelParcial2.Size = new System.Drawing.Size(87, 20);
            this.labelParcial2.TabIndex = 1;
            this.labelParcial2.Text = "2do Parcial";
            // 
            // labelParcial1
            // 
            this.labelParcial1.AutoSize = true;
            this.labelParcial1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelParcial1.Location = new System.Drawing.Point(4, 4);
            this.labelParcial1.Name = "labelParcial1";
            this.labelParcial1.Size = new System.Drawing.Size(83, 20);
            this.labelParcial1.TabIndex = 0;
            this.labelParcial1.Text = "1er Parcial";
            // 
            // VentanaCalificaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(866, 478);
            this.Controls.Add(this.panelCamposCalif);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBoxAlumnos);
            this.Name = "VentanaCalificaciones";
            this.Text = "VentanaCalificaciones";
            this.Load += new System.EventHandler(this.VentanaCalificaciones_Load);
            this.groupBoxAlumnos.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAlumnos)).EndInit();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCalificaciones)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panelCamposCalif.ResumeLayout(false);
            this.panelCamposCalif.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBoxAlumnos;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dataGridViewAlumnos;
        private System.Windows.Forms.DataGridView dataGridViewCalificaciones;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ComboBox comboBoxAsignaturas;
        private System.Windows.Forms.Panel panelCamposCalif;
        private System.Windows.Forms.Label labelResultCondicion;
        private System.Windows.Forms.Label labelCondicion;
        private System.Windows.Forms.TextBox textBoxRecup2;
        private System.Windows.Forms.TextBox textBoxRecup1;
        private System.Windows.Forms.Label labelRecup2;
        private System.Windows.Forms.Label labelRecup1;
        private System.Windows.Forms.TextBox textBoxParcial3;
        private System.Windows.Forms.TextBox textBoxParcial2;
        private System.Windows.Forms.TextBox textBoxParcial1;
        private System.Windows.Forms.Label labelParcial3;
        private System.Windows.Forms.Label labelParcial2;
        private System.Windows.Forms.Label labelParcial1;
        private System.Windows.Forms.Button buttonModifCalif;
    }
}