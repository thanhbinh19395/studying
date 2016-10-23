
var hello = function (name, age) {
    var helloText = "Xin Chào ";
    console.log(helloText + name + ' ' + age);
};

$('#hellobtn').click(function () {
    debugger;
    hello('hehee', '12');
});
