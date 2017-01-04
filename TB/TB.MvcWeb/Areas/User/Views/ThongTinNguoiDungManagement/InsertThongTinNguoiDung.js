framework.factory('addThongTinNguoiDung', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Thêm Thông Tin Người Dùng')
            .setIcon('fa-bar-plus');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        console.log(this.ViewBag);
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'HoTen', type: 'text', required: true, caption: "Họ Tên" },
            { field: 'SoDienThoai', type: 'text', required: false, caption: 'Số Điện Thoại' },
            { field: 'Email', type: 'text', required: false, caption: "E-mail" },
            { field: 'DiaChi', type: 'text', required: false, caption: "Địa Chỉ" },
            { field: 'QuanId', type: 'int', required: false, caption: "ID Quận" },
            { field: 'TinhThanhPhoId', type: 'int', required: false, caption: "ID Tỉnh Thành Phố" },
            { field: 'HinhAnh', type: 'text', required: false, caption: "Ảnh Đại Diện" }
            ]);
        var formFooter = widget.setting.toolbar();
        formFooter.setName('insertToolbar')
            .addItem({ id: 'btnInsert', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick: self.onBtnInsertClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption: 'Nhập lại', icon: 'fa-refresh', onClick: self.onBtnClearClick.bind(this) })
        ;
        content.setName('content1').addItem(form.end()).addItem(formFooter.end());
    },
    onBtnInsertClick: function () {
        var self = this;
        var form = this.findElement('insertForm');
        if (!form.validate().length) {
            $.post('/User/ThongTinNguoiDungManagement/ExecuteInsertThongTinNguoiDung', { ThongTinNguoiDung: form.record }, function (data) {
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
