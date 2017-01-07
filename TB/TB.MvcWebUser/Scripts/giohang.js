var cart = {
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
                if (data.Giohang) {
                    $.each(data.Giohang, function (key, value) {
                        s += "<li class='item'>";
                        s += "  <a href='product_default.html' class='preview-image'><img class='preview' src='/Content/ip7.jpg' alt=''></a>";
                        s += "  <div class='description'> <a href='#'>" + value.ProductOrder.Ten + "</a> <strong class='price'>" + value.Quantity + " x " + value.ProductOrder.GiaBanThamKhao + "</strong> </div>";
                        s += "</li>";

                        htmlBigCart += "<tr>";
                        htmlBigCart += "<td><a onClick='cart.DeleteCart(" + value.ProductOrder.HangHoaId + ")'style='cursor:pointer' class='remove-button hidden-xs'><span class='icon-cancel-2 '></span></a></td>";
                        htmlBigCart += "    <td><a onClick='cart.DeleteCart(" + value.ProductOrder.HangHoaId + ")'style='cursor:pointer' class='remove-button visible-xs'><span class='icon-cancel-2 '></span></a><a href=''><img class='preview' src='/Content/ip7.jpg'></a></td>";
                        htmlBigCart += "<td><span class='td-name visible-xs'>Product</span><a href='#'>" + value.ProductOrder.Ten + "</a></td>";
                        htmlBigCart += "<td><span class='td-name visible-xs'>Price</span>" + value.ProductOrder.GiaBanThamKhao + "</td>";
                        htmlBigCart += "<td>";
                        htmlBigCart += "<span class='td-name visible-xs'>Quantity</span><div class='input-group quantity-control'>";
                        htmlBigCart += "    <span class='input-group-addon' onClick='cart.Subtraction(" + value.ProductOrder.HangHoaId + ")'>&minus;</span>";
                        htmlBigCart += "    <input type='text' class='form-control updateCart' value='" + value.Quantity + "' onfocusout='cart.UpdateCart(" + value.ProductOrder.HangHoaId + ")'>";
                        htmlBigCart += "    <span class='input-group-addon' onClick='cart.Addition(" + value.ProductOrder.HangHoaId + ")'>+</span>";
                        htmlBigCart += "</div>";
                        htmlBigCart += "</td>"
                        htmlBigCart += "<td><span class='td-name visible-xs'>Total</span>" + (value.Quantity * value.ProductOrder.GiaBanThamKhao) + "</td>";
                        htmlBigCart += "</tr>";
                    })
                }
                $('#ListCartitem').html(s);
                $('#ListCartitem2').html(htmlBigCart);
                                            
            }
        });
    },
    AddCart: function (HanghoaId) {
        var seft = this;
        $.ajax({
            type: "POST",
            url: "/Home/AddCart",
            data: { HanghoaId: HanghoaId },
            success: function (data) {
                alert('Đã thêm vào giỏ hàng');
                seft.getInfoCart();
            }
        });
    },
    Addition: function (HanghoaId) {
        var seft = this;
        $.ajax({
            type: "POST",
            url: "/Home/AddCart",
            data: { HanghoaId: HanghoaId },
            success: function (data) {
                seft.getInfoCart();            
            }
        });
    },
    Subtraction: function (HanghoaId) {
        var seft = this;
        $.ajax({
            type: "POST",
            url: "/Home/SubtractionCart",
            data: { HanghoaId: HanghoaId },
            success: function (data) {
                seft.getInfoCart();
            }
        });
    },
    UpdateCart: function (HanghoaId) {
        var seft = this;
        var Soluong = $('.updateCart').val();
        $.ajax({
            type: "POST",
            url: "/Home/UpdateCart",
            data: { HanghoaId: HanghoaId, soluong: Soluong },
            success: function (data) {
                seft.getInfoCart();
            }
        });

    },
    DeleteCart: function (HanghoaId) {
        var seft = this;
        $.ajax({
            type: "POST",
            url: "/Home/DeleteCart",
            data: { HanghoaId: HanghoaId},
            success: function (data) {
                seft.getInfoCart();
            }
        });
    }
}
$(document).ready(function () {
    cart.getInfoCart();
    GetQuanhuyen();
});
function GetQuanhuyen()
{
    var TinhThanhPhoId = $("#TinhThanhPho").val()
    if (TinhThanhPhoId != null) {
        $.ajax({
            type: "POST",
            url: "/Home/GetQuanhuyen",
            data: { TinhThanhPhoId: TinhThanhPhoId },
            success: function (data) {
                $('#quanhuyen').html('');
                $.each(data, function (key, value) {
                    $('#quanhuyen').append('<option value="' + value.QuanId + '">' + value.Ten + '</option>');
                })
                $('#quanhuyen').selectpicker('render');
                $('#quanhuyen').selectpicker('refresh');
            }
        });
    }
}


