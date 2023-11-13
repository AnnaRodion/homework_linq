using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace LINQ_6
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }
        Students db = new Students(@"Data Source = DESKTOP-V7DU270; Initial Catalog= Students; Integrated Security=SSPI; ");

        private void button1_Click(object sender, EventArgs e)
        {
            string name_subj = textBox1.Text;
            var custquery3 = db.RodionovaGetSubjByName(name_subj);
            List<RodionovaGetSubjByNameResult> test3 = new List<RodionovaGetSubjByNameResult>();
            foreach (RodionovaGetSubjByNameResult RodionovaSProcedureSubject in custquery3)
            {
                test3.Add(RodionovaSProcedureSubject);
            }

            dataGridView1.DataSource = test3;
        }
    }
}
