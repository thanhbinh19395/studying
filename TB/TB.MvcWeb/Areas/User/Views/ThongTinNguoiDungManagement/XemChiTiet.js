framework.factory('updateThongTinNguoiDung', {
    onInitContent: function (content) {
        var self = this;
        var data = this.Data;
        debugger
        var htmlString = "";
        htmlString += "<h4 style=\"text-align: center\" class=\"text-danger\">Xem chi tiết<\/h4>";
        htmlString += "<table class=\"table table-striped table-condensed\">";
        htmlString += "<tr>";
        htmlString += "    <th>Họ tên<\/th>";
        htmlString += "    <td>" + (data.HoTen || 'Không') + "<\/td>";
        htmlString += "<\/tr>";
        htmlString += "<tr>";
        htmlString += "    <th>Số điện thoại<\/th>";
        htmlString += "    <td>" + (data.SoDienThoai || 'Không') + "<\/td>";
        htmlString += "<\/tr>";
        htmlString += "<tr>";
        htmlString += "    <th>Địa chỉ<\/th>";
        htmlString += "    <td>" + (data.DiaChi || 'Không') + "<\/td>";
        htmlString += "<\/tr>";
        if (data.Quan) {
            htmlString += "<tr>";
            htmlString += "    <th>Quận<\/th>";
            htmlString += "    <td>" + data.Quan.Ten + "<\/td>";
            htmlString += "<\/tr>";
        }
        if (data.TinhThanhPho) {
            htmlString += "<tr>";
            htmlString += "    <th>Tỉnh thành phố<\/th>";
            htmlString += "    <td>" + data.TinhThanhPho.Ten + "<\/td>";
            htmlString += "<\/tr>";
        }
        htmlString += "<\/table>";
        this.$contentEl.append(htmlString);
        var toolbar = widget.setting.toolbar();;
        toolbar.setName('toolbar').addItem({
            id: 'btnClose', type: 'button', caption: 'Đóng', icon: 'fa-floppy-o', onClick: function () {
                self.close();
            }
        });
        content.addItem(toolbar.end());
    },

});
