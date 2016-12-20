require.config({
    baseUrl: '/Content/js',
    paths: {
        framework: 'framework',
        common: 'framework.common',
        global: 'framework.global',
        inputpage: 'framework.layout.inputpage',
        listpage: 'framework.layout.listpage',
        widget: 'widget.setting',
        layout: 'layout.setting',
        domReady: '../plugins/requirejs/domReady',
        // widgets
        base: 'widget/widget.base',
        button: 'widget/widget.button',
        form: 'widget/widget.form',
        pagination: 'widget/widget.pagination',
        panel: 'widget/widget.panel',
        grid: 'widget/widget.grid',
        texteditor: 'widget/widget.texteditor',
        gallery: 'widget/widget.gallery',
        uploader: 'widget/widget.uploader',
        tabs: 'widget/widget.tabs',
        field: 'widget/widget.field',
        boxcontent: 'widget/widget.boxcontent',
        //plugin
        ckeditor: '../plugins/ckeditor/ckeditor',
        pluploadcore: '../plugins/plupload-2.1.9/js/plupload.full.min',
        pluploadui: '../plugins/plupload-2.1.9/js/jquery.ui.plupload/jquery.ui.plupload.min',
        jquery: '../flaty/assets/jquery/jquery-2.1.1.min',
        bootstrap: '../plugins/bootstrap-3.3.7/js/bootstrap',
        jquerySlimscroll: '../flaty/assets/jquery-slimscroll/jquery.slimscroll.min',
        jqueryCookie: '../flaty/assets/jquery-cookie/jquery.cookie',
        flot: '../flaty/assets/flot/jquery.flot',
        flotResize: '../flaty/assets/flot/jquery.flot.resize',
        flotPie: '../flaty/assets/flot/jquery.flot.pie',
        flotStack: '../flaty/assets/flot/jquery.flot.stack',
        flotCrosshair: '../flaty/assets/flot/jquery.flot.crosshair',
        flotTooltip: '../flaty/assets/flot/jquery.flot.tooltip.min',
        sparkline: '../flaty/assets/sparkline/jquery.sparkline.min',
        flatyScript: '../flaty/js/flaty',
        w2ui: '../plugins/w2ui/w2ui-1.5.rc1',
        twbspagination: '../plugins/twbspagination/jquery.twbsPagination',
        jqueryUI: '../plugins/jquery-ui-1.11.4/jquery-ui',
        jqueryUIDiaglogExtend: '../plugins/jquery-ui-DialogExtend/jquery.dialogextend',
        noty: '../plugins/noty-2.3.8/jquery.noty',
        notyLayoutTopRight: '../plugins/noty-2.3.8/layouts/topRight'
    },
    shim: {
        //jquery deps
        bootstrap: ['jquery'],
        jquerySlimscroll: ['jquery'],
        flot: ['jquery'],
        sparkline: ['jquery'],
        flatyScript: ['jquery', 'jquerySlimscroll', 'bootstrap'],
        w2ui: ['jquery'],
        jqueryUI: ['jquery'],
        jqueryUIDiaglogExtend: ['jquery', 'jqueryUI'],
        //flot
        flotResize: ['flot'],
        flotPie: ['flot'],
        flotStack: ['flot'],
        flotCrosshair: ['flot'],
        flotTooltip: ['flot'],
        noty: ['jquery'],
        notyLayoutTopRight:['noty'],
        //framework
        framework: ['widget', 'global', 'common'],

        // layouts
        inputpage: ['framework', 'widget'],
        listpage: ['framework', 'widget', 'panel'],
        layout: ['global', 'widget'],

        // widget
        base: ['w2ui', 'jqueryUI'],
        button: ['base'],
        form: ['base', 'field'],
        pagination: ['base', 'twbspagination'],
        panel: ['base'],
        grid: ['base', 'pagination'],
        texteditor: ['base', 'ckeditor'],
        gallery: ['base'],
        uploader: ['base', 'pluploadcore', 'pluploadui'],
        tabs: ['base'],
        boxcontent: ['base'],
        
        // layouts
        inputpage: ['framework', 'widget'],
        listpage: ['framework', 'widget', 'panel'],

        layout: ['global', 'widget'],

        //plugins
        pluploadui: ['pluploadcore']
    }
});