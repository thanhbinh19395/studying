var layout = window.layout || {};
layout.setting = function () {
    return {
        page: function (pageId, options) {
            pageId = framework.global.makeId(pageId);

            var createHeader = function (options) {
                var _header = widget.setting.header();
                return _header;
            };
            var createContent = function (options) {
                var _content = widget.setting.content();
                return _content;
            };
            var createFooter = function () {
                var _footer = widget.setting.footer();
                return _footer;
            };

            var _page = widget.setting.panel();
            var _header = createHeader();
            var _content = createContent();
            var _footer = createFooter();

            _page.addItem(_header);
            _page.addItem(_content);
            _page.addItem(_footer);
            if (!options.parentId) {
                _page.css({
                    'overflow': 'auto',
                    height: 'auto'
                });
            }
            else{
                _page.css({
                    'overflow': 'auto',
                });
            }
           
            var _end = _page.end();

            options.onInitHeader && options.onInitHeader(_header);
            options.onInitContent && options.onInitContent(_content);
            options.onInitFooter && options.onInitFooter(_footer);

            $.extend(_end, { _pageId: pageId });
            
            
            return _end;
        },

    }
}();