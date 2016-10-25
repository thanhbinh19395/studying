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
            .setFieldPerRow(3) // so cot trong form
            .setWidth(700)
            .addFields([
                { field: 'first_name', type: 'text', required: true, caption: "First Name", span: 2 },
                { field: 'last_name', type: 'text', required: true, caption: "Last Name", span: 2 },
                { field: 'comments', type: 'textarea', caption: "Comments", span: 3 },
                { field: 'address1', type: 'text', required: true, caption: "Address 1", span: 2 },
                { type: 'empty' }, // de trong 1 o trong table
                { type: 'empty' },
                { field: 'address2', type: 'text', caption: "Address 2", span: 2 },
                { field: 'city', type: 'text', required: true, caption: "City" },
                { field: 'color', type: 'color', required: true, caption: "Color" },
                { field: 'birth', type: 'date', required: true, caption: "Birthday" },
                { type: 'empty', span: 3 },
                {
                    field: 'field_list', type: 'list', required: true,
                    options: { items: ['Adams, John', 'Johnson, Peter', 'Lewis, Frank', 'Cruz, Steve', 'Donnun, Nick'] }
                },
                {
                    field: 'field_select', type: 'select', required: true,
                    options: { items: ['Adams, John', 'Johnson, Peter', 'Lewis, Frank', 'Cruz, Steve', 'Donnun, Nick'] }
                },
                { type: 'empty' },
                {
                    field: 'field_enum', type: 'enum', required: true, span: 2,
                    options: { items: ['Adams, John', 'Johnson, Peter', 'Lewis, Frank', 'Cruz, Steve', 'Donnun, Nick'] }
                },
                { field: 'field_textarea', type: 'textarea', span: 3 }
            ])
        ;
        header.setTitle('Danh sách sản phẩm')
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
                grid.search('fname', form.record['first_name']);
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
            .setTotalPages(20)
            .setStartPage(1)
        //.setPageClickHandler(self.onpageClick.bind(this))
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
            .addRecords(self.data) // du lieu random tu controller
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
    onpageClick: function (e, p) {
        console.log('you clicked page ' + p);

        var grid = this.findElement('grid1');
        if (grid.length > 0)
            grid = grid[0];
        //var page = this.findElement('page');
        //if (page.length > 0)
        //    page = page[0];

        $.get('/home/data?page=' + p, function (resp) {
            var d = JSON.parse(resp);
            grid.clear();
            grid.add(d.Data);

            // reset lai tong so trang neu so tong so trang thay doi.
            grid.pagination.reset(d.Page, d.TotalPage);
        });
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
    }
});
