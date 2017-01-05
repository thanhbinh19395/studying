﻿framework.factory('addTinhThanhPho', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle(' Cập Nhật Tỉnh Thành Phố')
            .setIcon('fa-sticky-note-o');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ten', type: 'text', required: true, caption: "Tên Tỉnh Thành Phố" },
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
            $.post('/TinhThanhPho/TinhThanhPhoManagement/ExecuteUpdateTinhThanhPho', { TinhThanhPho: form.record }, function (data) {
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
