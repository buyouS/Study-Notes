(load "1.22-2.scm")

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divide? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

 (search-primes 1000)
 (search-primes 1000000000000000)
 (exit)
#|

 (search-primes 1000)
 (search-primes 1000000000000000)
 (exit)

1009
1013
1019
 ***
#<time-duration 0.000730400>
1000000000000037
1000000000000091
1000000000000159
 *** 
#<time-duration 0.570479200>
|#