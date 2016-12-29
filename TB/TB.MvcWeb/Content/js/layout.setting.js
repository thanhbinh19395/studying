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

            if (options.onInitHeader) {
                
                _page.addItem(_header);
                options.onInitHeader && options.onInitHeader(_header);
                
            }
            if (options.onInitContent) {
                
                _page.addItem(_content);
                options.onInitContent(_content);
            }
            if (options.onInitFooter) {
                
                _page.addItem(_footer);
                options.onInitFooter(_footer)
            }
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

            $.extend(_end, { _pageId: pageId });
            
            
            return _end;
        },

    }
}();