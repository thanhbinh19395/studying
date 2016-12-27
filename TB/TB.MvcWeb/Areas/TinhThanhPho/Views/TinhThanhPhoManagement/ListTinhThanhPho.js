var commonOptions = {
    header: {
        pageTitle: 'Danh sách Tỉnh thành phố',
        pageIcon: 'fa fa-list',
        fieldsSearchForm: [
           { field: 'Ten', type: 'text', required: true, caption: "Tên" },
        ],
        searchFormPanelWidth: '700px',
    },
    content: {
        gridColumn: [
            { field: 'Ten', caption: 'Ten', size: '40%', sortable: true, resizable: true, test: function () { console.log(this); } },
        ],
    },
    //nhớ sửa param
    popup: {
        insert: {
            title: 'Thêm Tỉnh thành phố',
            url: '/TinhThanhPho/TinhThanhPhoManagement/InsertTinhThanhPho',
            width: 600
        },
        update: {
            title: 'Cập nhật Tỉnh thành phố',
            url: '/TinhThanhPho/TinhThanhPhoManagement/UpdateTinhThanhPho',
            width: 600
        },
    },
    //nhớ sửa param
    apiExecuteUrl: {
        searchUrl: '/TinhThanhPho/TinhThanhPhoManagement/ExecuteSearch',
        deleteUrl: '/TinhThanhPho/TinhThanhPhoManagement/ExecuteDeleteTinhThanhPho',
    }
};

framework.factory('tinhthanhpho', {
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
            .addFields(commonOptions.header.fieldsSearchForm)
        ;
        header.setTitle(commonOptions.header.pageTitle)
            .setIcon(commonOptions.header.pageIcon);

        var formFooter = widget.setting.toolbar();
        formFooter.addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: self.onbtnSearchClickSearchForm.bind(self)
        });

        var formPanel = widget.setting.panel();
        formPanel.setWidth(commonOptions.header.searchFormPanelWidth).addClass('pull-right');
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
            .addColumns(commonOptions.content.gridColumn)
            .addButton('btnInsert', 'Thêm', 'fa fa-plus', self.onbtnInsertClickCategoryGrid.bind(this))
            .addButton('btnUpdate', 'Cập nhật', 'fa fa-pencil', self.onbtnUpdateClickCategoryGrid.bind(this))
            .addButton('btnDelete', 'Xóa', 'fa fa-trash-o', self.onbtnDeleteClickCategoryGrid.bind(this))
            .setIdColumn('TinhThanhPhoId')
            .addRecords(self.Data.Data)
            .setPaginateOptions(pagi.end())
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
            url: commonOptions.popup.insert.url,
            title: commonOptions.popup.insert.title,
            width: commonOptions.popup.insert.width
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
            url: commonOptions.popup.update.url,
            title: commonOptions.popup.update.title,
            width: commonOptions.popup.update.width
        },
        {
            TinhThanhPhoId: id
        });

    },
    onbtnDeleteClickCategoryGrid: function () {
        var self = this;
        w2confirm('Bạn có chắc chắn muốn xóa dòng này không ?').yes(function () {
            var grid = self.findElement('grid');
            var id = grid.getSelection()[0];
            $.post(commonOptions.apiExecuteUrl.deleteUrl, { TinhThanhPhoId: id }, function (data) {
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

        $.post(commonOptions.apiExecuteUrl.searchUrl, { TinhThanhPho: form.record }, function (d) {
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

        this.reloadGridData(commonOptions.apiExecuteUrl.searchUrl, grid, page, this.searchParam);
    },
    onbtnReloadClick: function (evt) {
        var grid = this.findElement('grid');
        var form = this.findElement('searchForm');
        this.reloadGridData(commonOptions.apiExecuteUrl.searchUrl, grid);
        this.searchParam = {};
        form.clear();
    }
});
