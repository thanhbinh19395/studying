$.widget('widget.uploader', $.widget.base, {
    options: {
        name: null
    },
    _create: function () {
        var uploader = this.element.plupload(this.options);
        this._super();
        this._saveData(uploader);
    }
});