using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Zadanie5
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            studentListBindingSource.DataSource = DCStudentDataContextForm1.StudentList;
        }

        private DCStudentDataContext DCStudentDataContextForm1 = new DCStudentDataContext();

        private void studentListBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            try
            {
                DCStudentDataContextForm1.SubmitChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void ButtonRunQuery_Click(object sender, EventArgs e)
        {
            var StudentQuery = from StudentList in
              DCStudentDataContextForm1.StudentList
                               where StudentList.Surname == textBoxLastN.Text
                               select StudentList;
            studentListBindingSource.DataSource = StudentQuery;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBoxLastN.Text = "";
            studentListBindingSource.DataSource = DCStudentDataContextForm1.StudentList;
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form2 FormSubj = new Form2();
            FormSubj.Show();
        }
    }
}
