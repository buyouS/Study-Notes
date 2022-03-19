const st = require("./sqrt.js");

console.log(st.sqrt(2));
//0.03230844833048122
console.log(st.sqrt(0.0001));
// Maximum call stack size exceeded
console.log(st.sqrt(800000000000000000));


const error_threshold = 0.01;
function is_good_enough(guess, x) {
    return relative_error(guess, improve(guess, x))
           < error_threshold;
}
function relative_error(estimate, reference) {
    return abs(estimate - reference) / reference;
}