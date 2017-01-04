var framework = window.framework || {};
framework.common = framework.common || {};
$.extend(framework.common, {
    print: function (options) {
        var self = this;

        var width = options.width == null ? 1000 : options.width;
        var height = options.height == null ? 800 : options.height;
       

        var content = '';
        if (options.css == null) {
            content += '<link href="/Content/flaty/assets/bootstrap/css/bootstrap.css" rel="stylesheet"/>';
            content += '<link href="/Content/css/invoice.css" rel="stylesheet" />';
            content += '<script src="/Content/plugins/w2ui/w2ui-1.5.rc1.js"></script>';

        }
        else {
            content += options.css;
        }
        content += "<body onload=\"\">";
        if (options.content)
            content += options.content;
        if (options.headerHtml != null) {
            content += options.headerHtml;
        }
        if (options.selector) {
            $.each(options.selectors, function (index, selector) {
                if (selector.isW2ui == true) {
                    console.log('in');
                    console.log(selector.selector);
                    content += framework.common.w2uiGridToHtml(selector.selector);
                } else {
                    content += $(selector.selector).html();
                }
            });
        }
        if (options.footerHtml != null) {
            content += options.footerHtml;
        }
        var win = window.open('', '', "left=0,top=0,width=" + width + ",height=" + height + ",toolbar=0,scrollbars=0,status =0");
        win.document.write(content);
        win.document.close();
    },
    w2uiGridToHtml: function (grid) {
        var content = '<table class="table table-bordered table-striped"><tr>';
        $.each(grid.columns, function (index, column) {
            if (column.excludePrint == true)
                return true;
            content += "<th>" + column.caption + "</th>";
        })

        $.each(grid.records, function (index, record) {
            content += "<tr>";
            $.each(grid.columns, function (index, column) {
                console.log(column);
                if (column.excludePrint == true)
                    return;
                if (column.render == 'int') {
                    debugger
                    content += "<td>" + w2utils.formatNumber(record[column.field]) + "</td>";
                }
                else {
                    content += "<td>" + record[column.field] + "</td>";
                }
                
            })
            content += "</tr>"
        })

        content += "</tr></table>";
        return content;
    },
    exportExcel: function (option, prototypeObject) {
        if (prototypeObject) {
            var prefixName = '';
            (function createPrefixName(object) {
                $.each(object, function (k, v) {
                    prefixName += k + '.'
                    if (typeof v != 'string')
                        createPrefixName(v);
                });
            })(prototypeObject);
        }

        var form = $('<form>');
        for (var nameOfProperties in option.data) {
            var valueOfProperties = option.data[nameOfProperties];
            var name = '';
            if (prototypeObject)
                name = prefixName + nameOfProperties;
            else
                name = nameOfProperties;
            var element = $('<input>').attr({
                'type': 'text',
                'name': name,
                'value': valueOfProperties,
            });

            form.append(element);
        }
        form.attr({
            'method': 'POST',
            'action': option.url
        });
        form.submit();
    },
    openPopup: function (parentId, options, params) {
        var defaultOptions = {
            name: 'unnamed',
            minHeight: 0,
            // height: 300,
            width: 500,
            modal: false,
            resizable: true,
            position: { my: "center top+150px", at: "center top", of: window },
            openMultiple: false,
            hide: 'fade',
            show: 'fade',
            close: function (event, ui) {
                $(this).dialog('destroy').dialogExtend('destroy').remove();
            }
        };

        var defaulDialogExtendOptions = {

            maximizable: true,
            minimizable: true,
            collapsable: false,
            maximize: function (e) {
                $(e.target).trigger('resize');
            },
            restore: function (e) {
                $(e.target).trigger('resize');
            },
            minimize: function (e) {
                $(e.target).trigger('resize');
            }
        }


        $.extend(defaultOptions, options);
        $.extend(defaulDialogExtendOptions, options);

        var params = params || {};
        $.extend(params, { ParentId: parentId });
        var openPopup = function () {
            var dialog = $('<div>').load(options.url, params);
            $(dialog).attr('style', $(dialog).attr('style') + '; ' + 'overflow: auto !important');
            $(dialog).dialog(defaultOptions).dialogExtend(defaulDialogExtendOptions);
            framework.global.registerElementByPageId(parentId, defaultOptions.name, dialog);
            $(dialog).on('*', function (e) { console.log(e); });
            //sau khi vẽ page xong
            $(dialog).on('pageLoadComplete', function (event) {
                //tìm con chứa data là pageOptions
                $.each(dialog[0].childNodes, function (k, v) {
                    var data = $(v).data();
                    if (data.pageOptions) {
                        $.extend(data.pageOptions.dataIn, {
                            close: function () {
                                $(dialog).dialog('close');
                            },
                            minimize: function () {
                                $(dialog).dialogExtend('minimize');
                            },
                            restore: function () {
                                $(dialog).dialogExtend('restore');
                            },
                            maximize: function () {
                                $(dialog).dialogExtend('maximize');
                            },
                            collapse: function () {
                                $(dialog).dialogExtend('collapse');
                            },
                            getState: function () {
                                if (!$(dialog).dialog("isOpen"))
                                    return 'closed';
                                else
                                    return $(dialog).dialogExtend('state');
                            },
                            moveToTop: function () {
                                $(dialog).dialog("moveToTop");
                            },
                            loadContent: function (url, params) {
                                params = params || {};
                                //parent id của page mới sẽ là pageid của page cũ
                                $.extend(params, { ParentId: data.pageOptions.dataIn.pageId });
                                $(dialog).load(url, params);
                            }
                        });
                    }
                });
            });
        };
        if (defaultOptions.openMultiple)
            openPopup();
        else {
            var popup = framework.global.findElementByPageId(parentId, defaultOptions.name);
            if (popup) {
                try {
                    $(popup).dialog('close');
                }
                catch (err) {
                    console.log(err);
                }
            }
            openPopup();

        }



    },
    tryFunc: function (callback, timeout, maxCount, count) {
        var self = this;
        try {
            count = count || 0;
            callback && callback();
            return;
        }
        catch (err) {
            if (count >= (maxCount || 10)) {
                throw err;
            }
            else {
                setTimeout(function () {
                    self.tryFunc(callback, timeout, maxCount, count);
                }, timeout || 10);
            }
        }
    }
});