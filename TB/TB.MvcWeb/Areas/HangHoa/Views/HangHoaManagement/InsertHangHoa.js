framework.factory('addHangHoa', {
    onMessageReceive: function (sender, data) {
        console.log(data);
        var editor = this.findElement('moTaEditor');
        editor.addImage(data)
    },
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Thêm Hàng hóa')
            .setIcon('fa-bar-plus');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        console.log(this.ViewBag);
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
                { field: 'Ma', caption: 'Mã', type: 'text' },
                { field: 'Ten', caption: 'Tên', type: 'text' },
                { field: 'GiaBanThamKhao', caption: 'Giá', type: 'text' },
                { field: 'NhaCungCapId', caption: 'Nhà SX', type: 'text' },
                { field: 'LoaiHangHoaId', caption: 'Loại HH', type: 'popupDSLoaiHangHoa', options: { caller: self } },
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
                        resizable:false
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
        if (!form.validate().length) {
            $.post('/HangHoa/HangHoaManagement/ExecuteInsertHangHoa', { HangHoa: form.record }, function (data) {
                if (!data.IsSuccess) {
                    alert(data.Message);
                    return;
                }
                self.sendMessage({
                    type: 'reload',
                    data: data,
                });
                self.close && self.close();
            });
        }
    },
    onBtnClearClick: function () {
        var form = this.findElement('insertForm');
        form.clear();
    }


});
