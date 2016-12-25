framework.factory('hanghoa', {
    onMessageReceive: function (sender, message) {
        if (message.type == 'reload')
            this.onbtnReloadClick();
    },
    onInitHeader: function (header) {
        console.log(this.ViewBag);
        header.setName('header');
        var self = this;
        var form = widget.setting.form();

        form.setName('searchForm')
            .setFieldPerRow(1) // so cot trong form
            //.setWidth(700)
            .addFields([
                { field: 'Ma', type: 'popupListCategory', required: true, caption: "Ma", options: { caller: self } },
                { field: 'Ten', type: 'text', required: false, caption: "Ten" },
            ])
        ;
        header.setTitle('Danh sách Hàng hóa')
            .setIcon('fa fa-list');

        var formFooter = widget.setting.toolbar();
        formFooter.addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: self.onbtnSearchClickSearchForm.bind(self)
        });

        var formPanel = widget.setting.panel();
        formPanel.setWidth('700px').addClass('pull-right');
        formPanel.addItem(form.end());
        formPanel.addItem(formFooter.end());

        header.content().setName('headerContent').addItem(formPanel.end());
        header.title()
            .setName('title1')

            .addLeft({
                type: 'button', id: 'btn-reload', caption: 'Tải lại', icon: 'fa-refresh',
                onClick: self.onbtnReloadClick.bind(self)
            })
            .addRight({
                type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
                onClick: function (evt) {
                    var headerContent = self.findElement('headerContent');
                    headerContent.toggle();
                    var searchForm = self.findElement('searchForm');
                    searchForm.resize();
                }
            }).addRight({
                type: 'button', id: 'btn-test1', caption: 'TestPopup', icon: 'fa-space-shuttle ', onClick: function () {
                    self.openPopup({ name: 'testPopup', url: '/LoaiHangHoa/LoaiHangHoaManagement/ListLoaiHangHoa', title: 'List Person', maximizable: false, collapsable: true, width: 800, height: 400, resizable: true });
                }
            }).addRight({
                type: 'button', id: 'btn-test2', caption: 'Multiple Popup', icon: 'fa-rocket', onClick: function () {
                    self.openPopup({ name: 'multiplePopup', url: '/LoaiHangHoa/LoaiHangHoaManagement', title: 'Multiple Popup', width: 800, resizable: true, openMultiple: true });
                }
            })
        ;
    },
    onInitContent: function (content) {
        var self = this;
        content.setName('content');
        var pagi = widget.setting.pagination();
        pagi.setName('page')
            .setTotalPages(self.ViewBag.PageCount)
            .setStartPage(self.ViewBag.Page)
        .setPageClickHandler(self.onPageClick.bind(this))
        ;

        var grid = widget.setting.grid();
        grid.setName('categoryGrid')
            .addColumns([
                {
                    field: 'hinh', caption: 'Hình', size: '5%', render: function (hanghoa) {
                        return 0;//"<img style=\"vertical-align:center;\" height=\"60\" src=\"Resource/HinhAnh/hanghoa/" + hanghoa.hinh + "\"><\/img";
                    }, style: 'text-align:center'
                },
		        { field: 'Ma', caption: 'Mã', size: '10%' },
		        { field: 'Ten', caption: 'Tên', size: '15%' },
		        { field: 'GiaBanThamKhao', caption: 'Giá', size: '10%', render: 'float:0' }, //number_format
		        { field: 'NhaCungCap', caption: 'Nhà SX', size: '7%' },
		        { field: 'LoaiHanghoa', caption: 'Loại HH', size: '10%' },
		        { field: 'MoTa', caption: 'Mô tả', size: '15%' },
            ])
            .addButton('btnInsert', 'Thêm', 'fa fa-plus', self.onbtnInsertClickCategoryGrid.bind(this))
            .addButton('btnUpdate', 'Cập nhật', 'fa fa-pencil', self.onbtnUpdateClickCategoryGrid.bind(this))
            .addButton('btnDelete', 'Xóa', 'fa fa-trash-o', self.onbtnDeleteClickCategoryGrid.bind(this))
            .setIdColumn('LoaiHangHoaId')
            //.setRowExpandHandler(self.onrowExpand.bind(this))
            .addRecords(self.Data.Data) // du lieu random tu controller
            .createEvent('onAdd', function () { alert('onAdd'); })
            .setPaginateOptions(pagi.end())
        ;

        var panel = widget.setting.panel();


        panel
        //.addItem(pagi.end())
        .addItem(grid.end())
        ;

        content.addItem(panel.end());
    },
    onbtnInsertClickCategoryGrid: function () {
        this.openPopup({
            name: 'insertCategoryPopup',
            url: '/LoaiHangHoa/LoaiHangHoaManagement/InsertLoaiHangHoa',
            title: 'Thêm Loại Hàng hóa',
            width: 800
        });
    },
    onbtnUpdateClickCategoryGrid: function () {
        var grid = this.findElement('categoryGrid');
        var id = grid.getSelection()[0];
        this.openPopup({
            name: 'insertCategoryPopup',
            url: '/LoaiHangHoa/LoaiHangHoaManagement/UpdateLoaiHangHoa',
            title: 'Thêm Loại Hàng hóa',
            width: 800
        },
        {
            LoaiHangHoaId: id
        });

    },
    onbtnDeleteClickCategoryGrid: function () {
        var self = this;
        w2confirm('Bạn có chắc chắn muốn xóa dòng này không ?').yes(function () {
            var grid = self.findElement('categoryGrid');
            var id = grid.getSelection()[0];
            $.post('/LoaiHangHoa/LoaiHangHoaManagement/ExecuteDeleteLoaiHangHoa', { LoaiHangHoaId: id }, function (data) {
                console.log(data);
                self.onbtnReloadClick();
            });
        });
    },
    onbtnSearchClickSearchForm: function (evt) {
        var self = this;
        var grid = self.findElement('categoryGrid');

        var form = self.findElement('searchForm');
        self.searchParam = form.record;
        $.post('/LoaiHangHoa/LoaiHangHoaManagement/ExecuteSearch', form.record, function (d) {
            grid.clear();
            grid.add(d.Data);
            console.log(d);
            // reset lai tong so trang neu so tong so trang thay doi.
            grid.pagination.reset(d.Data.Page, d.Data.PageCount);
        });

        var headerContent = self.findElement('headerContent');
        headerContent.toggle();
    },
    onrowExpand: function (event) {
        console.log(event);
        var grid = this.findElement('categoryGrid');
        if (grid.length > 0)
            grid = grid[0];
        var record = grid.records[parseInt(event.recid) - 1];

        var html = 'Hello "' + record.fname + ' ' + record.lname + '"!';

        var box = $('#' + event.box_id);
        box.html(html).animate({ height: 26 * 3 }, 100);
    },
    onPageClick: function (event, page) {
        console.log(page);
        var grid = this.findElement('categoryGrid');

        this.reloadGridData('/LoaiHangHoa/LoaiHangHoaManagement/ExecuteSearch', grid, page, this.searchParam);
    },
    onbtnReloadClick: function (evt) {
        var grid = this.findElement('categoryGrid');
        var form = this.findElement('searchForm');
        this.reloadGridData('/LoaiHangHoa/LoaiHangHoaManagement/ExecuteSearch', grid);
        this.searchParam = {};
        form.clear();
    }
});
