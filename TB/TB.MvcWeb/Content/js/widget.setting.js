﻿var widget = window.widget || {};

define(function () {
    widget.setting = function () {
        var _setHeight = function (obj, height) {
            $.extend(obj, { height: height });
        };

        // style: {'width': '200px', 'padding-top': '3px'}
        var _css = function (obj, css) {
            $.extend(obj, { css: css });
        }

        /*
        attr(obj, 'class', 'btn btn-default')
        attr(obj, {
          'class': 'btn btn-default', 
          'id': 'btn-search'
        });
        */
        var _attr = function (obj, name, val) {
            if (!obj.attr) {
                obj.attr = {};
            }
            if (!val) {
                $.extend(obj.attr, name);
            } else {
                $.extend(obj.attr, { name: val });
            }
        };

        var _addEventListener = function (obj, event, listener) {
            if (!$.isPlainObject(obj.events)) {
                obj.events = {};
            }
            if (!obj.events[event]) {
                obj.events[event] = [];
            } else if ($.isFunction(obj.events[event])) {
                obj.events[event] = [obj.events[event]];
            } else if (!$.isArray(obj.events[event])) {
                obj.events[event] = [];
            }

            obj.events[event].push(listener);
        };

        var _addItem = function (obj, item) {
            if (!obj.items) {
                obj.items = [];
            }
            if (!$.isArray(item)) {
                item = [item];
            }
            Array.prototype.push.apply(obj.items, item);
        }

        return {
            boxcontent: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "boxcontent", template: $("<div>") });
                return {
                    setColor:function(color){
                        $.extend(obj, { color: color });
                        return this;
                    },
                    addButton: function (button) {
                        if (!obj.buttons)
                            obj.buttons = [];
                        obj.buttons.push(button);
                        return this;
                    },
                    setBoxCss: function (cssObj) {
                        $.extend(obj, { boxCss: cssObj });
                        return this;
                    },
                    setData:function(data){
                        $.extend(obj, { data: data });
                        return this;
                    },
                    setName: function (name) {
                        $.extend(obj, { name: name });
                        return this;
                    },
                    setIcon: function (icon) {
                        $.extend(obj, { icon: icon });
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                }
            },

            tabs: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "tabs", template: $("<div>") });
                return {
                    setAttr: function(name, value){
                        if (!value) {
                            $.extend(obj, name);
                        } else {
                            $.extend(obj[name], value );
                        }
                        return this;
                    },
                    event: function (eventName, handler) {
                        obj[eventName] = handler;
                        return this;
                    },
                    addTabs:function(tabs){
                        if (!obj.tabs)
                            obj.tabs = [];
                        if ($.isArray(tabs))
                            $.each(tabs, function (key, value) {
                                obj.tabs.push(value);
                            });
                        else
                            obj.tabs.push(tabs);
                        return this;
                    },
                    setActiveTab:function(tabid){
                        $.extend(obj, { active: tabid });
                        return this;
                    },
                    setOnClickHandler:function(handler){
                        $.extend(obj, {
                            onClick: function (e) {
                                handler(e);
                            }
                        });
                        return this;
                    },
                    setName: function (name) {
                        $.extend(obj, { name: name });
                        return this;
                    },
                    end: function () {
                        console.log(obj);
                        return obj;
                    }
                }
            },
            uploader: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "uploader", template: $("<div>") });
                return {
                    onImageClick:function(handler){
                        $.extend(obj, {
                            onImageClick: function (data) {
                                handler(data);
                            }
                        });
                    },
                    setAttr: function(name, value){
                        if (!value) {
                            $.extend(obj, name);
                        } else {
                            $.extend(obj, { name: value });
                        }
                        return this;
                    },
                    setName: function (name) {
                        $.extend(obj, { name: name });
                        return this;
                    },
                    setUrl: function (url) {
                        $.extend(obj, { url: url });
                        return this;
                    },
                    setMaxFileSize: function (max) {
                        $.extend(obj, { max_file_size: max });
                        return this;
                    },
                    addFilters: function (title, extensions) {
                        if (!obj.filters)
                            obj.filters = [];
                        if (!$.isArray(title)) {
                            obj.filters.push({
                                title: title,
                                extensions: extensions
                            });
                        }
                        else {
                            $.each(title, function (key, value) {
                                obj.filters.push({
                                    title: title.title,
                                    extensions: title.extensions
                                });
                            });
                        }
                        return this;
                    },
                    onFileUploaded: function (handler) {
                        $.extend(obj, {
                            init: {
                                FileUploaded: function (uploader, file, info) {
                                    handler(uploader, file, info);
                                }
                            }
                        });
                        return this;
                    },
                    onUploadComplete: function (handler) {
                        $.extend(obj, {
                            init: {
                                UploadComplete: function (uploader, files) {
                                    handler(uploader, files);
                                }
                            }
                        });
                        return this;
                    },
                    end: function () {
                        console.log(obj);
                        return obj;
                    }
                }
            },
            gallery: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "gallery", template: $("<div>") });
                return {
                    setName: function (name) {
                        $.extend(obj, { name: name });
                        return this;
                    },
                    addImages: function (imgUrl, thumbUrl) {
                        if (!obj.images)
                            obj.images = [];
                        if ($.isArray(imgUrl))
                            $.each(imgUrl, function (key, value) {
                                obj.images.push(value);
                            });
                        else
                            obj.images.push({ ImageUrl: imgUrl, ThumbnailUrl: thumbUrl });

                        return this;
                    },
                    addButton: function (icon, onclick) {
                        if (!obj.buttons)
                            obj.buttons = [];
                        var button = { icon: icon, onclick: function (url, thumbUrl, container) { onclick(url, thumbUrl, container); } };
                        obj.buttons.push(button);
                        return this;
                    },
                    addImage: function (imageUrl, thumbnailUrl) {
                        if (!obj.images)
                            obj.images = [];
                        var image = { ImageUrl: imageUrl, ThumbnailUrl: thumbnailUrl };
                        obj.images.push(image);
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                };
            },
            texteditor: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "texteditor", template: $("<div>") });
                return {
                    setName: function (name) {
                        $.extend(obj, { 'name': name });
                        return this;
                    },
                    setData: function (data) {
                        $.extend(obj, { 'data': data });
                        return this;
                    },
                    setWidth: function (width) {
                        $.extend(obj, { width: width });
                        return this;
                    },
                    setHeight: function (height) {
                        $.extend(obj, { height: height });
                        return this;
                    },
                    addButton: function (id, text, onclick, icon) {
                        var button = {
                            id: id,
                            text: text,
                            onclick: function () { onclick(); },
                            icon: icon
                        };
                        if (!obj.buttons)
                            obj.buttons = [];
                        obj.buttons.push(button);
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                };
            },
            button: function (options) {
                var obj = { template: $('<button>') };
                $.extend(obj, options || {});
                $.extend(obj, { _type: "w2" });

                return {
                    css: function (css) {
                        _css(obj, css);

                        return this;
                    },
                    attr: function (name, val) {
                        _attr(obj, name, val);

                        return this;
                    },
                    addClass: function (divClass) {
                        $.extend(obj, { divClass: divClass });
                        return this;
                    },
                    setName: function (name) {
                        $.extend(obj, {
                            id: name,
                            name: name
                        });

                        return this;
                    },
                    setIcon: function (icon) {
                        $.extend(obj, { icon: icon });

                        return this;
                    },
                    setCaption: function () {
                        $.extend(obj, {
                            caption: caption,
                            text: caption
                        });

                        return this;
                    },
                    addEventListener: function (obj, event, handler) {
                        _addEventListener(event, handler);
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                }
            },
            control: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "w2" });

                return {
                    define: function (type, id, caption, icon) {
                        $.extend(obj, {
                            _type: '_' + type,
                            type: type,
                            id: id,
                            caption: caption,
                            icon: icon
                        });
                        return this;
                    },
                    setChecked: function (isChecked) {
                        $.extend(obj, { checked: isChecked });
                        return this;
                    },
                    setCount: function (val) {
                        $.extend(obj, { count: val });
                        return this;
                    },
                    setHtml: function (htmlString) {
                        $.extend(obj, { html: htmlString });
                        return this;
                    },
                    setGroup: function (val) {
                        $.extend(obj, { group: val });
                        return this;
                    },
                    setDisabled: function (isDisabled) {
                        $.extend(obj, { disabled: isDisabled });
                        return this;
                    },
                    setValue: function (val) {
                        $.extend(obj, { value: val });
                        return this;
                    },
                    addItem: function (item) {
                        _addItem(obj, item);
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                };
            },
            title: function (options) {
                var _toolbar = widget.setting.toolbar();

                var _title = { id: 'title', caption: '', icon: 'fa-list' };
                var _leftItem = [];
                var _rightItem = [];

                var _end = _toolbar.end();

                $.extend(_toolbar, {
                    setTitle: function (text) {
                        _title.caption = text;
                        return this;
                    },
                    setIcon: function (icon) {
                        _title.icon = icon;
                        return this;
                    },
                    addLeft: function (item) {
                        _leftItem.push(item);
                        return this;
                    },
                    addRight: function (item) {
                        _rightItem.push(item);
                        return this;
                    },
                    addEventListener: function (event, handler) {
                        _addEventListener(_end, event, handler);
                        return this;
                    },
                    end: function () {
                        var title = $('<h3>').css({ color: 'white' })
                                             .append($('<i>').addClass(_title.icon))
                                             .append('&nbsp;' + _title.caption)[0].outerHTML;
                        this.addItem({
                            type: 'html',
                            id: _title.id,
                            html: title
                        });
                        if (_leftItem.length > 0) {
                            // ngăn phần control với tiêu đề
                            this.addItem({ type: 'break' });
                        }
                        this.addItem(_leftItem);
                        this.addItem({ type: 'spacer' });
                        this.addItem(_rightItem);
                        _end.template.addClass('title-toolbar box-title');

                        _end.template.css({
                            padding: '8px',
                            border: 'none',
                            backgroundColor: '#8a8787'
                        });

                        return _end;
                    }
                });

                return _toolbar;
            },
            grid: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, {
                    _type: "grid",
                    template: $('<div style=" border-radius: 0">'),
                    fixedBody:false,
                });
                return {
                    setIdColumn: function (colName) {
                        $.extend(obj, { recid: colName });
                        return this;
                    },
                    show: function () {
                        if(!obj.show)
                            obj.show = {};
                        $.each(arguments, function (key, value) {
                            obj.show[value] = true;
                        });
                        return this;
                    },
                    hide: function () {
                        if (!obj.show)
                            obj.show = {};
                        $.each(arguments, function (key, value) {
                            obj.show[value] = false;
                        });
                        return this;
                    },
                    setPaginateOptions: function (options) {
                        if (!obj.show) {
                            obj.show = {};
                            $.extend(obj.show, { toolbar: true });
                        }
                        if (!obj.toolbar) {
                            obj.toolbar = {};
                            obj.toolbar.items = [];
                        }
                        $.extend(obj, { paginateOptions: options });
                        return this;
                    },
                    setName: function (name) {
                        $.extend(obj, { 'name': name });
                        return this;
                    },
                    addColumns: function (cols) {
                        if (!obj.columns)
                            obj.columns = [];
                        $.extend(obj.columns, cols);
                        return this;
                    },
                    addButton: function (id, text, icon, callback, addBreakBefore) {
                        if (!obj.show) {
                            obj.show = {};
                            $.extend(obj.show, { toolbar: true });
                        }
                        else
                            if (!obj.show.toolbar)
                                $.extend(obj.show, { toolbar: true });
                            
                        if (!obj.toolbar) {
                            obj.toolbar = {};
                            obj.toolbar.items = [];
                        }
                        if (addBreakBefore||true)
                            obj.toolbar.items.push({
                                type: 'break',
                            });
                        obj.toolbar.items.push({
                            type: 'button',
                            id: id,
                            caption: text,
                            icon: 'fa ' + icon || '',
                            onClick: function () { callback(); }
                        });
                        return this;

                    },
                    addRecords: function (records) {
                        if (!obj.data)
                            obj.data = [];
                        $.extend(obj.data, records);
                        return this;
                    },
                    createEvent: function (event, callback) {
                        //name = event.slice(0, 1).toUpperCase();
                        //var eventName = 'on' + name.concat(event.slice(1));
                        console.log(event);
                        obj[event] = function (e) { callback(e); };
                        return this;
                    },
                    setRowExpandHandler: function (handler) {
                        $.extend(obj, { onExpand: handler });
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                }
            },
            panel: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "panel", template: $("<div>") });
                return {
                    css: function (css) {
                        _css(obj, css);
                        return this;
                    },
                    setHtml:function(html){
                        obj.template.html(html);
                        return this;
                    },
                    setTemplate: function (template) {
                        $.extend(obj, { template: template });
                    },
                    setId: function (id) {
                        $.extend(obj, { id: id });
                    },
                    setName: function (name) {
                        $.extend(obj, { name: name });
                        return this;
                    },
                    setWidth: function (width) {
                        $.extend(obj, { width: width });
                        return this;
                    },
                    setHeight: function (height) {
                        $.extend(obj, { height: height });
                        return this;
                    },
                    addClass: function (divClass) {
                        $.extend(obj, { divClass: divClass });
                        return this;
                    },
                    attr: function (name, value) {
                        _attr(obj, name, value);
                        return this;
                    },
                    addItem: function (item, divClass) {
                        if (divClass) {
                            $.extend(item, { divClass: divClass });
                        }
                        _addItem(obj, item);
                        return this;
                    },
                    addEventListener: function (event, handler) {
                        _addEventListener(_end, event, handler);
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                }
            },
            togglePanel: function (options) {
                var togglePanel = this.panel(options);
                togglePanel.css({
                    'position': 'absolute',
                    'z-index': 3
                }).addClass('collapse');
                return togglePanel;
            },
            searchForm: function (options) {
                var _form = widget.setting.form();

                var _end = _form.end();

                $.extend(_form, {
                    setWidth: function (width) {
                        _end.width = width;
                        return this;
                    },
                    end: function () {
                        _end.template.css({
                            width: _end.width,
                            position: 'absolute',
                            zIndex: 3,
                            right: 0,
                            marginTop: 0
                        });

                        return _end;
                    }
                });

                return _form;
            },
            form: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "form", template: $('<div style="border-radius: 0">') });
                return {
                    setLabelWidth:function(width){
                        $.extend(obj, { labelWidth: width });
                        return this;
                    },
                    setName: function (name) {
                        $.extend(obj, { 'name': name });
                        return this;
                    },
                    setFieldPerRow: function (count) {
                        $.extend(obj, { fieldPerRow: count });
                        return this;
                    },
                    setHeight: function (height) {
                        $.extend(obj, { 'height': height });
                        return this;
                    },
                    setWidth: function (width) {
                        obj.template.css({ width: width });
                        return this;
                    },
                    setHeaderTitle: function (title) {
                        $.extend(obj, { 'header': title });
                        return this;
                    },
                    addFields: function (fields) {
                        if (!obj.fields)
                            obj.fields = [];
                        $.extend(obj.fields, fields);
                        return this;
                    },
                    addButton: function (text, callback) {
                        var e = {};
                        e[text] = function () { callback(); };
                        if (!obj.actions)
                            obj.actions = {};
                        $.extend(obj.actions, e);
                        return this;
                    },
                    setRecord:function(record){
                        $.extend(obj, { record: record });
                        return this;
                    },
                    createEvent: function (event, callback) {
                        name = event.slice(0, 1).toUpperCase();
                        var eventName = 'on' + name.concat(event.slice(1));
                        obj[eventName] = function () { callback(); };
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                };
            },
            pagination: function (options) {
                var obj = {};

                $.extend(obj, options || {});
                $.extend(obj, { _type: "pagination", template: $('<div>') });

                return {
                    setName: function (name) {
                        $.extend(obj, { name: name });
                        return this;
                    },
                    setTotalPages: function (val) {
                        $.extend(obj, { totalPages: val });
                        return this;
                    },
                    setStartPage: function (val) {
                        $.extend(obj, { startPage: val });
                        return this;
                    },
                    setVisiblePages: function (val) {
                        $.extend(obj, { visiblePages: val });
                        return this;
                    },
                    setFirstText: function (val) {
                        $.extend(obj, { first: val });
                        return this;
                    },
                    setPrevText: function (val) {
                        $.extend(obj, { prev: val });
                        return this;
                    },
                    setNextText: function (val) {
                        $.extend(obj, { next: val });
                        return this;
                    },
                    setLastText: function (val) {
                        $.extend(obj, { last: val });
                        return this;
                    },
                    setClass: function (val) {
                        $.extend(obj, { paginationClass: val });
                        return this;
                    },
                    setPageClickHandler: function (val) {
                        $.extend(obj, { onPageClick: val });
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                };
            },
            header: function (options) {
                var _header = widget.setting.panel();
                var _title = widget.setting.title();
                var _content = widget.setting.panel();
                var _end = _header.end();

                _header.setName('header');
                _content.setWidth('auto');
                _content.addClass('collapse').css({
                    right:'0px',
                    position: 'absolute',
                    zIndex: 3,
                });

                $.extend(_header, {
                    title: function () { return _title; },
                    content: function () { return _content; },
                    setTitle: function (title) {
                        _title.setTitle(title);
                        return this;
                    },
                    setIcon: function (icon) {
                        _title.setIcon(icon);
                        return this;
                    },
                    end: function () {
                        //_content.css({ 'display': 'none' });
                        _end.items[0] = _end.items[0].end();
                        _end.items[1] = _end.items[1].end();
                        return _end;
                    }
                });

                _header.addItem(_title);
                _header.addItem(_content);
                delete _header.addItem;
                _header.css({ padding: '0px' });
                return _header;
            },
            content: function (options) {
                var _panel = widget.setting.panel();
                _panel.setName('content');
                return _panel;
            },
            footer: function (options) {
                var _panel = widget.setting.panel();
                _panel.setName('footer');
                return _panel;
            },
            toolbar: function (options) {
                var obj = {};
                $.extend(obj, options || {});
                $.extend(obj, { _type: "w2toolbar", template: $('<div style="padding: 4px; border: 1px solid silver">') });

                return {
                    setName: function (val) {
                        $.extend(obj, { name: val });
                        return this;
                    },
                    addItem: function (item) {
                        _addItem(obj, item);
                        return this;
                    },
                    addEventListener: function (event, handler) {
                        _addEventListener(_end, event, handler);
                        return this;
                    },
                    end: function () {
                        return obj;
                    }
                }
            }
        }
    }();

    return widget;
});