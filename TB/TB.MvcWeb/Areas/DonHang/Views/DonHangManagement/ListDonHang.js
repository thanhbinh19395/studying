framework.factory('donhang', {
    commonOptions: {
        header: {
            pageTitle: ' Danh Sách Đơn Hàng - Chi Tiết Đơn Hàng',
            pageIcon: 'fa fa-list',
            searchFormPanelWidth: '700px',
        },
        content: {
            gridColumn: [
                { field: 'DonHangId', caption: 'Mã Đơn Hàng', size: '40%', sortable: true, resizable: true },
                { field: 'NgayLap', caption: 'Ngày Lập', size: '40%', sortable: true, resizable: true, format: 'mm/dd/yyyy' },
                { field: 'ThanhTien', caption: 'Thành Tiền', size: '50%', sortable: true, resizable: true },
                { field: 'KhachHangId', caption: 'Khách Hàng ID', size: '50%', sortable: true, resizable: true },
                { field: 'GhiChu', caption: 'Ghi Chú', size: '50%', sortable: false, resizable: true },
            ],
        },
        //nhớ sửa param
        popup: {
            insert: {
                title: 'Thêm Đơn Hàng',
                url: '/DonHang/DonHangManagement/InsertDonHang',
                width: 600
            },
            update: {
                title: 'Cập Nhật Đơn Hàng',
                url: '/DonHang/DonHangManagement/UpdateDonHang',
                width: 600
            },
        },
        //nhớ sửa param
        apiExecuteUrl: {
            searchUrl: '/DonHang/DonHangManagement/ExecuteSearch',
            deleteUrl: '/DonHang/DonHangManagement/ExecuteDeleteDonHang',
        }
    },
    onMessageReceive: function (sender, message) {
        if (message.type == 'reload')
            this.onbtnReloadClick();
    },
    onInitContent: function (content) {
        var self = this;

        content.setName('content');

        var donHangPanel = widget.setting.panel();
        donHangPanel.addClass('col-md-5');
        var donHangTitle = widget.setting.title();
        donHangTitle.setName('donHangTitle').setIcon('fa-file-text ').setTitle(' Đơn Hàng');
        donHangPanel.addItem(donHangTitle.end());

        var chiTietDonHangPanel = widget.setting.panel();
        
        chiTietDonHangPanel.addClass('col-md-7').css({'border-left':'1px solid black'});

        var ctdhTitle = widget.setting.title();
        ctdhTitle.setName('ctdhTitle').setIcon('fa-info').setTitle(' Chi Tiết Đơn Hàng');
        chiTietDonHangPanel.addItem(ctdhTitle.end());

        var pagiDonHang = widget.setting.pagination();
        pagiDonHang.setName('page')
            .setTotalPages(self.ViewBag.PageCount)
            .setStartPage(self.ViewBag.Page)
        .setPageClickHandler(self.onPageClick.bind(this))
        ;

        var gridDonHang = widget.setting.grid();
        gridDonHang.setName('donHangGrid')
            .addColumns(this.commonOptions.content.gridColumn)
            //.addButton('btnInsert', 'Thêm', 'fa fa-plus', self.onbtnInsertClickCategoryGrid.bind(this))
            //.addButton('btnUpdate', 'Cập nhật', 'fa fa-pencil', self.onbtnUpdateClickCategoryGrid.bind(this))
            //.addButton('btnDelete', 'Xóa', 'fa fa-trash-o', self.onbtnDeleteClickCategoryGrid.bind(this))
            .setIdColumn('DonHangId')
            .addRecords(self.Data.Data)
            .setPaginateOptions(pagiDonHang.end())
            .createEvent('onSelect', this.onDonHangGridClick.bind(this))
            //.createEvent('onRender', this.onDonHangGridRender.bind(this))

        ;
        var pagiChiTietDonHang = widget.setting.pagination();
        pagiChiTietDonHang.setName('page')
            .setTotalPages(self.ViewBag.PageCount)
            .setStartPage(self.ViewBag.Page)
        .setPageClickHandler(self.onPageClick.bind(this))
        ;
        var gridChiTietDonHang = widget.setting.grid();
        gridChiTietDonHang.setName('chiTietDonHangGrid')
            .addColumns([
                { field: 'HangHoa.Ten', caption: 'Tên Hàng Hóa', size: '40%', sortable: true, resizable: true },
                { field: 'SoLuong', caption: 'Số Lượng', size: '40%', sortable: true, resizable: true },
                { field: 'GiaTien', caption: 'Giá Bán', size: '40%', sortable: true, resizable: true },
                {
                    field: 'ThanhTien', caption: 'Thành Tiền', size: '40%', sortable: true, resizable: true, render: function (r) {
                        return r.GiaTien * r.SoLuong;
                    }
                },
                { field: 'GhiChu', caption: 'Ghi Chú', size: '40%', sortable: true, resizable: true },
            ])
            .addButton('btnInsert', 'Thêm', 'fa fa-plus', self.onbtnInsertClickCategoryGrid.bind(this))
            .addButton('btnUpdate', 'Cập nhật', 'fa fa-pencil', self.onbtnUpdateClickCategoryGrid.bind(this))
            .addButton('btnDelete', 'Xóa', 'fa fa-trash-o', self.onbtnDeleteClickCategoryGrid.bind(this))
            .setIdColumn('ChiTietDonHangId')
            //.addRecords(self.Data.Data)
            .setPaginateOptions(pagiChiTietDonHang.end())

        ;
        donHangPanel.addItem(gridDonHang.end());
        chiTietDonHangPanel.addItem(gridChiTietDonHang.end());
        content.addItem(donHangPanel.end()).addItem(chiTietDonHangPanel.end());
    },
    onDonHangGridClick: function (event) {
        var self = this;
        $.post('/DonHang/DonHangManagement/ExecuteGetListChiTietDonHang', { DonHangId: event.recid }, function (result) {
            console.log(result.Data);
            var gridChiTietDonHang = self.findElement('chiTietDonHangGrid');
            gridChiTietDonHang.clear();
            gridChiTietDonHang.add(result.Data);
        });
    },
    onbtnInsertClickCategoryGrid: function () {
        this.openPopup({
            name: 'insertPopup',
            url: this.commonOptions.popup.insert.url,
            title: this.commonOptions.popup.insert.title,
            width: this.commonOptions.popup.insert.width
        });
    },
    onbtnUpdateClickCategoryGrid: function () {
        var grid = this.findElement('grid');
        var id = grid.getSelection()[0];
        if (!id) {
            //thong bao = noty 
            return;
        }
        this.openPopup({
            name: 'updatePopup',
            url: this.commonOptions.popup.update.url,
            title: this.commonOptions.popup.update.title,
            width: this.commonOptions.popup.update.width
        },
        {
            DonHangId: id
        });

    },
    onbtnDeleteClickCategoryGrid: function () {
        var self = this;
        w2confirm('Bạn có chắc chắn muốn xóa dòng này không ?').yes(function () {
            var grid = self.findElement('grid');
            var id = grid.getSelection()[0];
            $.post(self.commonOptions.apiExecuteUrl.deleteUrl, { DonHangId: id }, function (data) {
                if (data.IsSuccess) {
                    alertSuccess("Xóa đơn hàng thành công")
                    self.onbtnReloadClick();
                }
                else
                    alert(data.Message);
            });
        });
    },
    onbtnSearchClickSearchForm: function (evt) {
        var self = this;
        var grid = self.findElement('grid');

        var form = self.findElement('searchForm');
        self.searchParam = form.record;

        $.post(this.commonOptions.apiExecuteUrl.searchUrl, { DonHang: form.record }, function (d) {
            grid.clear();
            grid.add(d.Data.Data);
            console.log(d);
            // reset lai tong so trang neu so tong so trang thay doi.
            grid.pagination.reset(d.Data.Page, d.Data.PageCount);
        });

        var headerContent = self.findElement('headerContent');
        headerContent.toggle();
    },
    onPageClick: function (event, page) {
        console.log(page);
        var grid = this.findElement('grid');

        this.reloadGridData(this.commonOptions.apiExecuteUrl.searchUrl, grid, page, this.searchParam);
    },
    onbtnReloadClick: function (evt) {
        var grid = this.findElement('grid');
        var form = this.findElement('searchForm');
        this.reloadGridData(this.commonOptions.apiExecuteUrl.searchUrl, grid);
        this.searchParam = {};
        form.clear();
    },
    onDblClickGrid: function (e) {
        var self = this;
        var grid = this.findElement('grid');
        var record = grid.get(e.recid);
        var mess = {
            type: 'popupDSDonHang',
            data: record,
            callback: function () {
                self.close();
            }
        }
        this.sendMessage(mess);
        this.close();
    }
});
