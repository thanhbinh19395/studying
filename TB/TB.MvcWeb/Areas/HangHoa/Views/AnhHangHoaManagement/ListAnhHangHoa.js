framework.factory('hanghoa', {
    onMessageReceive: function (sender, message) {
        if (message.type == 'reload')
            this.onbtnReloadClick();
    },
    onInitContent: function (content) {
        var self = this;
        var gallery = widget.setting.gallery();
        gallery.setName('gallery').setUrlColName('LinkAnhMini').addButton('fa fa-trash-o', function (url, data, box) {
            $.post('/HangHoa/AnhHangHoaManagement/ExecuteDeleteAnhHangHoa', { AnhHangHoaId: data.AnhHangHoaId }, function (respone) {
                if (respone.IsSuccess) {
                    self.reloadGallery();
                }
                else {
                    alert(respone.Message);
                }
            })
            console.log(data);
        }).addImages(self.Data.Data);
        var form = widget.setting.form();
        form.setName('form').addFields([
            { field: 'hinh', type: 'file', required: false, caption: 'Hình ảnh', html: { attr: { placeholder: "Click để chọn ảnh - Tối đa 10 ảnh", options: { max: 10 } } } }
        ]);
        var toolbar = widget.setting.toolbar();
        toolbar.addItem({
            type: 'button', id: 'btn-upload', caption: 'Thêm ảnh', icon: 'fa-search',
            onClick: self.onbtnUploadClick.bind(self)
        })
        content.addItem(form.end()).addItem(toolbar.end()).addItem(gallery.end());
    },
    onbtnUploadClick: function () {
        var self = this;
        var form = this.findElement('form');
        var hanghoaId = this.ViewBag.HangHoa.HangHoaId;
        if (!form.record.hinh || form.record.hinh.length == 0) {
            alert('Vui lòng chọn hình ảnh để upload');
            return;
        }
        self.requestUploadImage(hanghoaId, form.record.hinh, function (respone) {
            var ahh = {
                HangHoaId: hanghoaId,
                LinkAnh: respone.ImageUrl,
                LinkAnhMini: respone.ThumbnailUrl
            };
            $.post('/HangHoa/AnhHangHoaManagement/ExecuteInsertAnhHangHoa', { AnhHangHoa: ahh }, function (data) {
                if (data.IsSuccess) {
                    if (respone.k == respone.listLength - 1) {
                        self.reloadGallery();
                        alertSuccess('Thêm Ảnh hàng hóa thành công');
                    }
                }
                else {
                    alert(data.Message);
                }
            });
        });

        form.clear();
        self.sendMessage({
            type: 'reload',
            callback: function () {
                self.close && self.close();
            }
        });

    },
    requestUploadImage: function (id, listImage, successHandler) {
        var self = this;
        $.each(listImage, function (k, v) {
            var data = new FormData();
            data.append('fileHinh', v.content);
            var name = framework.global.makeId(id);
            var ext = v.name.split(".");
            name += '.' + ext[ext.length - 1];
            data.append('name', name);
            $.ajax({
                url: '/Uploader/ImagesUploader/UploadImageHangHoa',
                type: "POST",
                processData: false,
                contentType: false,
                data: data,
                success: function (response) {
                    response.k = k;
                    response.listLength = listImage.length;
                    successHandler && successHandler.call(self, response);
                },
                error: function (er) {
                    alert(er);
                }
            });
        });
    },
    reloadGallery: function () {
        var gallery = this.findElement('gallery');
        gallery.clear();
        $.post('/HangHoa/AnhHangHoaManagement/ExecuteSearch', { HangHoaId: this.ViewBag.HangHoa.HangHoaId }, function (respone) {
            if (respone.IsSuccess) {
                gallery.addImages(respone.Data.Data);
            }
            else {
                alert(respone.Message);
            }
        });
    }
});
