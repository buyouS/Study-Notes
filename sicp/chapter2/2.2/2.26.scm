;(1 2 3 4 5 6)
;((1 2 3) 4 5 6)
;((1 2 3) (4 5 6))

(define x (list 1 2 3))

(define y (list 4 5 6))

(display (cons x y))
(newline)
(display (list x y))
(exit)