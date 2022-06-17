using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lab_21_Kiko
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Linq_1(object sender, RoutedEventArgs e)
        {
            Linq1 linq1 = new Linq1();
            linq1.ShowDialog();
        }

        private void Linq_2(object sender, RoutedEventArgs e)
        {
            Linq2 linq1 = new Linq2();
            linq1.ShowDialog();
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            db.Parts_reference_.Load();
            db.Product_Reference.Load();
            db.Product_composition.Load();
            db.Workshops.Load();
            db.Release_plan.Load();
            Date_1.ItemsSource = db.Product_Reference.Local.ToBindingList();
            Date_2.ItemsSource = db.Parts_reference_.Local.ToBindingList();
            Date_3.ItemsSource = db.Workshops.Local.ToBindingList();
            Date_4.ItemsSource = db.Product_composition.Local.ToBindingList();
            Date_5.ItemsSource = db.Release_plan.Local.ToBindingList();
        }
    }
}
