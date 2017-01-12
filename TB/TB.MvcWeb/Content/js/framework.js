var framework = window.framework || {};
$.extend(framework, {
    createNamespace: function (baseName, scope) {
        var ns = baseName.split('.');
        var o = scope || window;
        for (var i = 0, l = ns.length; i < l; i++) {
            o = o[ns[i]] = o[ns[i]] || {};
        }
        return o;
    },
    factory: function (id, options) {
        require(['layout', 'panel'], function () {
            //gán ParentId và ViewBag
            options.parentId = ViewBag.ParentId || null;
            options.ViewBag = ViewBag;
            if (ViewBag.Message)
                options.Data = ViewBag.Message.Data;
            delete ViewBag;
            //$('#ViewBag').remove();
            var pageOptions = {
                dataIn: options
            };
            //vẽ page
            var layoutSetting = layout.setting.page(id, options);
            var page = $('#page').panel(layoutSetting);

            //thêm dataOut
            $.extend(pageOptions, { dataOut: $(page).data("widget-panel").options });

            //register page
            framework.global.registerPage(pageOptions.dataOut._pageId, pageOptions);

            //đổi id của thẻ page
            page.attr('id', pageOptions.dataOut._pageId);

            //child function
            if (pageOptions.dataIn.parentId) {
                $.extend(options, {
                    sendMessage: function (message) {
                        var parentPage = framework.global.findPage(pageOptions.dataIn.parentId);
                        parentPage.onMessageReceive && parentPage.onMessageReceive(options, message)
                        $.each(w2ui, function (key, form) {
                            if (form._type == 'form') {
                                if (key.startsWith(pageOptions.dataIn.parentId)) {
                                    $.each(form.fields, function (fieldKey, field) {
                                        if (field.type.startsWith('popup')) {
                                            var data = $(field.el).data('w2field');
                                            data.onMessageReceive && data.onMessageReceive(options, message);
                                        }
                                    });
                                }
                            }
                        });
                    },
                });
            }

            //default function
            if (options.onMessageReceive) {
                pageOptions.onMessageReceive = function (sender, message) {
                    options.onMessageReceive(sender, message);
                }
            }
            
            $.extend(pageOptions.dataIn, {
                openPopup: function (options, params) {
                    framework.common.openPopup(pageOptions.dataOut._pageId, options, params);
                },
                findElement: function (name, findAll) {
                    return framework.global.findElementByPageId(pageOptions.dataOut._pageId, name, findAll);
                },
                $pageEl: layoutSetting.template,
                pageId: pageOptions.dataOut._pageId,
                rootPageId: framework.global.getRootPageId(),
                reloadGridData: function (link, grid, page, param) {
                    var data = $.extend({}, {
                        Page: page || 1
                    }, param || {});
                    $.post(link, data, function (d) {
                        grid.clear(true);
                        grid.add(d.Data.Data);
                        // reset lai tong so trang neu so tong so trang thay doi.
                        if (grid.pagination)
                            grid.pagination.reset(d.Data.Page, d.Data.PageCount);
                    });
                },
                //getPage: function (pageId) {
                //    return {
                //        getElement: function (name) {
                //            console.log(pageId);
                //            framework.global.findWidgetByPageId(pageId, name);
                //        }
                //    };
                //}
            });
            

            //thêm data vào el sau khi vẽ xong 
            page.data('pageOptions', pageOptions);
            //trigger pageLoadComplete để sử dụng popup
            if (pageOptions.dataIn.parentId)
                $(page.parent()).trigger('pageLoadComplete');

            if (options.onLoadComplete) {
                require(['domReady'], function () {
                    framework.common.tryFunc(options.onLoadComplete.bind(options));
                });
            }

        });
    },
});