﻿framework.factory('POS', {
    onMessageReceive: function (sender, message) {
    },
    onInitContent: function (content) {
        var self = this;
        content.setName('content');
        var leftPanel = widget.setting.panel(),
            rightPanel = widget.setting.panel(),
            pagi = widget.setting.pagination(),
            grid = widget.setting.grid(),
            searchForm = widget.setting.form(),
            title = widget.setting.title(),
            gridChiTietDonHang = widget.setting.grid(),
            hanghoaToolbar = widget.setting.toolbar(),
            donhangToolbar = widget.setting.toolbar(),
            formThongTin = widget.setting.form(),
            donhangBottomToolbar = widget.setting.toolbar()
        ;
        this.curRecid = 1;
        leftPanel.setName('leftPn').addClass('col-md-7');
        rightPanel.setName('rightPn').addClass('col-md-5');

        formThongTin.setName('thongtinForm').setFieldPerRow(2) // so cot trong form 
            .addFields([
                { field: 'ThongTinNguoiDungId', caption: 'Khách', type: 'text', span: 2 },
                { field: 'HoTen', caption: 'Tên khách', type: 'text' },
                { field: 'DiaChi', caption: 'Địa chỉ', type: 'text' },
                { field: 'SoDienThoai', caption: 'Số ĐT', type: 'number', options: { caller: self } },
                { field: 'TinhThanhPho.Ten', caption: 'Tỉnh/Thành phố', type: 'text', options: { caller: self } },
                { field: 'KhachTra', caption: 'Khách trả', type: 'int', span: 2 },
                { field: 'TongCong', caption: 'Tổng cộng', type: 'int', span: 2, html: { attr: { 'disabled': true } } },
                { field: 'TienThua', caption: 'Tiền thừa', type: 'int', span: 2, html: { attr: { 'disabled': true } } },
                { field: 'GhiChu', caption: 'Ghi chú', type: 'textarea', span: 2 },
            ]).createEvent('onChange', function (e) {
                if (e.target == 'KhachTra') {
                    this.record.TienThua = e.value_new - this.record.TongCong;
                    this.fields[7].$el.val(this.record.TienThua);
                    this.fields[7].$el.change();
                }

            });
        ;


        hanghoaToolbar.addItem({
            type: 'button', id: 'btn-search', caption: 'Tìm kiếm', icon: 'fa-search',
            onClick: self.onbtnSearchClickHHTB.bind(self)
        }).addItem({
            type: 'button', id: 'btn-refresh', caption: 'Nhập lại', icon: 'fa-search',
            onClick: self.onbtnRefreshClickHHTB.bind(self)
        });

        donhangToolbar.setName('donhangtb').addItem({
            type: 'button', id: 'btn-save', caption: 'Thanh toán', icon: 'fa-search',
            onClick: self.onbtnSaveClickDHTB.bind(self)})
            .addItem({
            type: 'button', id: 'btn-print', caption: 'In hóa đơn', icon: 'fa-search',
            onClick: self.onbtnPrintClickDHTB.bind(self)
        });

        donhangBottomToolbar.setName('donhangbtb').addItem({
            type: 'button', id: 'btn-delete', caption: 'Xóa', icon: 'fa-search',
            onClick: self.onbtnDeleteClickDHTB.bind(self)
        })
        ;

        title.setName('title')
            .setIcon('fa-computer')
            .setTitle('Bán lẻ')
        ;
        searchForm.setName('searchForm').setFieldPerRow(1)
            .addFields([
            { field: 'Ten', type: 'popupDSHangHoa', required: true, caption: "Tên Hàng hóa", options: { caller: self, formName: 'form', gridName: 'chiTietDonHangGrid' } },
            { field: 'LoaiHangHoaId', type: 'popupDSLoaiHangHoa', required: true, caption: "Loại Hàng hóa", options: { caller: self, formName: 'form', gridName: 'chiTietDonHangGrid' } }
            ])
        ;

        pagi.setName('page')
        //.setTotalPages(self.ViewBag.PageCount)
        //.setStartPage(self.ViewBag.Page)
        //.setPageClickHandler(self.onPageClick.bind(this))
        ;
        grid.setName('grid')
            .addColumns([
                    { field: 'Ma', caption: 'Mã', size: '10%' },
                    { field: 'Ten', caption: 'Tên', size: '15%' },
                    { field: 'GiaBanThamKhao', caption: 'Giá', size: '10%', render: 'int' }, //number_format
                    { field: 'NhaCungCap.Ten', caption: 'Nhà Cung cấp', size: '7%' },
                    {
                        field: 'LoaiHanghoa', caption: 'Loại HH', size: '10%', render: function (record) {
                            return record.LoaiHangHoa.Ten;
                        }
                    },
                    {
                        field: "ThemButton", caption: "Thêm", size: "10%",
                        render: function (record) {
                            var a = $("<a>");
                            a.attr('href', '#');
                            a.html('Thêm vào đơn hàng');
                            return a[0].outerHTML;
                        }
                    }
            ])
            .setIdColumn('HangHoaId')
            .addRecords(self.ViewBag.ListHangHoa.Data.Data)
            .createEvent('onClick', self.onClickGridHH.bind(self))
        //.createEvent('onDblClick', self.onDblClickGridHH.bind(self))
        //.setPaginateOptions(pagi.end())
        ;


        gridChiTietDonHang.setName('chiTietDonHangGrid')
            .addColumns([
                { field: 'Ten', caption: 'Hàng hóa', size: '40%', sortable: true, resizable: true },
                { field: 'SoLuong', caption: 'Số lượng', size: '40%', sortable: true, resizable: true },
                {
                    field: 'GiaBanThamKhao', caption: 'Giá bán', size: '40%', sortable: true, resizable: true, render: 'int', editable: { type: 'float:0' }
                },
                {
                    field: 'TongCong', caption: 'Tổng cộng', size: '40%', sortable: true, resizable: true, render: 'int'
                },
            ]).setIdColumn('HangHoaId')
            .setAttr({
                fixedBody: true
            }).createEvent('onChange', function (e) {
                var grid = self.findElement('chiTietDonHangGrid');
                var ctdh = grid.get(e.recid);
                ctdh.GiaBanThamKhao = e.value_new
                ctdh.TongCong = ctdh.GiaBanThamKhao * ctdh.SoLuong;
                grid.refreshRow(e.recid);
                self.recalTongCong();
            })

            .getTemplate().height('65vh');
        //.addRecords(self.Data.Data)
        //.setPaginateOptions(pagiChiTietDonHang.end())
        ;

        leftPanel.addItem(title.end()).addItem(searchForm.end()).addItem(hanghoaToolbar.end()).addItem(grid.end());
        rightPanel.addItem(formThongTin.end()).addItem(donhangToolbar.end()).addItem(gridChiTietDonHang.end()).addItem(donhangBottomToolbar.end());

        content.addItem(leftPanel.end()).addItem(rightPanel.end());
    },
    onPageClick: function (event, page) {
        console.log(page);
        var grid = this.findElement('grid');

        this.reloadGridData(this.commonOptions.apiExecuteUrl.searchUrl, grid, page, this.searchParam);
    },
    onbtnRefreshClickHHTB: function () {

    },
    onbtnSearchClickHHTB: function () {

    },
    onbtnSaveClickDHTB: function () {
        var self = this;
        var gridDH = this.findElement('chiTietDonHangGrid');
        var gridHH = this.findElement('grid');
        var form = this.findElement('thongtinForm');

        $.each(gridDH.records, function (k, v) {
            v.GiaTien = v.GiaBanThamKhao;
        });
        //Khach la
        if (form.record.ThongTinNguoiDungId == null) {
            var data = {
                DonHang: {
                    ThanhTien: form.record.TongCong,
                    GhiChu: form.record.GhiChu
                },
                ChiTietDonHang: gridDH.records,
                ThongTinNguoiDung: form.record
            }
            $.ajax({
                type: 'POST',
                url: '/DonHang/POS/ExecuteInsertDonHangKhachLa',
                data: data,
                success: function (data) {
                    if (data.IsSuccess) {
                        self.HoaDonId = data.Data;
                    }
                    else {
                        alert(data.Message);
                    }
                },
                async: false
            });
        }
        //Khach quen
        else {
            var data = {
                DonHang: {
                    ThanhTien: form.record.TongCong,
                    GhiChu: form.record.GhiChu,
                    KhachHangId : form.ThongTinNguoiDungId
                },
                ChiTietDonHang: gridDH.records,
                ThongTinNguoiDung: form.record
            }
            $.ajax({
                type: 'POST',
                url: '/DonHang/POS/ExecuteInsertDonHangKhachQuen',
                data: data,
                success: function (data) {
                    if (data.IsSuccess) {
                        self.HoaDonId = data.Data;
                    }
                    else {
                        alert(data.Message);
                    }
                },
                async: false
            });
        }

    },
    onbtnPrintClickDHTB: function () {
        if (this.HoaDonId) {
            this.InHoaDon();
        }
        else {
            alert('Vui lòng thanh toán trước khi in Hóa đơn');
        }
    },
    onClickGridHH: function (e) {
        if (e.column == 5) {
            var gridDH = this.findElement('chiTietDonHangGrid');
            var gridHH = this.findElement('grid');
            var item = gridDH.get(e.recid);
            if (item != null) {
                item.SoLuong++;
                item.TongCong = item.GiaBanThamKhao * item.SoLuong;
                gridDH.refresh();
            }
            else {
                var ctdh = gridHH.get(e.recid);
                ctdh.SoLuong = 1;
                ctdh.TongCong = ctdh.GiaBanThamKhao * ctdh.SoLuong;
                gridDH.add(ctdh);
            }
            this.recalTongCong();
        }
    },
    onbtnDeleteClickDHTB: function (e) {
        var gridDH = this.findElement('chiTietDonHangGrid');
        gridDH.delete(true);
        this.recalTongCong();
    },
    recalTongCong: function () {
        var self = this;
        var tongcong = 0;
        var gridDH = self.findElement('chiTietDonHangGrid');
        $.each(gridDH.records, function (k, v) {
            tongcong += v.TongCong;
        });
        var form = self.findElement('thongtinForm');
        form.record.TongCong = tongcong;
        form.fields[6].$el.val(tongcong);
        form.fields[6].$el.change();
    },
    InHoaDon: function () {
        var form = this.findElement('thongtinForm');
        var grid = this.findElement('chiTietDonHangGrid');
        var tongTien = 0;
        $.each(grid.records, function (k, v) {
            tongTien += v.TongCong;
        });
        var template = "";
        template += "<div class=\"invoice-box\">";
        template += "    <table cellpadding=\"0\" cellspacing=\"0\">";
        template += "        <tbody>";
        template += "            <tr class=\"top\">";
        template += "                <td colspan=\"2\">";
        template += "                    <table>";
        template += "                        <tbody>";
        template += "                            <tr>";
        template += "                                <td class=\"title\">";
        template += "                                    <img src=\"\/images\/logo.png\" style=\"width:100%; max-width:300px;\">";
        template += "                                <\/td>";
        template += "                                <td>";
        template += "                                    <strong>Mã hóa đơn #<\/strong>: " + this.HoaDonId + "<br>";
        template += "                                    <strong>Ngày lập<\/strong>: January 1, 2015<br>";
        template += "                                    <strong>Người lập<\/strong>: February 1, 2015";
        template += "                                <\/td>";
        template += "                            <\/tr>";
        template += "                        <\/tbody>";
        template += "                    <\/table>";
        template += "                <\/td>";
        template += "            <\/tr>";
        template += "            <tr class=\"information\">";
        template += "                <td colspan=\"2\">";
        template += "                    <table>";
        template += "                        <tbody>";
        template += "                            <tr>";
        template += "                                <td colspan=\"2\">";
        template += "                                    <strong>Tên khách<\/strong> : " + (form.record.HoTen || '') + "<br>";
        template += "                                    <strong>Số điện thoại<\/strong> : " + (form.record.SoDienThoai || '') + " <br>";
        template += "                                    <strong>Địa chỉ<\/strong> : " + (form.record.DiaChi || '');
        template += "                                <\/td>";
        template += "                            <\/tr>";
        template += "                        <\/tbody>";
        template += "                    <\/table>";
        template += "                <\/td>";
        template += "            <\/tr>";
        template += "            <tr class=\"heading\">";
        template += "                <td colspan=\"2\" class=\"text-center\">Hóa đơn bán lẻ<\/td>";
        template += "            <\/tr>";
        template += framework.common.w2uiGridToHtml(grid);
        template += "<h4 class='text-right'><strong>Tổng cộng<\/strong> : " + w2utils.formatNumber(tongTien) + " vnđ<\/h4>";
        framework.common.print({
            content: template
        });
    }
    
});
