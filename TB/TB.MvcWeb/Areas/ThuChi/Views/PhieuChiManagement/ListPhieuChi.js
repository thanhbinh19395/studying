framework.factory('phieuchi', {
    commonOptions: {
        header: {
            pageTitle: ' Danh Sách Phiếu Chi - Chi Tiết Phiếu Chi',
            pageIcon: 'fa fa-list',
            searchFormPanelWidth: '700px',
        },
        content: {
            gridColumn: [
                { field: 'PhieuChiId', caption: 'ID Phiếu Chi', size: '40%', sortable: true, resizable: true },
                { field: 'NguoiLap', caption: 'Người Lập', size: '40%', sortable: true, resizable: true, format: 'mm/dd/yyyy' },
                { field: 'TongTien', caption: 'Tổng Tiền', size: '50%', sortable: true, resizable: true },
                { field: 'GhiChu', caption: 'Ghi Chú', size: '50%', sortable: false, resizable: true },
                { field: 'NgayLap', caption: 'Ngày Lập', size: '50%', sortable: true, resizable: true}
            ],
        },

        //nhớ sửa param
        apiExecuteUrl: {
            searchUrl: '/ThuChi/PhieuChiManagement/ExecuteSearch',
        }
    },
    onMessageReceive: function (sender, message) {
        if (message.type == 'reload')
            this.onbtnReloadClick();
    },
    
    onInitContent: function (content) {
        var self = this;

        content.setName('content');

        var phieuChiPanel = widget.setting.panel();
        phieuChiPanel.addClass('col-md-5');
        var phieuChiTitle = widget.setting.title();
        phieuChiTitle.setName('phieuChiTitle').setIcon('fa fa-sticky-note-o').setTitle(' Phiếu Chi');
        phieuChiPanel.addItem(phieuChiTitle.end());

        var chiTietPhieuChiPanel = widget.setting.panel();
        
        chiTietPhieuChiPanel.addClass('col-md-7').css({'border-left':'1px solid black'});

        var ctpcTitle = widget.setting.title();
        ctpcTitle.setName('ctpcTitle').setIcon('fa fa-info').setTitle(' Chi Tiết Phiếu Chi');
        chiTietPhieuChiPanel.addItem(ctpcTitle.end());

        var pagiPhieuChi = widget.setting.pagination();
        pagiPhieuChi.setName('page')
            .setTotalPages(self.ViewBag.PageCount)
            .setStartPage(self.ViewBag.Page)
        .setPageClickHandler(self.onPageClick.bind(this))
        ;

        var gridPhieuChi = widget.setting.grid();
        gridPhieuChi.setName('phieuChiGrid')
            .addColumns(this.commonOptions.content.gridColumn)
            .setIdColumn('PhieuChiId')
            .addRecords(self.Data.Data)
            .setPaginateOptions(pagiPhieuChi.end())
            .createEvent('onSelect', this.onPhieuChiGridClick.bind(this))

        ;
        var pagiChiTietPhieuChi = widget.setting.pagination();
        pagiChiTietPhieuChi.setName('page')
            .setTotalPages(self.ViewBag.PageCount)
            .setStartPage(self.ViewBag.Page)
        .setPageClickHandler(self.onPageClick.bind(this))
        ;
        var gridChiTietPhieuChi = widget.setting.grid();
        gridChiTietPhieuChi.setName('chiTietPhieuChiGrid')
            .addColumns([
                { field: 'ChiTietPhieuChiId', caption: 'ID Chi Tiết Phiếu', size: '40%', sortable: true, resizable: true },
                { field: 'MoTa', caption: 'Mô Tả', size: '40%', sortable: true, resizable: true },
                { field: 'TongTien', caption: 'Tổng Tiền', size: '40%', sortable: true, resizable: true },
                { field: 'GhiChu', caption: 'Ghi Chú', size: '40%', sortable: true, resizable: true },
                { field: 'PhieuChiId', caption: 'ID Phiếu Chi', size: '40%', sortable: true, resizable: true}
            ])
            .setIdColumn('ChiTietPhieuChiId')
            .setPaginateOptions(pagiChiTietPhieuChi.end())

        ;
        phieuChiPanel.addItem(gridPhieuChi.end());
        chiTietPhieuChiPanel.addItem(gridChiTietPhieuChi.end());
        content.addItem(phieuChiPanel.end()).addItem(chiTietPhieuChiPanel.end());
    },
    onPhieuChiGridClick: function (event) {
        var self = this;
        $.post('/ThuChi/PhieuChiManagement/ExecuteGetListChiTietPhieuChi', { PhieuChiId: event.recid }, function (result) {
            console.log(result.Data);
            var gridChiTietPhieuChi = self.findElement('chiTietPhieuChiGrid');
            gridChiTietPhieuChi.clear();
            gridChiTietPhieuChi.add(result.Data);
        });
    },
    onbtnSearchClickSearchForm: function (evt) {
        var self = this;
        var grid = self.findElement('grid');

        var form = self.findElement('searchForm');
        self.searchParam = form.record;

        $.post(this.commonOptions.apiExecuteUrl.searchUrl, { PhieuChi: form.record }, function (d) {
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
            type: 'popupDSPhieuChi',
            data: record,
            callback: function () {
                self.close();
            }
        }
        this.sendMessage(mess);
        this.close();
    }
});
