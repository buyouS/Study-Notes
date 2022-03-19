/**
 * 注意这段说明
 * 	We start with conditional expressions here, 
 * because they fit nicer into the substitution model. 
 * Note that all functions in sections 1.1.1 to 1.1.7 have a single return statement as their body, 
 * which enforces the emphasis on conditional expressions.
 * Conditional statements are introduced in 1.3.2. 
 * 
 * 不同于conditional expressions，if...else作为Conditional statements
 * 无法应用于return语句和函数的参数
 * 3元表达式是conditional expressions
 * function absPlus(a,b) {
 *   return plus(a > 0? a : -a,b > 0? b : -b);
 * }
 */
function plus(a, b) {
    return a + b;
}

function minus(a, b) {
    return a - b;
}

function a_plus_abs_b(a, b) {
    return (b >= 0 ? plus : minus)(a, b);
}

function absPlus(a, b) {
    return plus(a > 0 ? a : -a, b > 0 ? b : -b);
}

console.log(absPlus(-2, -3));



