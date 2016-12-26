framework.factory('addLoaiHangHoa', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Thêm Loại hàng hóa')
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
                { field: 'NhaCungCap', caption: 'Nhà SX', type: 'text' },
                { field: 'LoaiHanghoaId', caption: 'Loại HH', type: 'popupDSLoaiHangHoa', options: { caller: self } },
                { field: 'MoTa', caption: 'Mô tả', type: 'text' },
            ]);
        var formFooter = widget.setting.toolbar();
        formFooter.setName('insertToolbar')
            .addItem({ id: 'btnInsert', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick:self.onBtnInsertClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption:'Nhập lại', icon:'fa-refresh', onClick:self.onBtnClearClick.bind(this) })
        ;
        content.setName('content1').addItem(form.end()).addItem(formFooter.end());
    },
    onBtnInsertClick: function () {
        var self = this;
        var form = this.findElement('insertForm');
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
