﻿framework.factory('addLoaiHangHoa', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle(' Thêm Loại Hàng Hóa')
            .setIcon('fa-plus');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        console.log(this.ViewBag);
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ma', type: 'text', required: true, caption: "Mã" },
            { field: 'Ten', type: 'text', required: true, caption: 'Tên' }
        ]);
        var formFooter = widget.setting.toolbar();
        formFooter.setName('insertToolbar')
            .addItem({ id: 'btnInsert', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick:self.onBtnInsertClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption:'Nhập lại', icon:'fa-refresh', onClick:self.onBtnClearClick.bind(this) })
        ;
        content.setName('content1').addItem(form.end()).addItem(formFooter.end());
    },
    onBtnInsertClick: function () {
        var self = this;
        var form = this.findElement('insertForm');
        if (!form.validate().length) {
            $.post('/LoaiHangHoa/LoaiHangHoaManagement/ExecuteInsertLoaiHangHoa', { LoaiHangHoa: form.record }, function (data) {
                //Lỗi 
                if (!data.IsSuccess) {
                    alert(data.Message);
                    return;
                }
                //Thành công
                alertSuccess('Thêm loại hàng hóa thành công');
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
