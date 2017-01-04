framework.factory('updateUser', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Cập nhật Tài khoản')
            .setIcon('fa-bar-plus');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'Password', type: 'text', required: false, caption: "Mật khẩu mới" },
            { field: 'Email', type: 'text', required: false, caption: "E-mail" },
            { field: 'EmailConfirmed', type: 'bit', required: false, caption: "Xác nhận E-mail" },
            { field: 'Type', type: 'int', required: false, caption: "Loại tài khoản" },
            { field: 'ThongTinNguoiDungId', type: 'int', required: false, caption: "ID Thông Tin Người Dùng" },
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
            $.post('/User/UserManagement/ExecuteUpdateUser', { User: form.record }, function (data) {
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
        var form = this.findElement('insertForm');
        form.clear();
    }
});
