//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Lab_21_Kiko
{
    using System;
    using System.Collections.Generic;
    
    public partial class Parts_reference_
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Parts_reference_()
        {
            this.Product_composition = new HashSet<Product_composition>();
        }
    
        public int Parts_Id { get; set; }
        public string Product_Name { get; set; }
        public Nullable<double> Price { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product_composition> Product_composition { get; set; }
    }
}
