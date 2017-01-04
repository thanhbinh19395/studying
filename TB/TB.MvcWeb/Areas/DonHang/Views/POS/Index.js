framework.factory('POS', {
    onMessageReceive: function (sender, message) {
    },
    onInitContent: function (content) {
        var self = this;
        content.setName('content');
        var leftPanel = widget.setting.panel(),
            rightPanel = widget.setting.panel(),
            pagi = widget.setting.pagination(),
            grid = widget.setting.grid(),
            searchForm = widget.setting.form(),
            title = widget.setting.title(),
            gridChiTietDonHang = widget.setting.grid(),
            hanghoaToolbar = widget.setting.toolbar(),
            donhangToolbar = widget.setting.toolbar(),
            formThongTin = widget.setting.form(),
            donhangBottomToolbar = widget.setting.toolbar()
        ;
        this.curRecid = 1;
        leftPanel.setName('leftPn').addClass('col-md-7');
        rightPanel.setName('rightPn').addClass('col-md-5');

        formThongTin.setName('thongtinForm').setFieldPerRow(2) // so cot trong form 
            .addFields([
                { field: 'ThongTinNguoiDungId', caption: 'Khách', type: 'text', span: 2 },
                { field: 'HoTen', caption: 'Tên khách', type: 'text' },
                { field: 'DiaChi', caption: 'Địa chỉ', type: 'text' },
                { field: 'SoDienThoai', caption: 'Số ĐT', type: 'text', options: { caller: self } },
                { field: 'TinhThanhPho.Ten', caption: 'Số ĐT', type: 'text', options: { caller: self } },
                { field: 'KhachTra', caption: 'Khách trả', type: 'int', span: 2 },
                { field: 'TongCong', caption: 'Tổng cộng', type: 'int', span: 2, html: { attr: { 'disabled': true } } },
                { field: 'TienThua', caption: 'Tiền thừa', type: 'int', span: 2, html: { attr: { 'disabled': true } } },
                { field: 'GhiChu', caption: 'Ghi chú', type: 'textarea', span: 2 },
            ]).createEvent('onChange', function (e) {
                if (e.target == 'KhachTra') {
                    this.record.TienThua = e.value_new - this.record.TongCong;
                    this.fields[7].$el.val(this.record.TienThua);
                    this.fields[7].$el.change();
                }
                
            });
        ;


        hanghoaToolbar.addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: self.onbtnSearchClickHHTB.bind(self)
        }).addItem({
            type: 'button', id: 'btn-refresh', caption: 'Nhập lại', icon: 'fa-search',
            onClick: self.onbtnRefreshClickHHTB.bind(self)
        });

        donhangToolbar.setName('donhangtb').addItem({
            type: 'button', id: 'btn-save', caption: 'Lưu', icon: 'fa-search',
            onClick: self.onbtnSaveClickDHTB.bind(self)
        }).addItem({
            type: 'button', id: 'btn-thanhtoan', caption: 'Thanh toán', icon: 'fa-search',
            onClick: self.onbtnThanhToanClickDHTB.bind(self)
        }).addItem({
            type: 'button', id: 'btn-print', caption: 'In hóa đơn', icon: 'fa-search',
            onClick: self.onbtnPrintClickDHTB.bind(self)
        });

        donhangBottomToolbar.setName('donhangbtb').addItem({
            type: 'button', id: 'btn-delete', caption: 'Xóa', icon: 'fa-search',
            onClick: self.onbtnDeleteClickDHTB.bind(self)
        })
        ;

        title.setName('title')
            .setIcon('fa-computer')
            .setTitle('Bán lẻ')
        ;
        searchForm.setName('searchForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ten', type: 'popupDSHangHoa', required: true, caption: "Tên Hàng hóa", options: { caller: self, formName: 'form', gridName: 'chiTietDonHangGrid' } },
            { field: 'LoaiHangHoaId', type: 'popupDSLoaiHangHoa', required: true, caption: "Loại Hàng hóa", options: { caller: self, formName: 'form', gridName: 'chiTietDonHangGrid' } }
            ])
        ;

        pagi.setName('page')
        //.setTotalPages(self.ViewBag.PageCount)
        //.setStartPage(self.ViewBag.Page)
        //.setPageClickHandler(self.onPageClick.bind(this))
        ;
        grid.setName('grid')
            .addColumns([
                    { field: 'Ma', caption: 'Mã', size: '10%' },
                    { field: 'Ten', caption: 'Tên', size: '15%' },
                    { field: 'GiaBanThamKhao', caption: 'Giá', size: '10%', render: 'int' }, //number_format
                    { field: 'NhaCungCap.Ten', caption: 'Nhà Cung cấp', size: '7%' },
                    {
                        field: 'LoaiHanghoa', caption: 'Loại HH', size: '10%', render: function (record) {
                            return record.LoaiHangHoa.Ten;
                        }
                    },
                    {
                        field: "ThemButton", caption: "Thêm", size: "10%",
                        render: function (record) {
                            var a = $("<a>");
                            a.attr('href', '#');
                            a.html('Thêm vào đơn hàng');
                            return a[0].outerHTML;
                        }
                    }
            ])
            .setIdColumn('HangHoaId')
            .addRecords(self.ViewBag.ListHangHoa.Data.Data)
            .createEvent('onClick', self.onClickGridHH.bind(self))
            //.createEvent('onDblClick', self.onDblClickGridHH.bind(self))
        //.setPaginateOptions(pagi.end())
        ;


        gridChiTietDonHang.setName('chiTietDonHangGrid')
            .addColumns([
                { field: 'Ten', caption: 'Hàng hóa', size: '40%', sortable: true, resizable: true },
                { field: 'SoLuong', caption: 'Số lượng', size: '40%', sortable: true, resizable: true },
                {
                    field: 'GiaBanThamKhao', caption: 'Giá bán', size: '40%', sortable: true, resizable: true, render: 'float:0', editable: { type: 'float:0' }
                },
                {
                    field: 'TongCong', caption: 'Tổng cộng', size: '40%', sortable: true, resizable: true, render: 'int'
                },
            ]).setIdColumn('HangHoaId')
            .setAttr({
                fixedBody: true
            }).createEvent('onChange', function (e) {
                var grid = self.findElement('chiTietDonHangGrid');
                var ctdh = grid.get(e.recid);
                ctdh.GiaBanThamKhao = e.value_new
                ctdh.TongCong = ctdh.GiaBanThamKhao * ctdh.SoLuong;
                grid.refreshRow(e.recid);
                self.recalTongCong();
            })

            .getTemplate().height('65vh');
        //.addRecords(self.Data.Data)
        //.setPaginateOptions(pagiChiTietDonHang.end())
        ;

        leftPanel.addItem(title.end()).addItem(searchForm.end()).addItem(hanghoaToolbar.end()).addItem(grid.end());
        rightPanel.addItem(formThongTin.end()).addItem(donhangToolbar.end()).addItem(gridChiTietDonHang.end()).addItem(donhangBottomToolbar.end());

        content.addItem(leftPanel.end()).addItem(rightPanel.end());
    },
    onPageClick: function (event, page) {
        console.log(page);
        var grid = this.findElement('grid');

        this.reloadGridData(this.commonOptions.apiExecuteUrl.searchUrl, grid, page, this.searchParam);
    },
    onbtnRefreshClickHHTB: function () {

    },
    onbtnSearchClickHHTB: function () {

    },
    onbtnSaveClickDHTB: function () {
        var gridDH = this.findElement('chiTietDonHangGrid');
        var gridHH = this.findElement('grid');
        var form = this.findElement('thongtinForm');

        $.each(gridDH.records, function (k, v) {
            v.GiaTien = v.GiaBanThamKhao;
        });
        //Khach la
        if (form.record.ThongTinNguoiDungId == null) {
            var data = {
                DonHang: {
                    ThanhTien: form.record.TongCong,
                    GhiChu : form.record.GhiChu
                },
                ChiTietDonHang: gridDH.records,
                ThongTinNguoiDung: form.record
            }
            $.ajax({
                type: 'POST',
                url: '/DonHang/POS/ExecuteInsertDonHangKhachLa',
                data: data,
                success: function (data) {
                    if (data.IsSuccess) {
                        debugger;
                    }
                    else {
                        alert(data.Message);
                    }
                },
                async: false
            });
        }
        
    },
    onbtnThanhToanClickDHTB: function () {

    },
    onbtnPrintClickDHTB: function () {

    },
    onClickGridHH: function (e) {
        if (e.column == 5) {
            var gridDH = this.findElement('chiTietDonHangGrid');
            var gridHH = this.findElement('grid');
            var item = gridDH.get(e.recid);
            if (item != null) {
                item.SoLuong++;
                item.TongCong = item.GiaBanThamKhao * item.SoLuong;
                gridDH.refresh();
            }
            else {
                var ctdh = gridHH.get(e.recid);
                ctdh.SoLuong = 1;
                ctdh.TongCong = ctdh.GiaBanThamKhao * ctdh.SoLuong;
                gridDH.add(ctdh);
            }
            this.recalTongCong();
        }
    },
    onbtnDeleteClickDHTB: function (e) {
        var gridDH = this.findElement('chiTietDonHangGrid');
        gridDH.delete(true);
        this.recalTongCong();
    },
    recalTongCong: function () {
        var self = this;
        var tongcong = 0;
        var gridDH = self.findElement('chiTietDonHangGrid');
        $.each(gridDH.records, function (k, v) {
            tongcong += v.TongCong;
        });
        var form = self.findElement('thongtinForm');
        form.record.TongCong = tongcong;
        form.fields[6].$el.val(tongcong);
        form.fields[6].$el.change();
    },
});
