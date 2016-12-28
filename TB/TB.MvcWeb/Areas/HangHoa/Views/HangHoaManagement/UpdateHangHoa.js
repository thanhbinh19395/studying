framework.factory('updateHangHoa', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Cập nhật Hàng hóa')
            .setIcon('fa-bar-plus');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ma', type: 'text', required: true, caption: "Mã" },
            { field: 'Ten', type: 'text', required: true, caption: 'Tên' },
            { field: 'GiaBanThamKhao', type: 'text', required: true, caption: 'Giá' },
            { field: 'NhaCungCapId', type: 'text', required: true, caption: 'Nhà Cung cấp' },
            { field: 'LoaiHangHoaId', type: 'popupDSLoaiHangHoa', options: { caller: self },required: true, caption: 'Loại Hàng hóa' },
            { field: 'MoTa', type: 'text', required: false, caption: 'Mô tả' }
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
            $.post('/HangHoa/HangHoaManagement/ExecuteUpdateHangHoa', { HangHoa: form.record }, function (data) {
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
