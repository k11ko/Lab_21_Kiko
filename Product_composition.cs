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
    
    public partial class Product_composition
    {
        public int Product_Id { get; set; }
        public int Parts_Id { get; set; }
        public Nullable<int> Number_of_parts { get; set; }
    
        public virtual Parts_reference_ Parts_reference_ { get; set; }
        public virtual Product_Reference Product_Reference { get; set; }
    }
}
