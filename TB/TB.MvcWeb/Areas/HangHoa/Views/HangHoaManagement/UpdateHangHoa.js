framework.factory('updateHanghoa', {
    onMessageReceive: function (sender, data) {
        if (data.type == 'addImage') {
            var editor = this.findElement('moTaEditor');
            editor.addImage(data)
        }
    },
    onInitHeader: function (header) {
        header.setName('header1').setTitle(' Cập nhật Hàng Hóa')
            .setIcon('fa-pencil-square-o');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        console.log(this.ViewBag);
        var form = widget.setting.form();
        form.setName('updateForm').setFieldPerRow(1)
            .addFields([
                { field: 'Ma', caption: 'Mã', required: true, type: 'text' },
                { field: 'Ten', caption: 'Tên', required: true, type: 'text' },
                { field: 'GiaBanThamKhao', required: true, caption: 'Giá', type: 'int' },
                { field: 'NhaCungCapId', required: true, caption: 'Nhà Sản Xuất', type: 'popupDSNhaCungCap', options: { caller: self, data:self.Data.NhaCungCap } },
                { field: 'LoaiHangHoaId', required: true, caption: 'Loại Hàng Hóa', type: 'popupDSLoaiHangHoa', options: { caller: self, data: self.Data.LoaiHangHoa } },
            ]).setRecord(this.Data);
        var formFooter = widget.setting.toolbar();
        formFooter.setName('updateToolbar')
            .addItem({ id: 'btnUpdate', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick: self.onBtnUpdateClick.bind(this) })
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
            }, 'http://simpleicon.com/wp-content/uploads/camera.png').setData(this.Data.MoTa);
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
                    alertSuccess('Cập nhật hàng hóa thành công');
                    self.sendMessage({
                        type: 'reload',
                        data: data,
                    });
                    self.close && self.close();
                }
                else
                {
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
