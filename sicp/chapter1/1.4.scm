#|
通常来说Conditional expressions 返回一个函数(operator)+/-，函数作为值返回
更一般的应用序(Applicative order)替换模型(substitution model)
结合Conditional expressions的返回值构成树形累积(tree accumulation):
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