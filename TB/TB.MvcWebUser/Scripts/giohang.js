var obj = {
    getInfoCart: function(){
        $.ajax({
            type: "POST",
            url: "/Home/getInfoCart",
            success: function (data) {
                console.log(data);
                $('#ItemCount').html(data.ItemCount);
                $('.Total').html(data.Total + ' Vnd');
                var s = '';
                var htmlBigCart = '';
                $.each(data.Giohang, function (key, value) {
                    s += "<li class='item'>";
                    s += "  <a href='product_default.html' class='preview-image'><img class='preview' src='/Content/ip7.jpg' alt=''></a>";
                    s += "  <div class='description'> <a href='#'>" + value.ProductOrder.Ten + "</a> <strong class='price'>" + value.Quantity + " x "+ value.ProductOrder.GiaBanThamKhao + "</strong> </div>";
                    s += "</li>";

                    htmlBigCart+= "<tr>";
                    htmlBigCart+=    "<td><a href='#' class='remove-button hidden-xs'><span class='icon-cancel-2 '></span></a></td>";
                    htmlBigCart+=    "<td><a href='#' class='remove-button visible-xs'><span class='icon-cancel-2 '></span></a><a href=''><img class='preview' src='/Content/ip7.jpg'></a></td>";
                    htmlBigCart+=    "<td><span class='td-name visible-xs'>Product</span><a href='#'>"+ value.ProductOrder.Ten +"</a></td>";
                    htmlBigCart += "<td><span class='td-name visible-xs'>Price</span>" + value.ProductOrder.GiaBanThamKhao + "</td>";
                    htmlBigCart+=    "<td>";
                    htmlBigCart+=       "<span class='td-name visible-xs'>Quantity</span><div class='input-group quantity-control'>";
                    htmlBigCart+=       "<span class='input-group-addon'>&minus;</span>";
                    htmlBigCart +=      "<input type='text' class='form-control' value='" + value.Quantity + "'>";
                    htmlBigCart+=       "<span class='input-group-addon'>+</span>";
                    htmlBigCart+=       "</div>";
                    htmlBigCart+=     "</td>"
                    htmlBigCart += "<td><span class='td-name visible-xs'>Total</span>" + (value.Quantity * value.ProductOrder.GiaBanThamKhao) + "</td>";
                    htmlBigCart+=  "</tr>";    
                })
                $('#ListCartitem').html(s);
                $('#ListCartitem2').html(htmlBigCart);
                                
                
            }
        });
    },
}
$(document).ready(function () {
    obj.getInfoCart();
});


function AddCart(HanghoaId) {
    $.ajax({
        type: "POST",
        url: "/Home/AddCart",
        data: { HanghoaId: HanghoaId },
        success: function (data) {
            alert('Đã thêm vào giỏ hàng');
            obj.getInfoCart();
        }
    });
};
