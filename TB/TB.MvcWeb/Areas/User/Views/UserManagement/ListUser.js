framework.factory('user', {
    commonOptions: {
        header: {
            pageTitle: 'Danh sách User',
            pageIcon: 'fa fa-list',
            searchFormPanelWidth: '700px',
        },
        content: {
            gridColumn: [
                { field: 'UserId', caption: 'ID Tài khoản', size: '40%', sortable: true, resizable: true },
                { field: 'Username', caption: 'Tên Tài khoản', size: '50%', sortable: true, resizable: true },
                { field: 'Password', caption: 'Mật khẩu', size: '50%', sortable: true, resizable: true },
                { field: 'Email', caption: 'E-mail', size: '50%', sortable: true, resizable: true },
                { field: 'Type', caption: 'Loại Tài khoản', size: '50%', sortable: true, resizable: true },
                { field: 'ThongTinNguoiDungId', caption: 'ID Thông Tin người dùng', size: '50%', sortable: true, resizable: true }
            ],
        },
        //nhớ sửa param
        popup: {
            insert: {
                title: 'Thêm User',
                url: '/User/UserManagement/InsertUser',
                width: 600
            },
            update: {
                title: 'Cập nhật User',
                url: '/User/UserManagement/UpdateUser',
                width: 600
            },
        },
        //nhớ sửa param
        apiExecuteUrl: {
            searchUrl: '/User/UserManagement/ExecuteSearch',
            deleteUrl: '/User/UserManagement/ExecuteDeleteUser',
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
               { field: 'UserId', type: 'int', required: true, caption: "ID Tài khoản" },
               { field: 'Username', type: 'text', required: false, caption: "Tên tài khoản" },
               { field: 'Type', required: true, caption: "Loại Tài khoản" },
               { field: 'ThongTinNguoiDungId', type: 'int', required: true, caption: "Thông tin người dùng ID" }
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
            .setTotalPages(this.Data.PageCount)
            .setStartPage(this.Data.Page)
        .setPageClickHandler(self.onPageClick.bind(this))
        ;

        var grid = widget.setting.grid();
        grid.setName('grid')
            .addColumns(this.commonOptions.content.gridColumn)
            .addButton('btnInsert', 'Thêm', 'fa fa-plus', self.onbtnInsertClickCategoryGrid.bind(this))
            .addButton('btnUpdate', 'Cập nhật', 'fa fa-pencil', self.onbtnUpdateClickCategoryGrid.bind(this))
            .addButton('btnDelete', 'Xóa', 'fa fa-trash-o', self.onbtnDeleteClickCategoryGrid.bind(this))
            .setIdColumn('UserId')
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
            UserId: id
        });

    },
    onbtnDeleteClickCategoryGrid: function () {
        var self = this;
        w2confirm('Bạn có chắc chắn muốn xóa dòng này không ?').yes(function () {
            var grid = self.findElement('grid');
            var id = grid.getSelection()[0];
            $.post(self.commonOptions.apiExecuteUrl.deleteUrl, { UserId: id }, function (data) {
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

        $.post(this.commonOptions.apiExecuteUrl.searchUrl, { User: form.record }, function (d) {
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
            type: 'popupDSUser',
            data: record,
            callback: function () {
                self.close();
            }
        }
        this.sendMessage(mess);
        this.close();
    }
});
