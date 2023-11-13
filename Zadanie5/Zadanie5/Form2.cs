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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            subjectBindingSource.DataSource = DCStudentDataContextForm2.Subject;
        }
        private DCStudentDataContext DCStudentDataContextForm2 = new DCStudentDataContext();

        private void subjectBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            try
            {
                DCStudentDataContextForm2.SubmitChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnfilter_Click(object sender, EventArgs e)
        {
            var SubjQuery = from Subject in
              DCStudentDataContextForm2.Subject
                               where Subject.Subj_name == textBoxSubject.Text
                               select Subject;
            subjectBindingSource.DataSource = SubjQuery;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBoxSubject.Text = "";
            subjectBindingSource.DataSource = DCStudentDataContextForm2.Subject;
        }
    }
}
