function f(n) {
    return n < 3
        ? n
        : f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)
}

function f_(n) {

    function f_iter(a, b, c, count) {
        return count === (n + 1)
            ? c
            : f_iter(b, c, c + 2 * b + 3 * a, count + 1)
    }

    return n < 3
        ? n
        : f_iter(0, 1, 2, 3)
}

console.log(f_(6))