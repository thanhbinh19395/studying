﻿framework.factory('updateDonHang', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Cập nhật Đơn Hàng')
            .setIcon('fa-bar-plus');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'NgayLap', type: 'datetime', required: true, caption: "Ngày Lập" },
            { field: 'ThanhTien', type: 'int', required: true, caption: 'Thành Tiền' },
            { field: 'KhachHangId', type: 'int', required: true, caption: 'Khách Hàng ID' },
            { field: 'GhiChu', type: 'text', required: false, caption: 'Ghi Chú' }
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
            $.post('/DonHang/DonHangManagement/ExecuteUpdateDonHang', { DonHang: form.record }, function (data) {
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
