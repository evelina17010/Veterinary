using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Veterinary.Connection;

namespace Veterinary.Fun
{
    public class Authorisation
    {
        public static ObservableCollection<User> sotrudniks { get; set; }
        public static User AuthorisationSotr(string login, string password)
        {
            sotrudniks = new ObservableCollection<User>(DB.vet.User.ToList());
            var userExists = sotrudniks.Where(sotrudniks => sotrudniks.login == login && sotrudniks.password == password).FirstOrDefault();
            if (userExists != null)
            {
                return userExists;
            }
            else
            {
                return userExists;
            }
        }
        }
}
