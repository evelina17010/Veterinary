using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для EditWindow.xaml
    /// </summary>
    public partial class EditWindow : Window
    {
        private Appointments _appointment;
        private List<Animals> animals;

        public EditWindow(Appointments appointment)
        {
            InitializeComponent();
            _appointment = appointment;
            cbAnimal.ItemsSource = DB.vet.Animals.ToList();
            cbDoc.ItemsSource = DB.vet.Doctors.ToList();
            tbId.Text = _appointment.appointment_id.ToString();
            dpDate.SelectedDate = _appointment.appointment_date;
            cbAnimal.SelectedItem = cbAnimal.ItemsSource.Cast<Animals>().FirstOrDefault(g => g.id ==_appointment.animal_id);
            cbDoc.SelectedItem = cbDoc.ItemsSource.Cast<Doctors>().FirstOrDefault(d => d.id == _appointment.doctor_id);
            tbComment.Text = _appointment.comment;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (dpDate.SelectedDate == null || cbAnimal.SelectedItem == null || cbDoc.SelectedItem == null)
                {
                    MessageBox.Show("Заполните все обязательные поля", "Ошибка",
                                  MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                var selectedAnimal = cbAnimal.SelectedItem as Animals;
                var selectedDoctor = cbDoc.SelectedItem as Doctors;
                _appointment.appointment_date = dpDate.SelectedDate.Value;
                _appointment.animal_id = selectedAnimal.id;  
                _appointment.doctor_id = selectedDoctor.id;
                _appointment.comment = tbComment.Text;
                DB.vet.SaveChanges();
                DialogResult = true;
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка",
                              MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
            Close();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            var addAnimal = new AddAnimal();
            if (addAnimal.ShowDialog() == true)
            {
                animals = DB.vet.Animals.ToList();
                cbAnimal.ItemsSource = animals;
                cbAnimal.Items.Refresh();
            }
        }
    }
}
