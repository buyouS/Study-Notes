(define (square x)
    (* x x))

(define (f x y z)
    (+ (square x)
       (square y)
       (square z)))


(display (f 1 2 3))
(exit)