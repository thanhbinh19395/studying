
framework.factory('binhtest', {
    onMessageReceive: function (sender, message) {
   
    },
    onInitHeader: function (header) {
        header.setName('header');
        var self = this;
        header.setTitle('Danh sách sản phẩm')
            .setIcon('fa-bar-chart-o');
    },
    onInitContent: function (content) {
       
    },
});
