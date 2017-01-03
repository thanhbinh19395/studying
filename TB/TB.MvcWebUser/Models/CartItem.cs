using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TB.Domain.EntityModel;
namespace TB.MvcWebUser.Models
{
    public class CartItem
    {
        public HangHoa ProductOrder { get; set; }
        public int Quantity { get; set; }
    }
}