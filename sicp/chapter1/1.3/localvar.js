/*
结果为13
scheme 使用 lambda 表达式实现local变量
(define a 4)

(define (g x)
  (let ((a 5)
        (b (+ a x)))
    (+ a b)))

(display (g 4))
(exit)

*/

//结果为14

const a = 4;
/**
 * 
 */

function g(x) {
    const a = 5;
    const b = a + x;
    return a + b;
}

console.log(g(4));

/*Note that a name declared in a block cannot be used
 before the declaration is fully evaluated, 
 regardless of whether the same name is declared outside the block.
 */
//ReferenceError: Cannot access 'c' before initialization
const c = 4;
function g(x) {
    const d = c + x;
    const c = 5;
    return c + d;
}

console.log(g(4));



