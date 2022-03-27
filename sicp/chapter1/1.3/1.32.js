function accumulate_r(combiner, null_value, term, a, next, b) {
    return a > b
           ? null_value
           : combiner(term(a), 
                      accumulate_r(combiner, 
                                   null_value, 
                                   term, next(a), next, b));
}
function sum_r(term, a, next, b) {
    function plus(x, y) {
        return x + y;
    }
    return accumulate_r(plus, 0, term, a, next, b);
}
function product_r(term, a, next, b) {
    function times(x, y) {
        return x * y;
    }
    return accumulate_r(times, 1, term, a, next, b);
}