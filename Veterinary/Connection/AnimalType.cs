//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Veterinary.Connection
{
    using System;
    using System.Collections.Generic;
    
    public partial class AnimalType
    {
        public AnimalType()
        {
            this.Animals = new HashSet<Animals>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
    
        public virtual ICollection<Animals> Animals { get; set; }
    }
}
