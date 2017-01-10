﻿framework.factory('addQuan', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle(' Thêm Quận/Huyện')
            .setIcon('fa-plus');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        console.log(this.ViewBag);
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
                { field: 'TinhThanhPhoId', caption: 'Tỉnh Thành Phố', require: true, type: 'popupDSTinhThanhPho', options: { caller: self } },
                { field: 'Ten', caption: 'Tên Quận/Huyện', require: true, type: 'text' },
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
        //var editor = this.findElement('moTaEditor');
        var form = this.findElement('insertForm');
        if (!form.validate().length) {
            $.post('/Quan/QuanManagement/ExecuteInsertQuan', { Quan: form.record }, function (data) {
                if (!data.IsSuccess) {
                    alert(data.Message);
                    return;
                }
                alertSuccess('Thêm quận/huyện thành công');
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
