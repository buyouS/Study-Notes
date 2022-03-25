(define (smallest-divisor n)
    (find-divisor n 2))

;从2寻找到sqrt(n)
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divide? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


(define (divide?  a b)
  (= (remainder b a) 0))
(define (square x)
  (* x x))

;(display (smallest-division 9))
;(exit)

;最小素数等于自身
(define (prime? n)
  (= (smallest-divisor n) n))


;----------------------------------------


(define (even? n)
  (= (remainder n 2) 0))


#|
a n n
a^n mod n = (a^(n/2))^2 mod n
          = (a * (a^(n-1))) mod n 
|#
(define (expmod base exp m)
  (cond ((= exp 0) 1)
      ((even? exp)
       (remainder (square (expmod base (/ exp  2) m)) m))
      (else
       (remainder (* base (expmod base (- exp 1) m)) m))))



(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else #f)))


