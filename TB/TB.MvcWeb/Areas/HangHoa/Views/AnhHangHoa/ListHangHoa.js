framework.factory('hanghoa', {
    onMessageReceive: function (sender, message) {
        if (message.type == 'reload')
            this.onbtnReloadClick();
    },
    onInitContent: function (content) {
        var self = this;
        this.$contentEl.append('<h3> Ảnh ' + this.Data.Ten + ' <\/h3>');
        var gallery = widget.setting.gallery();

        gallery.setName('gallery').setUrlColName('LinkAnhMini').addButton('fa fa-trash-o', function (url, data, box) {
            console.log(url);
        });
      
    },
    onbtnInsertClickCategoryGrid: function () {
        
    },
    onbtnUpdateClickCategoryGrid: function () {
        

    },
   
});
