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
            { field: 'TinhThanhPhoId', type: 'popupDSTinhThanhPho', required: false, caption: "Tỉnh Thành Phố", options: { caller: self } },
            { field: 'QuanId', type: 'popupDSQuan', required: false, caption: "Quận", options: { caller: self } },
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
                alertSuccess('Thêm thông tin người dùng thành công');
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
    },
    onPopupHandler: function (data) {
        if (data.type == 'popupDSQuan') {
            var form = this.findElement('insertForm');
            if (form.record.TinhThanhPhoId) {
                $.extend(data.param.Quan, { TinhThanhPhoId: form.record.TinhThanhPhoId });
            }
        }
    }
});
