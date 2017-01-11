framework.factory('addDonHang', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle(' Chi tiết Đơn hàng')
            .setIcon('fa-plus');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        if (this.ViewBag.thongTinND)
            this.ViewBag.DonHang.TenKhachHang = this.ViewBag.thongTinND.HoTen;
        form.setName('form').setFieldPerRow(1)
            .addFields([
            { field: 'ThanhTien', type: 'int', required: true, caption: 'Tổng Tiền' },
            { field: 'NgayLap', type: 'datetime', required: true, caption: "Ngày Lập" },
            { field: 'TenKhachHang', type: 'text', required: true, caption: 'Khách Hàng' },
            { field: 'GhiChu', type: 'text', required: false, caption: 'Ghi Chú' }
            ])
            .setRecord(this.ViewBag.DonHang).isReadOnly(true)
        ;
        var pagiChiTietDonHang = widget.setting.pagination();
        pagiChiTietDonHang.setName('page')
            .setTotalPages(self.ViewBag.PageCount)
            .setStartPage(self.ViewBag.Page)
        //.setPageClickHandler(self.onPageClick.bind(this))
        ;
        var gridChiTietDonHang = widget.setting.grid();
        gridChiTietDonHang.setName('chiTietDonHangGrid')
            .addColumns([
                { field: 'HangHoa.Ten', caption: 'Tên Hàng Hóa', size: '40%', sortable: true, resizable: true },
                { field: 'SoLuong', caption: 'Số Lượng', size: '40%', sortable: true, resizable: true, render: 'int' },
                { field: 'GiaTien', caption: 'Giá Bán', size: '40%', sortable: true, resizable: true, render: 'int' },
                {
                    field: 'ThanhTien', caption: 'Thành Tiền', size: '40%', sortable: true, resizable: true, render: function (r) {
                        return w2utils.formatNumber(r.GiaTien * r.SoLuong);
                    }
                },
                { field: 'GhiChu', caption: 'Ghi Chú', size: '40%', sortable: true, resizable: true },
            ])
            .setIdColumn('ChiTietDonHangId')
            .addRecords(this.ViewBag.DonHang.ChiTietDonHangs)
            .setPaginateOptions(pagiChiTietDonHang.end())
        ;
        content.addItem(form.end()).addItem(gridChiTietDonHang.end());
    },
    onBtnClearClick: function () {
        var form = this.findElement('insertForm');
        form.clear();
    }


});
