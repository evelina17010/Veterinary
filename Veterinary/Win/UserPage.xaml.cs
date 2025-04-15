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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Veterinary.Connection;

namespace Veterinary.Win
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        private User _user;
        private List<Appointments> appointments;

        public UserPage(User user)
        {
            InitializeComponent();
            _user = user;
            dpDateTo.SelectedDate = DateTime.Today;
            LoadAppointments();
        }

        private void LoadAppointments()
        {
            appointments = DB.vet.Appointments.Where(a => a.doctor_id == _user.id_doctors && a.is_deleted == false).ToList();
            lvAppointments.ItemsSource = appointments;
            this.DataContext = this;
        }

        private void ApplyFilters()
        {
            try
            {
                if (!_user.id_doctors.HasValue) return;

                var query = DB.vet.Appointments.Where(a => a.doctor_id == _user.id_doctors && a.is_deleted == false);

                if (dpDateTo.SelectedDate.HasValue)
                {
                    query = query.Where(a => a.appointment_date == dpDateTo.SelectedDate.Value);
                }
                if (txtAnimalSearch.Text!=null)
                {
                    var searchText = txtAnimalSearch.Text.ToLower();
                    query = query.Where(a => a.Animals.name.ToLower().Contains(searchText));
                }
                appointments = query.ToList();
                lvAppointments.ItemsSource = appointments;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при применении фильтров: {ex.Message}", "Ошибка",
                              MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void btnApplyFilter_Click(object sender, RoutedEventArgs e)
        {
            ApplyFilters();
        }

        private void btnAddAppointment_Click(object sender, RoutedEventArgs e)
        {
            var addWindow = new AddWindow(_user.id_doctors.Value);
            if (addWindow.ShowDialog() == true)
            {
                LoadAppointments(); 
            }
        }

        private void btnEditAppointment_Click(object sender, RoutedEventArgs e)
        {
            if (lvAppointments.SelectedItem is Appointments selected)
            {
                var editWindow = new EditWindow(selected);
                if (editWindow.ShowDialog() == true)
                {
                    LoadAppointments(); 
                }
            }
            else
            {
                MessageBox.Show("Выберите прием для редактирования");
            }
        }

        private void btnDeleteAppointment_Click(object sender, RoutedEventArgs e)
        {
            if (lvAppointments.SelectedItem is Appointments selected)
            {
                if (MessageBox.Show("Удалить прием?", "Подтверждение", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    try
                    {
                        DB.vet.Appointments.Remove(selected);
                        DB.vet.SaveChanges();
                        LoadAppointments(); 
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Ошибка: {ex.Message}");
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите прием для удаления");
            }
        }

        private void txtAnimalSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void lvAppointments_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}