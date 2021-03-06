﻿framework.factory('hoadon', {
    commonOptions: {
        header: {
            pageTitle: 'Danh Sách Hóa Đơn',
            pageIcon: 'fa fa-list',
            fieldsSearchForm: [
               { field: 'Ten', type: 'text', required: true, caption: "Tên Hóa Đơn" },
            ],
            searchFormPanelWidth: '700px',
        },
        content: {
            gridColumn: [
                { field: 'HoaDonId', caption: 'Mã Hóa Đơn', size: '40%', sortable: true, resizable: true },
                { field: 'DonHangId', caption: 'Mã Đơn Hàng', size: '40%', sortable: true, resizable: true },
                { field: 'NguoiLapId', caption: 'Người Lập', size: '40%', sortable: true, resizable: true },
                { field: 'NgayLap', caption: 'Ngày Lập', size: '40%', sortable: true, resizable: true, format: 'mm/dd/yyyy' },
                { field: 'ThanhTien', caption: 'Thành Tiền', size: '50%', sortable: true, resizable: true },
                { field: 'GhiChu', caption: 'Ghi Chú', size: '50%', sortable: false, resizable: true },
            ],
        },
        //nhớ sửa param
        popup: {
            insert: {
                title: 'Thêm Hóa Đơn',
                url: '/DonHang/HoaDonManagement/InsertHoaDon',
                width: 600
            },
            update: {
                title: 'Cập Nhật Hóa Đơn',
                url: '/DonHang/HoaDonManagement/UpdateHoaDon',
                width: 600
            },
        },
        //nhớ sửa param
        apiExecuteUrl: {
            searchUrl: '/DonHang/HoaDonManagement/ExecuteSearch',
            deleteUrl: '/DonHang/HoaDonManagement/ExecuteDeleteHoaDon',
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
        self.searchParam = { Quan: self.ViewBag.SearchParam };
        form.setName('searchForm')
            .setFieldPerRow(1) // so cot trong form
            .addFields(this.commonOptions.header.fieldsSearchForm)
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
        console.log(this);
        content.setName('content');
        var pagi = widget.setting.pagination();
        pagi.setName('page')
            .setTotalPages(this.Data.PageCount)
            .setStartPage(this.Data.Page)
        .setPageClickHandler(this.onPageClick.bind(this))
        ;

        var grid = widget.setting.grid();
        grid.setName('grid')
            .addColumns(this.commonOptions.content.gridColumn)
            .addButton('btnInsert', 'Thêm', 'fa fa-plus', self.onbtnInsertClickCategoryGrid.bind(this))
            .addButton('btnUpdate', 'Cập nhật', 'fa fa-pencil', self.onbtnUpdateClickCategoryGrid.bind(this))
            .addButton('btnDelete', 'Xóa', 'fa fa-trash-o', self.onbtnDeleteClickCategoryGrid.bind(this))
            .setIdColumn('HoaDonId')
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
            HoaDonId: id
        });

    },
    onbtnDeleteClickCategoryGrid: function () {
        var self = this;
        w2confirm('Bạn có chắc chắn muốn xóa dòng này không ?').yes(function () {
            var grid = self.findElement('grid');
            var id = grid.getSelection()[0];
            $.post(self.commonOptions.apiExecuteUrl.deleteUrl, { HoaDonId: id }, function (data) {
                if (data.IsSuccess) {
                    alertSuccess('Xóa Hóa Đơn');
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
        self.searchParam = { HoaDon: form.record };

        $.post(this.commonOptions.apiExecuteUrl.searchUrl, { HoaDon: form.record }, function (d) {
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
            type: 'popupDSHoaDon',
            data: record,
            callback: function () {
                self.close();
            }
        }
        this.sendMessage(mess);
        this.close();
    }
});
