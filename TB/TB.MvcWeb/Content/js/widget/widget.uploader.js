$.widget('widget.uploader', $.widget.base, {
    options: {
        name: null
    },
    _create: function () {
        this._createEvent();
        var uploader = this.element.plupload(this.options);
        this._fixCss();
        this._super();
        this._saveData(uploader);
    },
    _fixCss: function () {
        $('.ui-widget-header', this.element).css('height', '53px');
        $('.plupload_logo', this.element).remove();
        $('.plupload_view_switch', this.element).remove();
        $('.plupload_droptext', this.element).html('Kéo/Thả ảnh vào đây');
        $('.plupload_header_title', this.element).html('Chọn ảnh')
        $('.plupload_header_text', this.element).html('Sau khi upload ảnh xong, vui lòng click vào ảnh để thêm ảnh');

        
    },
    _createEvent: function () {
        var self = this;
        $.extend(this.options, {
            init: {
                FileUploaded: function (up, file, info) {
                    var data = JSON.parse(info.response);
                    self.options.onFileUploaded && self.options.onFileUploaded(up, file, info);
                    $("#" + file.id, self.element).click(function () {
                        self.options.onImageClick(data);
                    });
                },
            }
        });
    }
});