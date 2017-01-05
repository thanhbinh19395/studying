framework.factory('addHangHoa', {
    onMessageReceive: function (sender, data) {
        if (data.type == 'addImage') {
            var editor = this.findElement('moTaEditor');
            editor.addImage(data)
        }
    },
    onInitHeader: function (header) {
        header.setName('header1').setTitle(' Thêm Hàng Hóa')
            .setIcon('fa-plus');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        console.log(this.ViewBag);
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
                { field: 'Ma', caption: 'Mã', required: false, type: 'text' },
                { field: 'Ten', caption: 'Tên', required: false, type: 'text' },
                { field: 'GiaBanThamKhao', required: false, caption: 'Giá', type: 'int' },
                { field: 'NhaCungCapId', required: false, caption: 'Nhà Sản Xuất', type: 'popupDSNhaCungCap', options: { caller: self } },
                { field: 'LoaiHangHoaId', required: false, caption: 'Loại Hàng Hóa', type: 'popupDSLoaiHangHoa', options: { caller: self } },
                { field: 'hinh', type: 'file', required: false, caption: 'Hình ảnh', html: { attr: { placeholder: "Click để chọn ảnh - Tối đa 10 ảnh", options: { max: 10 } } } }
            ]);
        var formFooter = widget.setting.toolbar();
        formFooter.setName('insertToolbar')
            .addItem({ id: 'btnInsert', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick: self.onBtnInsertClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption: 'Nhập lại', icon: 'fa-refresh', onClick: self.onBtnClearClick.bind(this) })
        ;

        var texteditor = widget.setting.texteditor();
        texteditor.setName('moTaEditor')
            .addButton('uploadimage', 'Up Ảnh', function () {
                self.openPopup(
                    {
                        name: 'uploadImage',
                        url: '/Uploader/ImagesUploader',
                        title: 'Chon anh',
                        width: 600,
                        resizable: false
                    });
            }, 'http://simpleicon.com/wp-content/uploads/camera.png');
        //texteditor.setHeight('80vh');
        content.setName('content1').addItem(form.end()).addItem(texteditor.end()).addItem(formFooter.end());
    },
    onBtnInsertClick: function () {
        var self = this;
        var editor = this.findElement('moTaEditor');
        var form = this.findElement('insertForm');
        $.extend(form.record, {
            MoTa: editor.getData()
        });
        var hinhAnh = form.record.hinh;
        delete form.record.hinh;

        if (!form.validate().length) {
            $.post('/HangHoa/HangHoaManagement/ExecuteInsertHangHoa', { HangHoa: form.record }, function (data) {
                if (!data.IsSuccess) {
                    debugger;
                    alert(data.Message);
                    return;
                }
                else {
                    self.requestUploadImage(data.Data, hinhAnh, function (respone) {
                            var ahh = {
                                HangHoaId: data.Data,
                                LinkAnh: respone.ImageUrl,
                                LinkAnhMini: respone.ThumbnailUrl
                            };
                            $.post('/HangHoa/AnhHangHoaManagement/ExecuteInsertAnhHangHoa', { AnhHangHoa: ahh }, function (data) {
                                if (!data.IsSuccess) {
                                    alert(data.Message);
                                    return;
                                }
                            });
                    });
                    self.sendMessage({
                        type: 'reload',
                        data: data,
                    });
                    self.close && self.close();
                }
            });
        }
    },
    onBtnClearClick: function () {
        var form = this.findElement('insertForm');
        form.clear();
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
                    console.log(response);
                    successHandler && successHandler.call(self, response);
                },
                error: function (er) {
                    alert(er);
                }
            });
        });
    }


});
