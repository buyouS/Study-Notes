
(load "primality.scm")
(define (fermat-test-all n)
  (define (try-it a)
    (cond
      ((= a 0) #t)
      ((= (expmod a n n) a) (try-it (- a 1)))
      (else #f)))

  (try-it (- n 1)))


(display (fermat-test-all 100))
(display (fermat-test-all 1009))
;#t,通过全部费马检测
(display (fermat-test-all 6601))
(newline)
;7
(display (smallest-divisor 6601))
(exit)