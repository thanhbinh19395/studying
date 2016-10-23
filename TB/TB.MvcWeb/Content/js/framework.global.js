﻿var framework = window.framework || {};
framework.global = (function (scope) {
    var __mainfest = {};
    __mainfest.widgets = {};

    return {
        onRegisterPage:null,
        uuid: function () {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        },
        makeId: function(id) {
            return id + '_' + this.uuid();
        },
        registerPage: function (pageId, instance) {
          
            //console.log(pageId + ' registered');
            __mainfest[pageId] = instance;
        },
        registerElementByPageId: function (pageId, elementName, data) {
            __mainfest[pageId].dataOut.elements[pageId + '_' + elementName] = data;
        },
        findElementByPageId: function (pageId, elementName) {
            var pageOptions = this.findPage(pageId);
            //console.log(pageOptions);
            var result = [];
            (function find(elements, name) {
                if (elements[name]) {
                    console.log('founded');
                    result.push(elements[name]);
                }
                else {
                    $.each(elements, function (key, value) {
                        if (value.elements) {
                            return find(value.elements, name);
                        }
                    });
                }
                
            })(pageOptions.dataOut.elements, pageOptions.dataOut._pageId + '_' + elementName);
            return result;

        },
        findPage: function (pageId) {
            //$.each(__mainfest, function (index, value) {
            //    if (index.indexOf(pageId) > -1)
            //        return value;
            //});
            //return {};
            return __mainfest[pageId] || {};
        },
        /**
         * Register a widget object
         * @param {object} widget Widget object
         */
        registerWidget: function (name, widget) {
            //console.log('Registered widget "' + name + '"');
            __mainfest.widgets[name] = widget;
        },
        /**
         * Unregister a widget object
         * @param {object} widget Widget object
         */
        unregisterWidget: function (name) {
            __mainfest.widgets[name] = undefined;
        },
        /**
         * Get a specific registered widget object
         * @param {string} name Name of widget
         * @return The registered widget object
         */
        findWidget: function (name) {
            return __mainfest.widgets[name];
        },
        unicodeToLowerText: function (str) {
            str = str.toLowerCase();
            str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
            str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
            str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
            str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
            str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
            str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
            str = str.replace(/đ/g, "d");
            str = str.replace(/!|@|\$|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\'| |\"|\&|\#|\[|\]|~/g, "");
            str = str.replace(/-+-/g, "-"); //thay thế 2- thành 1-
            str = str.replace(/^\-+|\-+$/g, "");//cắt bỏ ký tự - ở đầu và cuối chuỗi
            return str;
        },
        /**
         * Binding multiple events into one element
         * @param {jQuery Object} el Element to bind events
         * @param {object} actions Object contains events
         */
        bindEvents: function (el, actions) {
            var keys = Object.keys(actions);

            for (var i = 0, key; key = keys[i]; i++) {
                var handlers = actions[key];
                if (!$.isArray(handlers)) {
                    handlers = [handlers];
                }
                for (var j = 0, handler; handler = handlers[j]; j++) {
                    if ($.isFunction(handler)) {
                        el.on(key, handler);
                    }
                }
            }
        },
        // Maybe be necessary
        //unbindEvents: function (el, actions) {
        //
        //}
    };
})(window);