(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
    (+ x 1))

;(display ((double inc) 5))

(newline)
(trace inc)
(display (((double (double double)) inc) 5))
(exit)