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
    /// Логика взаимодействия для Linq2.xaml
    /// </summary>
    public partial class Linq2 : Window
    {
        public Linq2()
        {
            InitializeComponent();
        }
        int kol;
        int su = 0;
        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Rez_ClIck(object sender, RoutedEventArgs e)
        {
            su = 0;
            kol = Convert.ToInt32(Id_product.Text);
            var value = from p in db.Product_composition 
                        join c in db.Parts_reference_ on p.Parts_Id equals c.Parts_Id
                        where p.Product_Id==kol&p.Parts_Id==c.Parts_Id
                        select new { p.Number_of_parts , c.Price };
            foreach (var item in value)
            {
                su += Convert.ToInt32( item.Number_of_parts * item.Price);
            }
            Rez.Text = Convert.ToString(su);                                
        }
    }
}
