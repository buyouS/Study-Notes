(load "1.3/sum.scm")
(load "1.2/primality.scm")

(define (filtered-accumulate filter combiner null-value term a next b)
  (cond
    ((> a b) null-value)
    ((filter a) (combiner (term a)
                          (filtered-accumulate filter combiner null-value term (next a) next b)))
    (else (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (prime-sum a b)
  (filtered-accumulate prime? + 0 identity a inc b))


(display (prime-sum 1 100))
(exit)