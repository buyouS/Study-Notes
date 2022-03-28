(load "1.3/1.37.scm")

(define (tan-cf x k)
  (cont-frac-i (lambda (i) (if (= i 1)
                                x
                                (- (* x x))))
               (lambda (i) (- (* 2.0 i) 1.0))
               k))

(display (tan-cf 10 100))
(exit)

