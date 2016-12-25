using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TB.BaseRepo
{
    public static class Extensions
    {
        public static bool DeepEquals(this object obj, object another)
        {
            if (ReferenceEquals(obj, another)) return true;
            if ((obj == null) || (another == null)) return false;
            if (obj.GetType() != another.GetType()) return false;

            //Common prop
            if (!obj.GetType().IsClass) return obj.Equals(another);

            //class in class
            var result = true;
            foreach (var property in obj.GetType().GetProperties())
            {
                var objValue = property.GetValue(obj);
                var anotherValue = property.GetValue(another);
                
                if (!objValue.DeepEquals(anotherValue)) result = false;
            }
            return result;
        }
    }
}
