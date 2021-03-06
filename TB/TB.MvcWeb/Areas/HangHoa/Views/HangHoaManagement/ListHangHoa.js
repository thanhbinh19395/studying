﻿framework.factory('hanghoa', {
    commonOptions: {
        header: {
            pageTitle: ' Danh Sách Hàng Hóa',
            pageIcon: 'fa fa-list',
            searchFormPanelWidth: '600px',
        },
        content: {
            gridColumn: [
                    //{
                    //    field: 'hinh', caption: 'Hình', size: '5%', render: function (hanghoa) {
                    //        return 0;//"<img style=\"vertical-align:center;\" height=\"60\" src=\"Resource/HinhAnh/hanghoa/" + hanghoa.hinh + "\"><\/img";
                    //    }, style: 'text-align:center'
                    //},
                    { field: 'Ma', caption: 'Mã', size: '10%' },
                    { field: 'Ten', caption: 'Tên', size: '15%' },
                    { field: 'GiaBanThamKhao', caption: 'Giá Bán', size: '10%', render: 'float:0' }, //number_format
                    { field: 'NhaCungCap.Ten', caption: 'Nhà Sản Xuất', size: '7%' },
                    { field: 'LoaiHangHoa.Ten', caption: 'Loại Hàng Hóa', size: '10%' },
                    {
                        field: 'HinhAnh', caption: 'Hình ảnh', size: '10%', sortable: true, resizable: true, render: function (r) {
                            var a = $("<a>");
                            a.attr('href', '#');
                            a.attr('type', 'click');
                            a.html('Quản lý ảnh');
                            return a[0].outerHTML;
                        }
                    }
            ],
        },
        //nhớ sửa param
        popup: {
            insert: {
                title: 'Thêm Hàng hóa',
                url: '/HangHoa/HangHoaManagement/InsertHangHoa',
                width: 650
            },
            update: {
                title: 'Cập nhật Hàng hóa',
                url: '/HangHoa/HangHoaManagement/UpdateHangHoa',
                width: 600
            },
        },
        //nhớ sửa param
        apiExecuteUrl: {
            searchUrl: '/HangHoa/HangHoaManagement/ExecuteSearch',
            deleteUrl: '/HangHoa/HangHoaManagement/ExecuteDeleteHangHoa',
        }
    },
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
            .addFields([
                { field: 'Ma', caption: 'Mã', type: 'text' },
                { field: 'Ten', caption: 'Tên', type: 'text' },
                { field: 'GiaBanThamKhao', caption: 'Giá Bán', type: 'int' },
                { field: 'NhaCungCapId', caption: 'Nhà Sản Xuất', type: 'popupDSNhaCungCap', options: { caller: self } },
                { field: 'LoaiHangHoaId', caption: 'Loại Hàng Hóa', type: 'popupDSLoaiHangHoa', options: { caller: self } },
            ])
        ;
        header.setTitle(this.commonOptions.header.pageTitle)
            .setIcon(this.commonOptions.header.pageIcon);

        var formFooter = widget.setting.toolbar();
        formFooter.addItem({
            type: 'button', id: 'btn-exportExcell', caption: 'Xuất Excel', icon: 'fa-file-excel-o',
            onClick: self.onbtnExportExcelClickSearchForm.bind(self)
        }).addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: self.onbtnSearchClickSearchForm.bind(self)
        })
        ;

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
            .setIdColumn('HangHoaId')
            .addRecords(self.Data.Data)
            .setPaginateOptions(pagi.end())
            .createEvent('onClick', self.onGridClick.bind(this))
        ;

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
            HangHoaId: id
        });

    },
    onbtnDeleteClickCategoryGrid: function () {
        var self = this;
        w2confirm('Bạn có chắc chắn muốn xóa dòng này không ?').yes(function () {
            var grid = self.findElement('grid');
            var id = grid.getSelection()[0];
            $.post(self.commonOptions.apiExecuteUrl.deleteUrl, { HangHoaId: id }, function (data) {
                if (data.IsSuccess) {
                    alertSuccess('Xóa hàng hóa thành công');
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

        $.post(this.commonOptions.apiExecuteUrl.searchUrl, { HangHoa: form.record }, function (d) {
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
    onbtnExportExcelClickSearchForm: function () {
        var self = this;
        var grid = self.findElement('grid');

        var form = self.findElement('searchForm');
        self.searchParam = form.record;
        framework.common.exportExcel({
            url: '/HangHoa/HangHoaManagement/ExportExcelListHangHoa',
            data: form.record
        }, {
            HangHoa: 'data'
        });
        var headerContent = self.findElement('headerContent');
        headerContent.toggle();
    },
    onGridClick: function (e) {
        if (e.column == 5) {
            var self = this;
            e.onComplete = function (data) {
                if ($(data.originalEvent.srcElement).attr('type') == 'click') {
                    var grid = self.findElement('grid');
                    var selected = grid.get(data.recid);
                    self.openPopup({
                        name: 'detailPopup',
                        url: '/HangHoa/AnhHangHoaManagement/ListAnhHangHoa',
                        title: 'Hàng hóa : ' + selected.Ten || "",
                    }, selected);
                }

            }
        }
    }
});
