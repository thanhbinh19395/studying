framework.factory('updateUser', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Cập Nhật Tài khoản')
            .setIcon('fa-bar-plus');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        this.Data.Loai = { id: this.Data.Type };
        this.Data.Password = null;
        form.setName('updateForm').setFieldPerRow(1)
            .addFields([
                { field: 'Username', type: 'text', required: true, caption: "Tài Khoản" },
                { field: 'Password', type: 'text', required: true, caption: 'Mật Khẩu' },
                { field: 'Email', type: 'email', required: false, caption: 'E-mail' },
                {
                    field: 'Loai', type: 'list', required: true, caption: 'Loại', options: {
                        items: [
                            { id: 1, text: 'User' },
                            { id: 2, text: 'Admin' },
                        ]
                    }
                },
                { field: 'ThongTinNguoiDungId', type: 'popupDSThongTinNguoiDung', required: false, caption: 'Thông Tin Người Dùng', options: { caller: self } }
            ])
            .setRecord(this.Data)
        ;
        var formFooter = widget.setting.toolbar();
        formFooter.setName('updateToolbar')
            .addItem({ id: 'btnUpdate', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick: self.onBtnUpdateClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption: 'Nhập lại', icon: 'fa-refresh', onClick: self.onBtnClearClick.bind(this) })

        ;
        content.setName('content1').addItem(form.end()).addItem(formFooter.end());
    },
    onBtnUpdateClick: function () {
        var self = this;
        var form = this.findElement('updateForm');
        if (!form.validate().length) {
            form.record.Type = form.record.Loai.id;
            $.post('/User/UserManagement/ExecuteUpdateUser', { User: form.record }, function (data) {
                if (data.IsSuccess) {
                    alertSuccess('Cập nhật tài khoản thành công');
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
