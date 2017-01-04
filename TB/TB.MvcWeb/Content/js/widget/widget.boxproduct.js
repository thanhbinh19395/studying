
$.widget('custom.Product', {
    id:'PerProduct',
    params: {
        width: '25%',
        height: 100,
        image: '',
        title:'',
        content: '',
        currency: 'Vnđ',

        ProductPrice: {
            color:'black',
            background: 'yellow',
            fontSize:12
        },
        ProductName: {
            color: 'black',
            background: '',
            fontSize:12
        },
        Quantity: {
            color: 'black',
            background: '',
            fontSize: 12
        }
    },

    product: null,

    _create: function () { },

    createHtml: function (product) {
        var self = this;
        self.product = product;
        var strVar="";
        strVar += "<div class=\"PerProduct\">";
        strVar += "            <div style=\"word-wrap: break-word;\">";
        strVar += "                <img style=\"background:#393939; cursor:pointer; height:" + self.params.height + "px; color:white;\" onclick'' class=\"ProductImage\" title=\"" + product.ProductName + "\">";
        strVar += "            <\div>";
        strVar += "            <div style=\"margin-left: auto;margin-right: auto;width:70%;background:#C8C6C6;\">";
        strVar += "                <div style=\"color:"+self.params.ProductPrice.color+";background:"+self.params.ProductPrice.background+"\">" + '<b>'+$.number(product.ProductPrice,0) + "</b> " + self.params.currency + "<\/div>";
        strVar += "                <div class=\"ProductName\" style=\"color:" + self.params.ProductName.color + ";background:" + self.params.ProductName.background + "\"> " + product.ProductName + "<\/div>";
        strVar += "                <div style=\"color:" + self.params.Quantity.color + ";background:" + self.params.Quantity.background + "\">Tồn:" + product.Quantity + "<\/div>";
        strVar += "            <\/div>";
        strVar += "        <\/div>";
        return strVar;
        
    },

    init: function (product,caller) {
        var self = this;
        self.caller= caller;
        self.element.html(self.createHtml(product));
        self.createEvent();
    },

    createEvent: function () {
        var self = this;
        $(".ProductImage", this.element).click(function () {
            window.onMessageReceive(self.id, self.product);
        });
    }
});

