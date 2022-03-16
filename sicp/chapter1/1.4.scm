#|
Conditional expressions 返回一个函数+/-
|#
(define (a-plus-abs-b a b)
    (if (> b 0)
        +
        -) a b)

(define (a-plus-abs-b-o a b)
    (if (> b 0)
        (+ a b)
        (- a b)))