#|
通常来说Conditional expressions 返回一个函数+/-，函数作为值返回
更一般的应该用Applicative order替换模型(substitution model)来理解
(a-plus-abs-b 3 -3)
(if (> -3 0) + -) 3 -3)
(- 3 -3)
6
|#
(define (a-plus-abs-b a b)
    (if (> b 0)
        +
        -) a b)

(define (a-plus-abs-b-o a b)
    (if (> b 0)
        (+ a b)
        (- a b)))