(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try gusee)
    (let ((next (f gusee)))
      (if (close-enough? gusee next)
           next
           (try next))))
  (try first-guess))




(define (sqrt x)
  (fixed-point (lambda (y) (avarage y (/ x y))) 1.0))

(define (average-damp f)
  (lambda (x) (avarage x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))


(define (avarage x y)
  (/ (+ x y) 2))


#|
(display (fixed-point cos 1.0))
(newline)
(display (sqrt 4))
(exit)
|#
  