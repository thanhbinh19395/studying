$().w2field('addType', 'popupDSLoaiHangHoa', function (options) {
    var self = this;

    $(this.el).css('width', '30%').attr('disabled', 'disabled');
    var input;
    if ($(self.el).parent().find('.inputSearch').length) {
        input = $(self.el).parent().find('.inputSearch');
        input.val('');
        input.off('keydown');
    }
    else {
        input = $('<input>').css({
            width: '65%',
            border: '0px'
        }).attr('placeholder', 'Tìm theo tên loại hàng hóa').addClass('inputSearch');
        $(this.el).parent().append(input);
    }

    //this sau khi extend sẽ được chứa trong $(this.el).data('w2field')
    $.extend(self, {
        onMessageReceive: function (sender, message) {
            if (message.type != 'popupDSLoaiHangHoa')
                return;
            $(self.el).val(message.data.LoaiHangHoaId);
            $(self.el).change();
            $(input).val(message.data.Ten)
            $(self.el).data('data', message);
        }
    });

    var data = {
        param: {},
        name: $(self.el).attr('name'),
        type: 'popupDSLoaiHangHoa',
        id: $(self.el).attr('name'),
        $el: self.el,
        field: self,
        eventType: ''
    }

    var buttonSearch, buttonRemove;
    if ($(self.el).parent().find('.buttonSearch').length) {
        buttonSearch = $(self.el).parent().find('.buttonSearch');
    }
    else {
        buttonSearch = $('<button>')
        .attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon buttonSearch')
        .append($('<span>').addClass('fa fa-search'));
        buttonSearch.insertAfter(self.el);
    }
    if ($(self.el).parent().find('.buttonRemove').length) {
        buttonRemove = $(self.el).parent().find('.buttonRemove');
    }
    else {
        buttonRemove = $('<button>')
            .attr('style', 'font-size:small;')
            .addClass('input-icon buttonRemove')
            .append($('<span>').addClass('fa fa-times'));
        buttonRemove.appendTo($(self.el).parent());
    }

    buttonSearch.click(function () {
        if (options.caller) {
            data.eventType = 'open';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $.extend(data.param, {
            FieldName: $(self.el).attr('name'),
            SearchOnOpen: true,
            LoaiHangHoa: {
                Ten: input.val(),
                Or: false,
                Page: 1
            }
        });
        $.post('/LoaiHangHoa/LoaiHangHoaManagement/ExecuteSearch', data.param, function (result) {
            var records = result.Data.Data;
            debugger
            if (records.length == 0) {
                alert("không có loại hàng hóa cần tìm");
                return;
            }
            if (records.length == 1) {
                self.onMessageReceive(null, {
                    data: records[0],
                    type: 'popupDSLoaiHangHoa'
                });
                return;
            }
            else {
                options.caller.openPopup({
                    name: self.type,
                    url: '/LoaiHangHoa/LoaiHangHoaManagement/ListLoaiHangHoa',
                    width: data.width || (options.width || 600),
                    height: data.height || (options.height || 'auto'),
                    resizable: true

                }, data.param);
            }
        });

    });
    buttonRemove.click(function () {
        self.set(null);
        input.val('');
        $(self.el).change();
        if (options.caller) {
            data.eventType = 'remove';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $(self.el).data('data', null);
    });
    input.on('keydown', function (e) {
        if (e.which == 13) {
            buttonSearch.click();
        }
    })
    buttonRemove.appendTo($(self.el).parent());
    buttonSearch.insertAfter(self.el);
});
$().w2field('addType', 'popupDSDonHang', function (options) {
    var self = this;

    $(this.el).css('width', '30%').attr('disabled', 'disabled');
    var input;
    if ($(self.el).parent().find('.inputSearch').length) {
        input = $(self.el).parent().find('.inputSearch');
        input.val('');
        input.off('keydown');
    }
    else {
        input = $('<input>').css({
            width: '65%',
            border: '0px'
        }).attr('placeholder', 'Tìm kiếm theo mã đơn hàng').addClass('inputSearch');
        $(this.el).parent().append(input);
    }
    $(this.el).parent().append(input);
    //this sau khi extend sẽ được chứa trong $(this.el).data('w2field')
    $.extend(self, {
        onMessageReceive: function (sender, message) {
            if (message.type != 'popupDSDonHang')
                return;
            $(self.el).val(message.data.DonHangId);
            $(self.el).change();
            //$(input).val(message.data.Ten)
            $(self.el).data('data', message);
            if (options.formName) {
                var form = options.caller.findElement(options.formName);
                form.disable();
                form.record = message.data;
                form.refresh();
            }
            if (options.gridName) {
                var grid = options.caller.findElement(options.gridName);
                grid.clear();
                grid.add(message.data.ChiTietDonHangs)
            }
        }
    });

    var data = {
        param: {},
        name: $(self.el).attr('name'),
        type: 'popupDSDonHang',
        id: $(self.el).attr('name'),
        $el: self.el,
        field: self,
        eventType: ''
    }
    var buttonSearch, buttonRemove;
    if ($(self.el).parent().find('.buttonSearch').length) {
        buttonSearch = $(self.el).parent().find('.buttonSearch');
    }
    else {
        buttonSearch = $('<button>')
        .attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon buttonSearch')
        .append($('<span>').addClass('fa fa-search'));
        buttonSearch.insertAfter(self.el);
    }
    if ($(self.el).parent().find('.buttonRemove').length) {
        buttonRemove = $(self.el).parent().find('.buttonRemove');
    }
    else {
        buttonRemove = $('<button>')
            .attr('style', 'font-size:small;')
            .addClass('input-icon buttonRemove')
            .append($('<span>').addClass('fa fa-times'));
        buttonRemove.appendTo($(self.el).parent());
    }

    buttonSearch.click(function () {
        if (options.caller) {
            data.eventType = 'open';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $.extend(data.param, {
            FieldName: $(self.el).attr('name'),
            SearchOnOpen: true,
            DonHangId: input.val(),
        });
        $.post('/DonHang/DonHangManagement/ExecuteGetDonHangChuaThanhToan', data.param, function (result) {
            result = JSON.parse(result);
            if (!result.IsSuccess) {
                alert(result.Message);
                return;
            }
            var records = result.Data;
            if (records == null) {
                alert('Không có đơn hàng cần tìm');
                return;
            }

            self.onMessageReceive(null, {
                data: records,
                type: 'popupDSDonHang'
            });

        });
    });

    buttonRemove.click(function () {
        self.set(null);
        input.val('');
        $(self.el).change();
        if (options.caller) {
            data.eventType = 'remove';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $(self.el).data('data', null);
        if (options.formName) {
            var form = options.caller.findElement(options.formName);
            form.clear();
        }
        if (options.gridName) {
            var grid = options.caller.findElement(options.gridName);
            grid.clear();
        }
    });
    input.on('keydown', function (e) {
        if (e.which == 13) {
            buttonSearch.click();
        }
    })
    $(options.caller.$pageEl).on('clear', function () {
        buttonRemove.click();
    });
    buttonRemove.appendTo($(self.el).parent());
    buttonSearch.insertAfter(self.el);
});
$().w2field('addType', 'popupDSThongTinNguoiDung', function (options) {
    var self = this;


    $(this.el).css('width', '30%').attr('disabled', 'disabled');
    var input;
    if ($(self.el).parent().find('.inputSearch').length) {
        input = $(self.el).parent().find('.inputSearch');
       
    }
    else {
        input = $('<input>').css({
            width: '65%',
            border: '0px'
        }).attr('placeholder','Tìm kiếm theo tên').addClass('inputSearch');
        $(this.el).parent().append(input);
    }
    
    if (options.data) {
        input.val(options.data.HoTen);
    }
    else {
        input.val('');
    }
    input.off('keydown');
    //this sau khi extend sẽ được chứa trong $(this.el).data('w2field')
    $.extend(self, {
        onMessageReceive: function (sender, message) {
            if (message.type != 'popupDSThongTinNguoiDung')
                return;
            $(self.el).val(message.data.ThongTinNguoiDungId);
            $(self.el).change();
            $(input).val(message.data.HoTen)
            $(self.el).data('data', message);
            if (options.formName) {
                var form = options.caller.findElement(options.formName);
                form.record = message.data;
                form.refresh();
                $(input).val(message.data.HoTen)
            }
        }
    });

    var data = {
        param: {},
        name: $(self.el).attr('name'),
        type: 'popupDSThongTinNguoiDung',
        id: $(self.el).attr('name'),
        $el: self.el,
        field: self,
        eventType: ''
    }

    var buttonSearch, buttonRemove;
    if ($(self.el).parent().find('.buttonSearch').length) {
        buttonSearch = $(self.el).parent().find('.buttonSearch');
    }
    else {
        buttonSearch = $('<button>')
        .attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon buttonSearch')
        .append($('<span>').addClass('fa fa-search'));
        buttonSearch.insertAfter(self.el);
    }
    if ($(self.el).parent().find('.buttonRemove').length) {
        buttonRemove = $(self.el).parent().find('.buttonRemove');
    }
    else {
        buttonRemove = $('<button>')
            .attr('style', 'font-size:small;')
            .addClass('input-icon buttonRemove')
            .append($('<span>').addClass('fa fa-times'));
        buttonRemove.appendTo($(self.el).parent());
    }
    buttonSearch.click(function () {
        if (options.caller) {
            data.eventType = 'open';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $.extend(data.param, {
            FieldName: $(self.el).attr('name'),
            SearchOnOpen: true,
            ThongTinNguoiDung: {
                HoTen: input.val(),
                Page: 1
            }
        });
        $.post('/User/ThongTinNguoiDungManagement/ExecuteSearch', data.param, function (result) {
            var records = result.Data.Data;
            if (records.length == 0) {
                alert("không có thông tin người dùng cần tìm");
                return;
            }
            if (records.length == 1) {
                self.onMessageReceive(null, {
                    data: records[0],
                    type: 'popupDSThongTinNguoiDung'
                });
                return;
            }
            else {
                options.caller.openPopup({
                    name: self.type,
                    title:'Chọn thông tin người dùng',
                    url: '/User/ThongTinNguoiDungManagement/ListThongTinNguoiDung',
                    width: data.width || (options.width || 800),
                    height: data.height || (options.height || 'auto'),
                    resizable: true

                }, data.param);
            }
        });

    });
    buttonRemove.click(function () {
        self.set(null);
        input.val('');
        $(self.el).change();
        if (options.caller) {
            data.eventType = 'remove';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $(self.el).data('data', null);
    });
    input.on('keydown', function (e) {
        if (e.which == 13) {
            buttonSearch.click();
        }
    })
});
$().w2field('addType', 'popupDSQuan', function (options) {
    var self = this;

    $(this.el).css('width', '30%').attr('disabled', 'disabled');
    var input;
    if ($(self.el).parent().find('.inputSearch').length) {
        input = $(self.el).parent().find('.inputSearch');
        
        input.off('keydown');
    }
    else {
        input = $('<input>').css({
            width: '65%',
            border: '0px'
        }).attr('placeholder', 'Tìm kiếm theo tên Quận/Huyện').addClass('inputSearch');
        $(this.el).parent().append(input);
    }
    if (options.data) {
        input.val(options.data.Ten);
    }
    else {
        input.val('');
    }
    //this sau khi extend sẽ được chứa trong $(this.el).data('w2field')
    $.extend(self, {
        onMessageReceive: function (sender, message) {
            if (message.type != 'popupDSQuan')
                return;
            $(self.el).val(message.data.QuanId);
            $(self.el).change();
            $(input).val(message.data.Ten)
            $(self.el).data('data', message);
        }
    });

    var data = {
        param: {},
        name: $(self.el).attr('name'),
        type: 'popupDSQuan',
        id: $(self.el).attr('name'),
        $el: self.el,
        field: self,
        eventType: ''
    }

    var buttonSearch, buttonRemove;
    if ($(self.el).parent().find('.buttonSearch').length) {
        buttonSearch = $(self.el).parent().find('.buttonSearch');
    }
    else {
        buttonSearch = $('<button>')
        .attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon buttonSearch')
        .append($('<span>').addClass('fa fa-search'));
        buttonSearch.insertAfter(self.el);
    }
    if ($(self.el).parent().find('.buttonRemove').length) {
        buttonRemove = $(self.el).parent().find('.buttonRemove');
    }
    else {
        buttonRemove = $('<button>')
            .attr('style', 'font-size:small;')
            .addClass('input-icon buttonRemove')
            .append($('<span>').addClass('fa fa-times'));
        buttonRemove.appendTo($(self.el).parent());
    }
    buttonSearch.click(function () {
        $.extend(data.param, {
            FieldName: $(self.el).attr('name'),
            SearchOnOpen: true,
            Quan: {
                Ten: input.val(),
            }
        });
        if (options.caller) {
            data.eventType = 'open';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        
        $.post('/Quan/QuanManagement/ExecuteSearch', data.param, function (result) {
            var records = result.Data.Data;
            if (records.length == 0) {
                alert("không có quận cần tìm");
                return;
            }
            if (records.length == 1) {
                self.onMessageReceive(null, {
                    data: records[0],
                    type: 'popupDSQuan'
                });
                return;
            }
            else {
                options.caller.openPopup({
                    name: self.type,
                    title: 'Chọn Quận/Huyện',
                    url: '/Quan/QuanManagement/ListQuan',
                    width: data.width || (options.width || 800),
                    height: data.height || (options.height || 'auto'),
                    resizable: true

                }, data.param);
            }
        });

    });
    buttonRemove.click(function () {
        self.set(null);
        input.val('');
        $(self.el).change();
        if (options.caller) {
            data.eventType = 'remove';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $(self.el).data('data', null);
    });
    input.on('keydown', function (e) {
        if (e.which == 13) {
            buttonSearch.click();
        }
    })
});
$().w2field('addType', 'popupDSTinhThanhPho', function (options) {
    var self = this;
    $(this.el).css('width', '30%').attr('disabled', 'disabled');
    var input;
    if ($(self.el).parent().find('.inputSearch').length) {
        input = $(self.el).parent().find('.inputSearch');

        input.off('keydown');
    }
    else {
        input = $('<input>').css({
            width: '65%',
            border: '0px'
        }).attr('placeholder', 'Tìm kiếm theo tên Tỉnh/Thành phố').addClass('inputSearch');
        $(this.el).parent().append(input);
    }
    if (options.data) {
        input.val(options.data.Ten);
    }
    else {
        input.val('');
    }
    //this sau khi extend sẽ được chứa trong $(this.el).data('w2field')
    $.extend(self, {
        onMessageReceive: function (sender, message) {
            if (message.type != 'popupDSTinhThanhPho')
                return;
            $(self.el).val(message.data.TinhThanhPhoId);
            $(self.el).change();
            $(input).val(message.data.Ten)
            $(self.el).data('data', message);
        }
    });

    var data = {
        param: {},
        name: $(self.el).attr('name'),
        type: 'popupDSTinhThanhPho',
        id: $(self.el).attr('name'),
        $el: self.el,
        field: self,
        eventType: ''
    }

    var buttonSearch, buttonRemove;
    if ($(self.el).parent().find('.buttonSearch').length) {
        buttonSearch = $(self.el).parent().find('.buttonSearch');
    }
    else {
        buttonSearch = $('<button>')
        .attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon buttonSearch')
        .append($('<span>').addClass('fa fa-search'));
        buttonSearch.insertAfter(self.el);
    }
    if ($(self.el).parent().find('.buttonRemove').length) {
        buttonRemove = $(self.el).parent().find('.buttonRemove');
    }
    else {
        buttonRemove = $('<button>')
            .attr('style', 'font-size:small;')
            .addClass('input-icon buttonRemove')
            .append($('<span>').addClass('fa fa-times'));
        buttonRemove.appendTo($(self.el).parent());
    }
    buttonSearch.click(function () {
        if (options.caller) {
            data.eventType = 'open';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $.extend(data.param, {
            FieldName: $(self.el).attr('name'),
            SearchOnOpen: true,
            TinhThanhPho: {
                Ten: input.val(),
            }
        });
        $.post('/TinhThanhPho/TinhThanhPhoManagement/ExecuteSearch', data.param, function (result) {
            var records = result.Data.Data;
            if (records.length == 0) {
                alert("không có tỉnh thành phố cần tìm");
                return;
            }
            if (records.length == 1) {
                self.onMessageReceive(null, {
                    data: records[0],
                    type: 'popupDSTinhThanhPho'
                });
                return;
            }
            else {
                options.caller.openPopup({
                    name: self.type,
                    title: 'Chọn Tỉnh/Thành phố',
                    url: '/TinhThanhPho/TinhThanhPhoManagement/ListTinhThanhPho',
                    width: data.width || (options.width || 800),
                    height: data.height || (options.height || 'auto'),
                    resizable: true

                }, data.param);
            }
        });

    });
    buttonRemove.click(function () {
        self.set(null);
        input.val('');
        $(self.el).change();
        if (options.caller) {
            data.eventType = 'remove';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $(self.el).data('data', null);
    });
    input.on('keydown', function (e) {
        if (e.which == 13) {
            buttonSearch.click();
        }
    })
});
$().w2field('addType', 'popupDSNhaCungCap', function (options) {
    var self = this;
    $(this.el).css('width', '30%').attr('disabled', 'disabled');
    var input;
    if ($(self.el).parent().find('.inputSearch').length) {
        input = $(self.el).parent().find('.inputSearch');

        input.off('keydown');
    }
    else {
        input = $('<input>').css({
            width: '65%',
            border: '0px'
        }).addClass('inputSearch');
        $(this.el).attr('placeholder', 'Tìm theo tên Nhà cung cấp').parent().append(input);
    }
    if (options.data) {
        input.val(options.data.Ten);
    }
    else {
        input.val('');
    }
    //this sau khi extend sẽ được chứa trong $(this.el).data('w2field')
    $.extend(self, {
        onMessageReceive: function (sender, message) {
            if (message.type != 'popupDSNhaCungCap')
                return;
            $(self.el).val(message.data.NhaCungCapId);
            $(self.el).change();
            $(input).val(message.data.Ten)
            $(self.el).data('data', message);
        }
    });

    var data = {
        param: {},
        name: $(self.el).attr('name'),
        type: 'popupDSNhaCungCap',
        id: $(self.el).attr('name'),
        $el: self.el,
        field: self,
        eventType: ''
    }

    var buttonSearch, buttonRemove;
    if ($(self.el).parent().find('.buttonSearch').length) {
        buttonSearch = $(self.el).parent().find('.buttonSearch');
    }
    else {
        buttonSearch = $('<button>')
        .attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon buttonSearch')
        .append($('<span>').addClass('fa fa-search'));
        buttonSearch.insertAfter(self.el);
    }
    if ($(self.el).parent().find('.buttonRemove').length) {
        buttonRemove = $(self.el).parent().find('.buttonRemove');
    }
    else {
        buttonRemove = $('<button>')
            .attr('style', 'font-size:small;')
            .addClass('input-icon buttonRemove')
            .append($('<span>').addClass('fa fa-times'));
        buttonRemove.appendTo($(self.el).parent());
    }
    buttonSearch.click(function () {
        if (options.caller) {
            data.eventType = 'open';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $.extend(data.param, {
            FieldName: $(self.el).attr('name'),
            SearchOnOpen: true,
            NhaCungCap: {
                Ten: input.val(),
            }
        });
        $.post('/NhaCungCap/NhaCungCapManagement/ExecuteSearch', data.param, function (result) {
            var records = result.Data.Data;
            if (records.length == 0) {
                alert("không có nhà cung cấp cần tìm");
                return;
            }
            if (records.length == 1) {
                self.onMessageReceive(null, {
                    data: records[0],
                    type: 'popupDSNhaCungCap'
                });
                return;
            }
            else {
                options.caller.openPopup({
                    name: self.type,
                    title: 'Chọn Nhà cung cấp',
                    url: '/NhaCungCap/NhaCungCapManagement/ListNhaCungCap',
                    width: data.width || (options.width || 800),
                    height: data.height || (options.height || 'auto'),
                    resizable: true

                }, data.param);
            }
        });

    });
    buttonRemove.click(function () {
        self.set(null);
        input.val('');
        $(self.el).change();
        if (options.caller) {
            data.eventType = 'remove';
            options.caller.onPopupHandler && options.caller.onPopupHandler(data);
        }
        $(self.el).data('data', null);
    });
    input.on('keydown', function (e) {
        if (e.which == 13) {
            buttonSearch.click();
        }
    })
});