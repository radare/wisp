// Generated by LispyScript v0.1.0
var _tco = function(f) {var value, active = false, accumulated = [];recur = function() {accumulated.push(arguments);if (!active) {active = true;while (accumulated.length) value = f.apply(this, accumulated.shift());active = false;return value;};};return recur;};var recur;
var fib = function(n){
    return _tco(function(a,b,count){
        console.log(n);
        return (count === 0) ?
            b :
            recur((a + b),a,(count - 1));
    })(1,0,n);
};
console.log(fib(19));