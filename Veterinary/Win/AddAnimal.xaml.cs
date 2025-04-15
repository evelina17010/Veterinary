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
using Veterinary.Connection;

namespace Veterinary.Win
{
    /// <summary>
    /// Логика взаимодействия для AddAnimal.xaml
    /// </summary>
    public partial class AddAnimal : Window
    {
        public AddAnimal()
        {
            InitializeComponent();
            cbGender.ItemsSource = DB.vet.Gender.ToList();
            cbType.ItemsSource = DB.vet.AnimalType.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txtName.Text == null)
            {
                MessageBox.Show("Введите кличку животного");
                return;
            }

            try
            {
                var animal = new Animals()
                {
                    name = txtName.Text,
                    id_gender = (cbGender.SelectedItem as Gender).id,
                    id_type = (cbType.SelectedItem as AnimalType).id,
                    weight = decimal.Parse(txtWeight.Text),
                    height = decimal.Parse(txtHeight.Text)
                };
                DB.vet.Animals.Add(animal);
                DB.vet.SaveChanges();
                this.DialogResult = true;
                Close();
            }
            catch
            {
                MessageBox.Show("Ошибка при сохранении");
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            Close();
        }
    }
}
