(load "1.23.scm")

(define (start-prime-test base-odd count start-time)
  (cond ((= count 0)
         (report-prime (time-difference (current-time) start-time)))
        ((fast-prime?  base-odd 10)
         (display base-odd)
         (newline)
         (start-prime-test (+ base-odd 2) (- count 1) start-time))
        (else
         (start-prime-test (+ base-odd 2) count start-time))))

 (search-primes 1000)
 (search-primes 1000000000000000)
 (exit)

#|
对比1.23 当数的规模足够大时能看出有显著提升
1009
1013
1019
 ***
#<time-duration 0.000718200>
1000000000000037
1000000000000091
1000000000000159
 ***
#<time-duration 0.002875500>
|#