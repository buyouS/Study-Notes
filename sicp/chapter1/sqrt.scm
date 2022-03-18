(define (square x)
    (* x x))

(define (abs x)
    (if (> x 0)
        x
        (- x)))

(define (averge x y)
    (/ (+ x y) 2))

(define (sqrt x)
    (sqrt-iter x 1.0))

(define (sqrt-iter x guess)
    (if (good-enough? x guess)
        guess
        (sqrt-iter x (improve guess x))))

(define (improve guess x)
    (averge (/ x guess) guess))
    
(define (good-enough? x guess)
    (< (abs (- (square guess) x)) 0.001))


; (display (sqrt 2))
; (newline)
; (display (sqrt 9))
; (exit)

(define (sqrt-by-block x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))