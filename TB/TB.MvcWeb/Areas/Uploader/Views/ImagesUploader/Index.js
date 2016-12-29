framework.factory('uploadImages', {
    onInitContent: function (content) {
        //content.setHtml(strVar);
        var self = this;
        var uploaderSetting = widget.setting.uploader();
        uploaderSetting
            .setName('uploadImages')
            .setMaxFileSize('2mb')
            .setUrl('/Uploader/ImagesUploader/ImageUpload')
            .addFilters('Image files', 'jpg,gif,png')
            .setAttr({
                rename: true,
                sortable: true,
                dragdrop: true,
                views: {
                    thumbs: true, // Show thumbs
                    active: 'thumbs'
                },
            }).onImageClick(function (data) {
                console.log(data);
                $.extend(data, { type: 'addImage' });
                self.sendMessage(data);
            }).onFileUploaded(this.onFileUploaded.bind(this))
        ;
        content.addItem(uploaderSetting.end());
    },
    onFileUploaded: function (up, file, info) {
        console.log('hello', up, file, info);
    }
    
    });