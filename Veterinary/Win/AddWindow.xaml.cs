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
    /// Логика взаимодействия для AddWindow.xaml
    /// </summary>
    public partial class AddWindow : Window
    {
        private int _doctorId;
        public static List<Animals> animals { get; set; }
        public static List<Doctors> doctors { get; set; }
        public AddWindow(int doctorId)
        {
            InitializeComponent();
            _doctorId = doctorId;
            animals = DB.vet.Animals.ToList();
            cbAnimal.ItemsSource = animals;
            doctors =DB.vet.Doctors.ToList();
            cbDoc.ItemsSource = doctors;
            dpDate.SelectedDate = DateTime.Today;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (dpDate.SelectedDate == null || cbAnimal.SelectedItem == null)
                {
                    MessageBox.Show("Заполните обязательные поля", "Ошибка",
                                  MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }
                var newAppointment = new Appointments
                {
                    appointment_date = dpDate.SelectedDate.Value,
                    animal_id = (cbAnimal.SelectedItem as Animals).id, 
                    doctor_id = _doctorId,
                    comment = tbComment.Text,
                    is_deleted = false
                };

                DB.vet.Appointments.Add(newAppointment);
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

