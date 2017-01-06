framework.factory('updateNhaCungCap', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle(' Cập Nhật Nhà Cung Cấp')
            .setIcon('fa-pencil-square-o');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ma', type: 'text', required: true, caption: "Mã" },
            { field: 'Ten', type: 'text', required: true, caption: 'Tên' }
            ])
            .setRecord(this.Data)
        ;
        var formFooter = widget.setting.toolbar();
        formFooter.setName('insertToolbar')
            .addItem({ id: 'btnInsert', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick:self.onBtnInsertClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption: 'Nhập lại', icon: 'fa-refresh', onClick: self.onBtnClearClick.bind(this) })
            
        ;
        content.setName('content1').addItem(form.end()).addItem(formFooter.end());
    },
    onBtnInsertClick: function () {
        var self = this;
        var form = this.findElement('insertForm');
        if (!form.validate().length) {
            $.post('/NhaCungCap/NhaCungCapManagement/ExecuteUpdateNhaCungCap', { NhaCungCap: form.record }, function (data) {
                if (data.IsSuccess) {
                    alertSuccess('Cập nhật nhà cung cấp thành công');
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
