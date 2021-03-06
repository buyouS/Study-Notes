(load "1.3/sum.scm")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))



(display (sum-cube 1 4))
(exit)