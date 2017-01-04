framework.factory('addUser', {
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
                { field: 'Username', type: 'text', required: true, caption: "Tài khoản" },
                { field: 'Password', type: 'text', required: true, caption: 'Mật khẩu' },
                { field: 'Email', type: 'text', required: true, caption: 'E-mail' },
                { field: 'EmailConfirmed', type: 'bit', required: true, caption: 'Xác nhận E-mail' },
                { field: 'Type', type: 'int', required: true, caption: 'Loại' },
                { field: 'ThongTinNguoiDungId', type: 'int', required: true, caption: 'ID Thông tin người dùng' }
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
            $.post('/User/UserManagement/ExecuteInsertUser', { User: form.record }, function (data) {
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
