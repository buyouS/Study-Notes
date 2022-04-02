//currying

const { head, tail, list, is_null } = require("../../list");

function plus_curried(x) {
    return y => x + y;
}

function brooks(f, items) {
    return is_null(items)
        ? f
        : brooks(f(head(items)), tail(items));
}

function brooks_curried(items) {
    return brooks(head(items), tail(items));
}

const a = brooks_curried(list(brooks_curried,
                        list(plus_curried, 3, 4)));


const b = brooks_curried(list(brooks_curried,
                        list(brooks_curried, 
                        list(plus_curried, 3, 4))));

console.log(brooks(plus_curried, list(3, 4)));
console.log(a);
console.log(b);

