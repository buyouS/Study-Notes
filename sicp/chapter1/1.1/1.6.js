const st = require("./sqrt.js");

function conditional(predicate, then_clause, else_clause) {		    
    return predicate ? then_clause : else_clause;
}

//Maximum call stack size exceeded
function sqrt_iter(guess, x) {
    return conditional(st.is_good_enough(guess, x),
                       guess,
                       sqrt_iter(st.improve(guess, x),
                                 x));
}

console.log(sqrt_iter(1.0 ,2));




