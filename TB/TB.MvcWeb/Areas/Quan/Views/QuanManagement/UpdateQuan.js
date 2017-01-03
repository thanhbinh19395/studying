framework.factory('updateQuan', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Cập nhật Quận')
            .setIcon('fa-bar-plus');
        ;
        console.log(this.ViewBag);
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('insertForm').setFieldPerRow(1)
            .addFields([
           
            { field: 'TinhThanhPhoId', type: 'text', options: { caller: self },required: true, caption: 'Loại Quận' },
             { field: 'Ten', type: 'text', required: true, caption: 'Tên' },
            ])
            .setRecord(this.Data)
        ;
        var formFooter = widget.setting.toolbar();
        formFooter.setName('insertToolbar')
            .addItem({ id: 'btnInsert', type: 'button', caption: 'Lưu', icon: 'fa-floppy-o', onClick: self.onBtnInsertClick.bind(this) })
            .addItem({ id: 'btnClear', type: 'button', caption: 'Nhập lại', icon: 'fa-refresh', onClick: self.onBtnClearClick.bind(this) })

        ;
        //var texteditor = widget.setting.texteditor();
        //texteditor.setName('moTaEditor')
        //    .addButton('uploadimage', 'Up Ảnh', function () {
        //        //self.openPopup(
        //        //    {
        //        //        name: 'testPopup',
        //        //        url: '/Documents/UploadImages',
        //        //        title: 'Choose Images',
        //        //    });
        //        var editor = self.findElement('moTaEditor');
        //        editor.addImage({
        //            imageUrl: '/abc/cla'
        //        });
        //    }, 'http://simpleicon.com/wp-content/uploads/camera.png').setData(this.Data.MoTa)

        //;
        ////texteditor.setHeight('80vh');
        content.setName('content1').addItem(form.end()).addItem(formFooter.end());
    },
    onBtnInsertClick: function () {
        var self = this;
        var form = this.findElement('insertForm');
        if (!form.validate().length) {
            $.post('/Quan/QuanManagement/ExecuteUpdateQuan', { Quan: form.record }, function (data) {
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
