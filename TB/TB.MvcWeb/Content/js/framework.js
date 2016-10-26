﻿var framework = window.framework || {};
$.extend(framework, {
    createNamespace: function (baseName, scope) {
        var ns = baseName.split('.');
        var o = scope || window;
        for (var i = 0, l = ns.length; i < l; i++) {
            o = o[ns[i]] = o[ns[i]] || {};
        }
        return o;
    },
    lazyLoad: function (url, callback) {
        var url = url || url.url;
        var callback = callback || url.callback;
        $.ajax({
            url: url,
            dataType: 'script',
            success: callback,
            async: true
        });
    },
    factory: function (id, options) {
        require(['layout', 'panel'], function () {
            options.parentId = $('#page').attr('data-parentid') || null;
            $.extend(options, {
                ViewBag: ViewBag.data,
            });
            var pageOptions = {
                dataIn: options
            };

            var layoutSetting = layout.setting.page(id, options);
            var page = $('#page').panel(layoutSetting);
            
            $.extend(pageOptions, { dataOut: $(page).data("widget-panel").options });

            framework.global.registerPage(pageOptions.dataOut._pageId, pageOptions);
            page.attr('id', pageOptions.dataOut._pageId);
            console.log(pageOptions);


            if (pageOptions.dataOut.parentId) {
                $.extend(pageOptions.dataIn, function () {
                    return {
                        close: function () {
                            $(pageOptions.dataIn.$popupEl).dialog('close');
                        },
                        minimize: function () {
                            $(pageOptions.dataIn.$popupEl).dialogExtend('minimize');
                        },
                        restore: function () {
                            $(pageOptions.dataIn.$popupEl).dialogExtend('restore');
                        },
                        maximize: function () {
                            $(pageOptions.dataIn.$popupEl).dialogExtend('maximize');
                        },
                        collapse: function () {
                            $(pageOptions.dataIn.$popupEl).dialogExtend('collapse');
                        },
                        getState: function () {
                            if (!$(pageOptions.dataIn.$popupEl).dialog("isOpen"))
                                return 'closed';
                            else
                                return $(pageOptions.$popupEl).dialogExtend('state');
                        },
                        moveToTop: function () {
                            $(pageOptions.dataIn.$popupEl).dialog("moveToTop");
                        }
                    }
                }());
            }


            //default function
            if (options.onMessageReceive) {
                pageOptions.onMessageReceive = function (sender, message) {
                    //var senderPage = framework.global.findPage(senderData.pageId);
                    options.onMessageReceive(sender, message);
                }
            }

            $.extend(options, {
                sendMessage: function (message) {

                    var parentPage = framework.global.findPage(pageOptions.dataOut.parentId);
                    if (parentPage.onMessageReceive)
                        parentPage.onMessageReceive(options, message);
                },
                reloadGridData: function (link, grid, page, param) {
                    console.log(page);
                    var data = $.extend({}, {
                        Page: page || 1
                    }, param || {});
                    $.get(link, data, function (d) {
                        grid.clear();
                        grid.add(d.Data);
                        
                        // reset lai tong so trang neu so tong so trang thay doi.
                        if (grid.pagination)
                            grid.pagination.reset(d.Page, d.PageCount);
                    });
                },
                getSearchParam: function (page, param) {
                    return;
                },
                openPopup: function (options) {
                    framework.common.openPopup(pageOptions.dataOut._pageId, options);
                },
                findElement: function (name) {
                    return framework.global.findElementByPageId(pageOptions.dataOut._pageId, name);
                },
                $el: layoutSetting.template,
                //getPage: function (pageId) {
                //    return {
                //        getElement: function (name) {
                //            console.log(pageId);
                //            framework.global.findWidgetByPageId(pageId, name);
                //        }
                //    };
                //}
            });
            delete ViewBag;
            $(page).trigger('pageLoadComplete');
            
        });
    },
});