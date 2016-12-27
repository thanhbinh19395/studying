﻿framework.factory('donhang', {
    commonOptions: {
        header: {
            pageTitle: 'Danh sách Đơn hàng',
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
                title: 'Cập nhật Đơn Hàng',
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
    onInitHeader: function (header) {
        header.setName('header');
        var self = this;
        var form = widget.setting.form();

        form.setName('searchForm')
            .setFieldPerRow(1) // so cot trong form
            .addFields([
                { field: 'DonHangId', type: 'int', required: true, caption: "Mã Đơn hàng" },
               { field: 'NgayLap', type: 'datetime', required: false, caption: "Ngày Lập" },
               { field: 'ThanhTien', type: 'int', required: false, caption: "Thành Tiền" },
               { field: 'KhachHangId', type: 'int', required: false, caption: "Khách Hàng ID" },
               
            ])
        ;
        header.setTitle(this.commonOptions.header.pageTitle)
            .setIcon(this.commonOptions.header.pageIcon);

        var formFooter = widget.setting.toolbar();
        formFooter.addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: self.onbtnSearchClickSearchForm.bind(self)
        });

        var formPanel = widget.setting.panel();
        formPanel.setWidth(this.commonOptions.header.searchFormPanelWidth).addClass('pull-right');
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
        grid.setName('grid')
            .addColumns(this.commonOptions.content.gridColumn)
            .addButton('btnInsert', 'Thêm', 'fa fa-plus', self.onbtnInsertClickCategoryGrid.bind(this))
            .addButton('btnUpdate', 'Cập nhật', 'fa fa-pencil', self.onbtnUpdateClickCategoryGrid.bind(this))
            .addButton('btnDelete', 'Xóa', 'fa fa-trash-o', self.onbtnDeleteClickCategoryGrid.bind(this))
            .setIdColumn('DonHangId')
            .addRecords(self.Data.Data)
            .setPaginateOptions(pagi.end())

        ;

        if (this.parentId) {
            grid.createEvent('onDblClick', self.onDblClickGrid.bind(this));
        }

        var panel = widget.setting.panel();

        panel
        .addItem(grid.end())
        ;

        content.addItem(panel.end());
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
                console.log(data);
                self.onbtnReloadClick();
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