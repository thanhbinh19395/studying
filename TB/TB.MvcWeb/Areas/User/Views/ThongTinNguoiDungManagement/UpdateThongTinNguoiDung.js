framework.factory('updateThongTinNguoiDung', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Cập nhật Thông tin người dùng')
            .setIcon('fa-bar-plus');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'HoTen', type: 'text', required: true, caption: "Họ Tên" },
            { field: 'SoDienThoai', type: 'number', required: false, caption: 'Số Điện Thoại' },
            { field: 'Email', type: 'text', required: false, caption: "E-mail" },
            { field: 'DiaChi', type: 'text', required: false, caption: "Địa Chỉ" },
            { field: 'TinhThanhPhoId', type: 'popupDSTinhThanhPho', required: false, caption: "Tỉnh Thành Phố", options: { caller: self, data : self.Data.TinhThanhPho } },
            { field: 'QuanId', type: 'popupDSQuan', required: false, caption: "Quận", options: { caller: self, data : self.Data.Quan } },
            ])
            .setRecord(this.Data)
        ;
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
            $.post('/User/ThongTinNguoiDungManagement/ExecuteUpdateThongTinNguoiDung', { ThongTinNguoiDung: form.record }, function (data) {
                if (data.IsSuccess) {
                    alertSuccess('Cập nhật thông tin người dùng thành công');
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
        var form = this.findElement('insertForm');
        form.clear();
    }


});
