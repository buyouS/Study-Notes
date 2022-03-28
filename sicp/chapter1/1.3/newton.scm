(load "1.3/fixed-point.scm")

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)

; (display ((deriv (lambda (x) (* x x x))) 5))
; (exit)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (* y y) x)) newton-transform 1.0))


(define (newtons-method g guess)
  (fixed-point 
    (newton-transform g) guess))


; (display (sqrt 2))
; (exit)