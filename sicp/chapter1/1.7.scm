(load "sqrt.scm")


(display (sqrt 9))
(newline)
;0.03230844833048122
(display (sqrt 0.0001))
(newline)
;死循环
;(display (sqrt 800000000000000000))


(define (good-enough? old new)
  (< (/
      (abs(- new old))
      old)
     0.01))

(define (sqrt-iter x guess)
    (if (good-enough? guess (improve guess x))
        guess
        (sqrt-iter x (improve guess x))))

(define (sqrt x)
   (sqrt-iter x 1.0))

(display (sqrt 2))
(newline)
(display (sqrt 0.000009))
(newline)
(display (sqrt 800000000000000000))
(exit)