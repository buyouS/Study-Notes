(load "primality.scm")
(define (time-prime-test base-odd count)
  (start-prime-test base-odd count (current-time)))
  

(define (start-prime-test base-odd count start-time)
  (cond ((= count 0)
         (report-prime (time-difference (current-time) start-time)))
        ((prime? base-odd)
         (display base-odd)
         (newline)
         (start-prime-test (+ base-odd 2) (- count 1) start-time))
        (else
         (start-prime-test (+ base-odd 2) count start-time))))



(define (report-prime elapsed-time)
  (display " *** ")
  (newline)
  (display elapsed-time)
  (newline)
  ;elapsed-time
  )

(define (search-primes n)
   (if (even? n)
       (time-prime-test (+ n 1) 3)
       (time-prime-test n 3)))

#|
 (search-primes 1000)
 (search-primes 10000000)
 (exit)


1009
1013
1019
 ***
#<time-duration 0.000592400>
10000019
10000079
10000103
 ***
#<time-duration 0.001082600>
|#
