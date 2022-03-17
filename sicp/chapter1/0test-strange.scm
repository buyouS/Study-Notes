
#|
expression
condition expression
compound procedures 未完成
----------
tree accumulation
|#


;attempt to apply non-procedure 4
(display (+ (4) 2))
;possible incorrect argument count in call (-)
(display ((-) 5 2))

;0,非常奇怪的结果
(define (h1)
    (+))
; possible incorrect argument count in call (-)
(define (h2)
    (-))

(define (h)
    +)

(display (h1))
(display (h2))
;3
(display ((h) 1 2))




(define (f x)
  (+ x 1))

(define (g x)
    (x 2 3))

(define a (f (if (> 3 0)
  3
  1)))

(define b (g (if (> 3 0)
  +
  -)))

;4
(display a)
;5
(display b)
(exit)