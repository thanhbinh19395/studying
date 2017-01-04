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
            donhangToolbar = widget.setting.toolbar()
        ;

        leftPanel.setName('leftPn').addClass('col-md-7');
        rightPanel.setName('rightPn').addClass('col-md-5');

        hanghoaToolbar.addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: self.onbtnSearchClickHHTB.bind(self)
        }).addItem({
            type: 'button', id: 'btn-refresh', caption: 'Nhập lại', icon: 'fa-search',
            onClick: self.onbtnRefreshClickHHTB.bind(self)
        })

        donhangToolbar.addItem({
            type: 'button', id: 'btn-save', caption: 'Lưu', icon: 'fa-search',
            onClick: self.onbtnSaveClickDHTB.bind(self)
        }).addItem({
            type: 'button', id: 'btn-thanhtoan', caption: 'Thanh toán', icon: 'fa-search',
            onClick: self.onbtnThanhToanClickDHTB.bind(self)
        }).addItem({
            type: 'button', id: 'btn-print', caption: 'In hóa đơn', icon: 'fa-search',
            onClick: self.onbtnPrintClickDHTB.bind(self)
        })

        title.setName('title')
            .setIcon('fa-computer')
            .setTitle('Bán lẻ')
        ;
        searchForm.setName('searchForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ten', type: 'popupDSHangHoa', required: true, caption: "Tên Hàng hóa", options: { caller: self, formName: 'form', gridName: 'chiTietDonHangGrid' } },
            ])
        ;

        pagi.setName('page')
        //.setTotalPages(self.ViewBag.PageCount)
        //.setStartPage(self.ViewBag.Page)
        //.setPageClickHandler(self.onPageClick.bind(this))
        ;
        grid.setName('grid')
            .addColumns(this.commonOptions.content.gridColumn)
            .setIdColumn('HangHoaId')
        //.addRecords(self.Data.Data)
        //.setPaginateOptions(pagi.end())
        ;

        gridChiTietDonHang.setName('chiTietDonHangGrid')
            .addColumns([
                { field: 'HangHoa.Ten', caption: 'Hàng hóa', size: '40%', sortable: true, resizable: true },
                { field: 'SoLuong', caption: 'Số lượng', size: '40%', sortable: true, resizable: true },
                { field: 'GiaTien', caption: 'Giá bán', size: '40%', sortable: true, resizable: true },
                {
                    field: 'TongCong', caption: 'Tổng cộng', size: '40%', sortable: true, resizable: true, render: function (r) {
                        r.TongCong = r.GiaTien * r.SoLuong;
                        return w2utils.formatNumber(r.TongCong);
                    }
                },
            ])
        //.addRecords(self.Data.Data)
        //.setPaginateOptions(pagiChiTietDonHang.end())
        ;

        leftPanel.addItem()

        content.addItem(leftPanel.End()).addItem(rightPanel.end());
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

    },
    onbtnThanhToanClickDHTB: function () {

    },
    onbtnPrintClickDHTB: function () {

    },
});
