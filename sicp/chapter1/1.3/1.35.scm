(load "1.3/fixed-point.scm")


(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

