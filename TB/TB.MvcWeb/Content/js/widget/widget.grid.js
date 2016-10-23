$.widget('widget.grid', $.widget.base, {
    options: {
        name: null
    },
    _create: function () {
        var self = this;

        if (this.options.paginateOptions) {
            var pagiName = 'pagination' + '_' + this.options.name + this.options.paginateOptions.name || '';
            this.options.toolbar.items.push({ type: 'spacer'});
            this.options.toolbar.items.push({
                type: 'html',
                id: pagiName + '_id',
                html: '<div class="pagination pull-right" style="width: 330px; margin-right:-5px;"><ul id="' + pagiName + '" class="pull-right "></ul></div>'
            });
        }
       
        var grid = this.element.w2grid(this.options);
        if (this.options.paginateOptions) {
            var pagi = $('#' + pagiName).pagination(this.options.paginateOptions);
            var pagiData = pagi.data("widget-pagination").options.__data;
            $.extend(grid, { pagination: pagiData });
        }
        console.log(this.element.parent());
        
        this._super();
        this._saveData(grid);
    }
});