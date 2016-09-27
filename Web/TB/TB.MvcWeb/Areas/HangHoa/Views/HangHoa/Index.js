
var hello = function (name, age) {
    var helloText = "Xin Chào ";
    alert(helloText + name + ' ' + age);
};

$('#hellobtn').click(function () {
    hello('hehe', '12');
});
