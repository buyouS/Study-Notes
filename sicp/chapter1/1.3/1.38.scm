(load "1.3/1.37.scm")



(define (e k)
  (+ (cont-frac-r (lambda (x) 1.0)
                 (lambda (x) (let ((a (remainder x 3)))
                               (if (or (= a 0) (= a 1) )
                                    1.0
                                    (* 2.0 (/ (+ x 1) 3.0)))))
                 k) 2.0))

(display (e 20))
(exit)