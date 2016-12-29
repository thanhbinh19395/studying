framework.factory('updateHangHoa', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Cập nhật Hàng hóa')
            .setIcon('fa-bar-plus');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('updateForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ma', type: 'text', required: true, caption: "Mã" },
            { field: 'Ten', type: 'text', required: true, caption: 'Tên' },
            { field: 'GiaBanThamKhao', type: 'text', required: true, caption: 'Giá' },
            { field: 'NhaCungCapId', type: 'text', required: true, caption: 'Nhà Cung cấp' },
            { field: 'LoaiHangHoaId', type: 'popupDSLoaiHangHoa', options: { caller: self },required: true, caption: 'Loại Hàng hóa' },
            ])
            .setRecord(this.Data)
        ;
        var formFooter = widget.setting.toolbar();
        formFooter.setName('updateToolbar')
            .addItem({ id: 'btnUpdate', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick: self.onBtnUpdateClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption: 'Nhập lại', icon: 'fa-refresh', onClick: self.onBtnClearClick.bind(this) })

        ;
        var texteditor = widget.setting.texteditor();
        texteditor.setName('moTaEditor')
            .addButton('uploadimage', 'Up Ảnh', function () {
                //self.openPopup(
                //    {
                //        name: 'testPopup',
                //        url: '/Documents/UploadImages',
                //        title: 'Choose Images',
                //    });
                var editor = self.findElement('moTaEditor');
                editor.addImage({
                    imageUrl: '/abc/cla'
                });
            }, 'http://simpleicon.com/wp-content/uploads/camera.png').setData(this.Data.MoTa)

        ;
        //texteditor.setHeight('80vh');
        content.setName('content1').addItem(form.end()).addItem(texteditor.end()).addItem(formFooter.end());
    },
    onBtnUpdateClick: function () {
        var self = this;
        var editor = this.findElement('moTaEditor');
        var form = this.findElement('updateForm');
        $.extend(form.record, {
            MoTa: editor.getData()
        });
        if (!form.validate().length) {
            $.post('/HangHoa/HangHoaManagement/ExecuteUpdateHangHoa', { HangHoa: form.record }, function (data) {
                if (data.IsSuccess) {
                    self.sendMessage({
                        type: 'reload',
                        data: data,
                    });
                    self.close && self.close();
                }
                else {
                    alert(data.Message);
                }


            });
        }
    },
    onBtnClearClick: function () {
        var form = this.findElement('updateForm');
        form.clear();
    }


});
