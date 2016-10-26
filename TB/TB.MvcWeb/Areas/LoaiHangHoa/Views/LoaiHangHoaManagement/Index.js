framework.factory('loaihanghoa', {

    onMessageReceive: function (sender, message) {
        console.log(sender);
        console.log(message);
        message.callback && message.callback();
    },
    onInitHeader: function (header) {
        console.log(this.data);
        header.setName('header');
        var self = this;
        var form = widget.setting.form();

        form.setName('searchForm')
            .setFieldPerRow(1) // so cot trong form
            .setWidth(700)
            .addFields([
                { field: 'Ma', type: 'text', required: false, caption: "Ma"},
                { field: 'Ten', type: 'text', required: false, caption: "Ten"},
               
            ])
        ;
        header.setTitle('Danh sách Loại hàng hóa')
            .setIcon('fa-bar-chart-o');

        var formFooter = widget.setting.toolbar();
        formFooter.addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: function (evt) {
                var grid = self.findElement('grid1');
                if (grid.length > 0)
                    grid = grid[0];
                var form = self.findElement('searchForm');
                if (form.length > 0)
                    form = form[0];

                self.searchParam = form.record;
                $.get('/LoaiHangHoa/LoaiHangHoaManagement/Search', form.record, function (d) {
                    grid.clear();
                    grid.add(d.Data);
                    console.log(d);
                    // reset lai tong so trang neu so tong so trang thay doi.
                    grid.pagination.reset(d.Page, d.PageCount);
                });

                var headerContent = self.findElement('headerContent');
                headerContent[0].toggle();
            }
        });

        var formPanel = widget.setting.panel();
        formPanel.setWidth('700px').addClass('pull-right');
        formPanel.addItem(form.end());
        formPanel.addItem(formFooter.end());

        header.content().setName('headerContent').addItem(formPanel.end());
        header.title()
            .setName('title1')
            .addLeft({
                type: 'button', id: 'btn-test', caption: 'Let it go', icon: 'fa-star',
                onClick: function (evt) {
                    alert('OK!!');
                }
            })
            .addRight({
                type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
                onClick: function (evt) {
                    var headerContent = self.findElement('headerContent');
                    headerContent[0].toggle();
                    var searchForm = self.findElement('searchForm');
                    searchForm[0].resize();
                }
            }).addRight({
                type: 'button', id: 'btn-test1', caption: 'TestPopup', icon: 'fa-space-shuttle ', onClick: function () {
                    self.openPopup({ name: 'testPopup', url: '/Documents/Home/ListPerson', title: 'List Person', maximizable: false, collapsable: true, width: 800, height: 400, resizable: true });
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
        grid.setName('grid1')
            .addColumns([
                { field: 'LoaiHangHoaId', caption: 'ID', size: '50px', sortable: true, attr: 'align=center' },
                { field: 'Ma', caption: 'Ma',size:'40%', sortable: true, resizable: true },
                { field: 'Ten', caption: 'Ten',size:'50%',sortable: true, resizable: true },
           
            ])
            .addButton('btnDelete', 'Xoa', 'glyphicon-remove', self.onbtnXoaClickGrid1.bind(this)).setIdColumn('LoaiHangHoaId')
            //.setRowExpandHandler(self.onrowExpand.bind(this))
            .addRecords(self.ViewBag.Data) // du lieu random tu controller
            .createEvent('add', function () { alert('onAdd'); })
            .setPaginateOptions(pagi.end())
        ;

        var panel = widget.setting.panel();


        panel
        //.addItem(pagi.end())
        .addItem(grid.end())
        ;

        content.addItem(panel.end());
    },
    onInitFooter: function (footer) {

    },
    onbtnXoaClickGrid1: function () {
        var grid = this.findElement('grid1');
        if (grid.length > 0)
            grid = grid[0];
        grid.delete();
    },
    onbtnSearchClickSearchForm: function () {

    },
    onrowExpand: function (event) {
        console.log(event);
        var grid = this.findElement('grid1');
        if (grid.length > 0)
            grid = grid[0];
        var record = grid.records[parseInt(event.recid) - 1];

        var html = 'Hello "' + record.fname + ' ' + record.lname + '"!';

        var box = $('#' + event.box_id);
        box.html(html).animate({ height: 26 * 3 }, 100);
    },
    onPageClick: function (event, page) {
        console.log(page);
        var grid = this.findElement('grid1');
        if (grid.length > 0)
            grid = grid[0];
        this.reloadGridData('/LoaiHangHoa/LoaiHangHoaManagement/Search', grid, page, this.searchParam);
    }
});
