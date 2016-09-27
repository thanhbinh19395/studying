
require.config({
  baseUrl: '/Content/js',
  paths: {
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
    flatyScript: '../flaty/js/flaty'
  },
  shim: {
    //jquery deps
    bootstrap: ['jquery'],
    jquerySlimscroll: ['jquery'],
    flot: ['jquery'],
    sparkline: ['jquery'],
    flatyScript: ['jquery','jquerySlimscroll', 'bootstrap'],
   
    
    flotResize:['flot'],
    flotPie:['flot'],
    flotStack:['flot'],
    flotCrosshair: ['flot'],
    flotTooltip: ['flot'],
  },
  //deps: {
  //  jquery: ['bootstrap', 'jquerySlimscroll', 'flot', 'sparkline','flatyScript'],
  //  flot: ['flotResize', 'flotPie', 'flotStack', 'flotCrosshair', 'flotTooltip', 'sparkline']
  //}
});