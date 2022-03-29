
pair = require("../pair.js").pair;
head = require("../pair.js").head;
tail = require("../pair.js").tail;

function make_rat(n, d) { return pair(n, d); }

function numer(x) { return head(x); }

function denom(x) { return tail(x); }

function add_rat(x, y) {
    return make_rat(numer(x) * denom(y) + numer(y) * denom(x),
                    denom(x) * denom(y));
}
function sub_rat(x, y) {
    return make_rat(numer(x) * denom(y) - numer(y) * denom(x),
                    denom(x) * denom(y));
}
function mul_rat(x, y) {
    return make_rat(numer(x) * numer(y),
                    denom(x) * denom(y));
}
function div_rat(x, y) {
    return make_rat(numer(x) * denom(y),
                    denom(x) * numer(y));
}
function equal_rat(x, y) {
    return numer(x) * denom(y) === numer(y) * denom(x);
}

function print_rat(x) {
    return console.log(numer(x) + " / " + denom(x));
}

function make_rat(n, d) {
    const g = gcd(n, d);
    return pair(n / g, d / g);
}
const one_half = make_rat(1, 2);
print_rat(one_half);