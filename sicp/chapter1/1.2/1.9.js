function inc(x) {
    return x + 1;
}

function dec(x) {
    return x - 1;
}

function plus(x, y) {
    return x === 0 ?
        y
        :
        inc(plus(dec(x), y));
}


console.log(plus(3,4))

function plus(a, b) {
    return a === 0 ? b : plus(dec(a), inc(b));
}