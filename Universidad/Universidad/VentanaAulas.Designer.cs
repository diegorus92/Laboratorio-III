namespace Universidad
{
    partial class VentanaAulas
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBoxAulas = new System.Windows.Forms.ComboBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.labelCapActual = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.textBoxCapMax = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.radioButtonProyecNo = new System.Windows.Forms.RadioButton();
            this.radioButtonProyecSi = new System.Windows.Forms.RadioButton();
            this.label7 = new System.Windows.Forms.Label();
            this.radioButtonConectNo = new System.Windows.Forms.RadioButton();
            this.radioButtonConectSi = new System.Windows.Forms.RadioButton();
            this.label6 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dataGridViewAlumnosAula = new System.Windows.Forms.DataGridView();
            this.buttonModifAula = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.labelCurso = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.textBoxIdAula = new System.Windows.Forms.TextBox();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAlumnosAula)).BeginInit();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.textBoxIdAula);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.labelCurso);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.comboBoxAulas);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(227, 108);
            this.panel1.TabIndex = 0;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(3, 68);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 20);
            this.label3.TabIndex = 4;
            this.label3.Text = "Curso/Año";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(3, 6);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 20);
            this.label1.TabIndex = 3;
            this.label1.Text = "Aulas";
            // 
            // comboBoxAulas
            // 
            this.comboBoxAulas.FormattingEnabled = true;
            this.comboBoxAulas.Location = new System.Drawing.Point(103, 3);
            this.comboBoxAulas.Name = "comboBoxAulas";
            this.comboBoxAulas.Size = new System.Drawing.Size(121, 21);
            this.comboBoxAulas.TabIndex = 2;
            this.comboBoxAulas.SelectedIndexChanged += new System.EventHandler(this.comboBoxAulas_SelectedIndexChanged);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.labelCapActual);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.textBoxCapMax);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Location = new System.Drawing.Point(245, 12);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(271, 74);
            this.panel2.TabIndex = 1;
            // 
            // labelCapActual
            // 
            this.labelCapActual.AutoSize = true;
            this.labelCapActual.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelCapActual.Location = new System.Drawing.Point(149, 37);
            this.labelCapActual.Name = "labelCapActual";
            this.labelCapActual.Size = new System.Drawing.Size(21, 20);
            this.labelCapActual.TabIndex = 7;
            this.labelCapActual.Text = "...";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(3, 37);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(126, 20);
            this.label4.TabIndex = 6;
            this.label4.Text = "Cantidad Actual:";
            // 
            // textBoxCapMax
            // 
            this.textBoxCapMax.Location = new System.Drawing.Point(153, 5);
            this.textBoxCapMax.MaxLength = 4;
            this.textBoxCapMax.Name = "textBoxCapMax";
            this.textBoxCapMax.Size = new System.Drawing.Size(67, 20);
            this.textBoxCapMax.TabIndex = 5;
            this.textBoxCapMax.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(3, 6);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(143, 20);
            this.label2.TabIndex = 4;
            this.label2.Text = "Capacidad Maxima";
            // 
            // radioButtonProyecNo
            // 
            this.radioButtonProyecNo.AutoSize = true;
            this.radioButtonProyecNo.Location = new System.Drawing.Point(193, 10);
            this.radioButtonProyecNo.Name = "radioButtonProyecNo";
            this.radioButtonProyecNo.Size = new System.Drawing.Size(39, 17);
            this.radioButtonProyecNo.TabIndex = 13;
            this.radioButtonProyecNo.TabStop = true;
            this.radioButtonProyecNo.Text = "No";
            this.radioButtonProyecNo.UseVisualStyleBackColor = true;
            // 
            // radioButtonProyecSi
            // 
            this.radioButtonProyecSi.AutoSize = true;
            this.radioButtonProyecSi.Location = new System.Drawing.Point(153, 10);
            this.radioButtonProyecSi.Name = "radioButtonProyecSi";
            this.radioButtonProyecSi.Size = new System.Drawing.Size(34, 17);
            this.radioButtonProyecSi.TabIndex = 12;
            this.radioButtonProyecSi.TabStop = true;
            this.radioButtonProyecSi.Text = "Si";
            this.radioButtonProyecSi.UseVisualStyleBackColor = true;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(3, 7);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(129, 20);
            this.label7.TabIndex = 11;
            this.label7.Text = "Posee Proyector:";
            // 
            // radioButtonConectNo
            // 
            this.radioButtonConectNo.AutoSize = true;
            this.radioButtonConectNo.Location = new System.Drawing.Point(193, 8);
            this.radioButtonConectNo.Name = "radioButtonConectNo";
            this.radioButtonConectNo.Size = new System.Drawing.Size(39, 17);
            this.radioButtonConectNo.TabIndex = 10;
            this.radioButtonConectNo.TabStop = true;
            this.radioButtonConectNo.Text = "No";
            this.radioButtonConectNo.UseVisualStyleBackColor = true;
            // 
            // radioButtonConectSi
            // 
            this.radioButtonConectSi.AutoSize = true;
            this.radioButtonConectSi.Location = new System.Drawing.Point(153, 8);
            this.radioButtonConectSi.Name = "radioButtonConectSi";
            this.radioButtonConectSi.Size = new System.Drawing.Size(34, 17);
            this.radioButtonConectSi.TabIndex = 9;
            this.radioButtonConectSi.TabStop = true;
            this.radioButtonConectSi.Text = "Si";
            this.radioButtonConectSi.UseVisualStyleBackColor = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(3, 3);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(119, 20);
            this.label6.TabIndex = 8;
            this.label6.Text = "Conexión a red:";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dataGridViewAlumnosAula);
            this.groupBox1.Location = new System.Drawing.Point(12, 165);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(504, 187);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Alumnos ";
            // 
            // dataGridViewAlumnosAula
            // 
            this.dataGridViewAlumnosAula.AllowUserToAddRows = false;
            this.dataGridViewAlumnosAula.AllowUserToDeleteRows = false;
            this.dataGridViewAlumnosAula.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewAlumnosAula.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridViewAlumnosAula.Location = new System.Drawing.Point(3, 16);
            this.dataGridViewAlumnosAula.MultiSelect = false;
            this.dataGridViewAlumnosAula.Name = "dataGridViewAlumnosAula";
            this.dataGridViewAlumnosAula.ReadOnly = true;
            this.dataGridViewAlumnosAula.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewAlumnosAula.Size = new System.Drawing.Size(498, 168);
            this.dataGridViewAlumnosAula.TabIndex = 0;
            // 
            // buttonModifAula
            // 
            this.buttonModifAula.Location = new System.Drawing.Point(15, 123);
            this.buttonModifAula.Name = "buttonModifAula";
            this.buttonModifAula.Size = new System.Drawing.Size(221, 36);
            this.buttonModifAula.TabIndex = 3;
            this.buttonModifAula.Text = "Modificar";
            this.buttonModifAula.UseVisualStyleBackColor = true;
            this.buttonModifAula.Click += new System.EventHandler(this.buttonModifAula_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.label6);
            this.panel3.Controls.Add(this.radioButtonConectSi);
            this.panel3.Controls.Add(this.radioButtonConectNo);
            this.panel3.Location = new System.Drawing.Point(245, 92);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(271, 28);
            this.panel3.TabIndex = 14;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.label7);
            this.panel4.Controls.Add(this.radioButtonProyecSi);
            this.panel4.Controls.Add(this.radioButtonProyecNo);
            this.panel4.Location = new System.Drawing.Point(245, 123);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(271, 36);
            this.panel4.TabIndex = 15;
            // 
            // labelCurso
            // 
            this.labelCurso.AutoSize = true;
            this.labelCurso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelCurso.Location = new System.Drawing.Point(99, 68);
            this.labelCurso.Name = "labelCurso";
            this.labelCurso.Size = new System.Drawing.Size(21, 20);
            this.labelCurso.TabIndex = 5;
            this.labelCurso.Text = "...";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(3, 37);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(62, 20);
            this.label5.TabIndex = 6;
            this.label5.Text = "ID Aula";
            // 
            // textBoxIdAula
            // 
            this.textBoxIdAula.Location = new System.Drawing.Point(103, 36);
            this.textBoxIdAula.MaxLength = 5;
            this.textBoxIdAula.Name = "textBoxIdAula";
            this.textBoxIdAula.Size = new System.Drawing.Size(64, 20);
            this.textBoxIdAula.TabIndex = 7;
            // 
            // VentanaAulas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(524, 364);
            this.Controls.Add(this.panel4);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.buttonModifAula);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "VentanaAulas";
            this.Text = "VentanaAulas";
            this.Load += new System.EventHandler(this.VentanaAulas_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewAlumnosAula)).EndInit();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ComboBox comboBoxAulas;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox textBoxCapMax;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RadioButton radioButtonProyecNo;
        private System.Windows.Forms.RadioButton radioButtonProyecSi;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.RadioButton radioButtonConectNo;
        private System.Windows.Forms.RadioButton radioButtonConectSi;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label labelCapActual;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dataGridViewAlumnosAula;
        private System.Windows.Forms.Button buttonModifAula;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label labelCurso;
        private System.Windows.Forms.TextBox textBoxIdAula;
        private System.Windows.Forms.Label label5;
    }
}