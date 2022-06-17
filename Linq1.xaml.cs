using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Lab_21_Kiko
{
    /// <summary>
    /// Логика взаимодействия для Linq1.xaml
    /// </summary>
    public partial class Linq1 : Window
    {
        Lab_21Entities db = Lab_21Entities.GetContext();
        public Linq1()
        {
            InitializeComponent();
        }
        int kol = 0;
        private void Rez_ClIck(object sender, RoutedEventArgs e)
        { kol = Convert.ToInt32(Id_product.Text);
            Rez.Text = Convert.ToString(db.Product_composition.Where(p => p.Product_Id == kol).Count());
        }
    }
}
