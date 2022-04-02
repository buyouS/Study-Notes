const zero = f => x => x;
const one = f => x => f(x);
const two = f => x => f(f(x));

function add_1(n) {
    return f => x => f(n(f)(x));
}

function plus(a,b) {
    return f => x => a(f)(b(f)(x));
}

function church_to_number(c) {
    return c(x => x + 1)(0);
}

console.log(church_to_number(plus(one, two)));