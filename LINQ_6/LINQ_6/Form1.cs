using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace LINQ_6
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        
        Students db = new Students(@"Data Source = DESKTOP-V7DU270; Initial Catalog= Students; Integrated Security=SSPI; ");

        private void button1_Click(object sender, EventArgs e)
        {
            int param = Convert.ToInt32(textBox1.Text);
            var custquery = db.RodionovaGetStudentById(param);

            List<RodionovaGetStudentByIdResult> test = new List<RodionovaGetStudentByIdResult>();
            
                
                foreach (RodionovaGetStudentByIdResult RodionovaSProcedure in custquery)
            {
                test.Add(RodionovaSProcedure);

}

            dataGridView1.DataSource = test;     
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string name_st = textBox2.Text;
            var custquery2 = db.RodionovaGetStudentBySurname(name_st);
            List < RodionovaGetStudentBySurnameResult > test2 = new List<RodionovaGetStudentBySurnameResult>();
            foreach (RodionovaGetStudentBySurnameResult RodionovaSProcedureName in custquery2)
            {
                test2.Add(RodionovaSProcedureName);
            }

            dataGridView1.DataSource = test2;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form2 Subj_form = new Form2();
            Subj_form.Show();
        }
    }
}
