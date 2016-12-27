using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace NPOI.Extension {
    using System;

    /// <summary>
    /// Represents a custom attribute to control object's properties to excel columns behaviors.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = true)]
    public class SheetAttribute : Attribute {
        public string Title { get; set; }
    }
}
