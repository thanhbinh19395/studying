$().w2field('addType', 'popupDSLoaiHangHoa', function (options) {
    var self = this;
    $(this.el).css('width', '30%').attr('disabled', 'disabled');
    var input = $('<input>').css({
        width: '65%',
        border: '0px'
    });
    $(this.el).parent().append(input);
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
    console.log($(self.el).parent().data());
    var buttonSearch = $('<button>')
        .attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon')
        .append($('<span>').addClass('fa fa-search'));
    var buttonRemove = $('<button>')
        //.attr('style', 'margin-left:auto !important; font-size:small;')
        .addClass('input-icon')
        .append($('<span>').addClass('fa fa-times'));

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
