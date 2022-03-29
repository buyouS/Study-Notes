pair = require("../pair.js").pair;
head = require("../pair.js").head;
tail = require("../pair.js").tail;

function gcd(a, b) {
    return b === 0 ? a : gcd(b, a % b);
}

function make_rat(n, d) {
    const posn = Math.abs(n);
    const posd = Math.abs(d);
    const g = gcd(posn, posd);
    return n * d > 0
        ? pair(posn / g, posd / g)
        : pair(-posn / g, posd / g);
}

console.log(make_rat(2, -4));
console.log(make_rat(-2, -4));
console.log(make_rat(-2, 4));