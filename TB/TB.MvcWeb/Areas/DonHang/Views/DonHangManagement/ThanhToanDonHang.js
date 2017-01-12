framework.factory('updateDonHang', {
    onInitHeader: function (header) {
        header.setName('header1').setTitle('Thanh Toán Đơn Hàng')
            .setIcon('fa-credit-card');
        ;
    },
    onInitContent: function (content) {
        var self = this;
        var form = widget.setting.form();
        form.setName('form').setFieldPerRow(1)
            .addFields([
            { field: 'NgayLap', type: 'date', caption: "Ngày Lập" },
            { field: 'KhachHangId', type: 'int', caption: 'Khách Hàng ID' },
            { field: 'ThanhTien', type: 'int', caption: 'Tổng Tiền' },
            { field: 'GhiChu', type: 'text', caption: 'Ghi Chú' }
            ]).isReadOnly(true).focusRecord(1)
        //.setRecord(this.Data)
        ;
        var formDH = widget.setting.form();
        formDH.setName('formMaDH').setFieldPerRow(1)
            .addFields([
            { field: 'DonHangId', type: 'popupDSDonHang', required: true, caption: "Mã Đơn Hàng", options: { caller: self, formName: 'form', gridName: 'chiTietDonHangGrid' } },
            ])
        //.setRecord(this.Data)
        ;
        var formFooter = widget.setting.toolbar();
        formFooter.setName('insertToolbar')
            .addItem({ id: 'btnThanhToan', type: 'button', caption: 'Thanh toán', icon: ' fa-shopping-cart', onClick: self.onBtnThanhToanClick.bind(this) })
            .addItem({ id: 'btnThanhToanVaIn', type: 'button', caption: 'Thanh toán và in', icon: 'fa-print', onClick: self.onBtnThanhToanVaInClick.bind(this) })

        ;

        var gridChiTietDonHang = widget.setting.grid();
        gridChiTietDonHang.setName('chiTietDonHangGrid')
            .addColumns([
                {
                    field: 'TenHangHoa', caption: 'Tên Hàng Hóa', size: '40%', sortable: true, resizable: true, render: function (r) {
                        r.TenHangHoa = r.HangHoa.Ten;
                        return r.TenHangHoa;
                    }
                },
                { field: 'SoLuong', caption: 'Số Lượng', size: '40%', sortable: true, resizable: true },
                { field: 'GiaTien', caption: 'Giá Bán', size: '40%', sortable: true, resizable: true },
                {
                    field: 'ThanhTien', caption: 'Thành Tiền', size: '40%', sortable: true, resizable: true, render: function (r) {
                        r.ThanhTien = r.GiaTien * r.SoLuong
                        return r.ThanhTien;
                    }
                },
                { field: 'GhiChu', caption: 'Ghi Chú', size: '40%', sortable: true, resizable: true, excludePrint: true },
            ])
            .setIdColumn('ChiTietDonHangId')
        //.addRecords(self.Data.Data)
        //.setPaginateOptions(pagiChiTietDonHang.end())
        ;


        content.setName('content1').addItem(formDH.end()).addItem(form.end()).addItem(formFooter.end()).addItem(gridChiTietDonHang.end());
    },
    onBtnThanhToanVaInClick: function () {
        var self = this;
        var formMaDH = this.findElement('formMaDH');
        if (!formMaDH.validate().length) {
            $.ajax({
                type: 'POST',
                url: '/DonHang/DonHangManagement/ExecuteThanhToanDonHang',
                data: {
                    DonHangId: formMaDH.record.DonHangId,
                    GhiChu: 'Hello'
                },
                success: function (data) {
                    if (data.IsSuccess) {
                        self.InHoaDon(data.Data);
                        self.$pageEl.trigger('clear');
                    }
                    else {
                        alert(data.Message);
                    }
                },
                async: false
            });
        }
    },
    onBtnThanhToanClick: function () {
        var self = this;
        var formMaDH = this.findElement('formMaDH');
        if (!formMaDH.validate().length) {
            $.post('/DonHang/DonHangManagement/ExecuteThanhToanDonHang', {
                DonHangId: formMaDH.record.DonHangId,
                GhiChu: 'Hello'
            }, function (data) {
                if (data.IsSuccess) {
                    self.$pageEl.trigger('clear');
                }
                else {
                    alert(data.Message);
                }
            });
        }
    },
    InHoaDon: function (HoaDonId) {
        var form = this.findElement('form');
        var grid = this.findElement('chiTietDonHangGrid');
        if (form.record.KhachHangId) {
            $.ajax({
                type: 'POST',
                url: '/User/ThongTinNguoiDungManagement/ExecuteGetById',
                data: { ThongTinNguoiDungId: form.record.KhachHangId },
                success: function (respone) {
                    $.extend(form.record, respone.Data);
                },
                async: false
            });
        }
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
        template += "                                    <img src=\"\/Content\/images\/header-logo.png\" style=\"width:100%; max-width:300px;\">";
        template += "                                <\/td>";
        template += "                                <td>";
        template += "                                    <strong>Mã hóa đơn #<\/strong>: " + HoaDonId + "<br>";
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
