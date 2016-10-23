var framework = window.framework || {};
framework.common = framework.common || {};
$.extend(framework.common, {
    api: function (url, param, calback) {
        var url = url.url || url;
        var param = url.param || param;
        var calback = url.calback || calback;

    },
    openWindow: function (params) {

    },
    openPopup: function (parentId, options) {
       
        $( ".selector" ).dialog( "moveToTop" );

        var defaultOptions = {
            name:'unnamed',
            minHeight: 0,
            // height: 300,
            width: 500,
            modal: false,
            resizable: false,
            position: { my: "center top+150px", at: "center top", of: window },
            openMultiple: false,
            hide: 'fade',
            show:'fade'
            
        };

        var defaulDialogExtendOptions = {
            maximizable: true,
            minimizable: true,
            collapsable:false,
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

        var openPopup = function () {
            $("<div>").load(options.url, { ParentId: parentId }, function (data) {
                //tạo popup
                $.extend(defaultOptions, {
                    open: function (event, ui) {
                        console.log(event);
                        $(event.target).attr('style', $(event.target).attr('style') + '; ' + 'overflow: auto !important');
                        console.log(ui);
                        $(event.target.lastElementChild).on('pageLoadComplete', function () {
                            var popupPageId = $(this).attr('id');
                            var popup = framework.global.findPage(popupPageId);
                            $.extend(popup.dataIn, { $popupEl: dialog });
                            framework.global.registerElementByPageId(parentId, options.name, {
                                pageId: popupPageId,
                                box: dialog,
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
                                }
                            });
                        });
                    }
                });
                var dialog = $('<div>').append(data);
                
                console.log(dialog);
                $(dialog).dialog(defaultOptions).dialogExtend(defaulDialogExtendOptions);
            });
        };


        if (defaultOptions.openMultiple)
            openPopup();
        else {
            var popup = framework.global.findElementByPageId(parentId, defaultOptions.name)[0];
            if (popup) {
                var state = popup.getState();
                switch (state) {
                    case "minimized":
                        popup.restore();
                        popup.moveToTop();
                        break;
                    case "collapsed":
                        popup.restore();
                        popup.moveToTop();
                        break;
                    case "closed":
                        openPopup();
                        break;
                    default:
                        popup.moveToTop();
                }
                    
            }
            else
                openPopup();
        }

     

    }
 });