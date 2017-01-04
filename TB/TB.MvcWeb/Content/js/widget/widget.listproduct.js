
$.widget('custom.ListProduct', {
    id:'listProduct',
    listProduct: null,

    _create: function() {
        var self = this;
        self.clear();
    },

    clear: function() {
        var self = this;
        self.element.empty();
    },

    init: function (listProduct) {
        var self = this;
        self.listProduct = listProduct;
        self.clear();
        $.each(listProduct, function(index, value) {
            self.element.append('<div id=\'' + value.ProductId + '\'></div>');
            $('#' + value.ProductId).Product();
            $('#' + value.ProductId).Product('init',value);
        });
    }
});

