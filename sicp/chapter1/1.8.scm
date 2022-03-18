(define (cube x)
  (* x x x))

(define (abs x)
  (if (> x 0)
      x
      (- x)))

(define (improve x guess)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))

;相同
(define (good-enough? old new)
  (< (/
      (abs(- new old))
      old)
     0.01))

;相同
(define (cube-root-iter x guess)
  (if (good-enough? guess (improve x guess))
      (improve x guess)
      (cube-root-iter x (improve x guess))))

(define (cube-root x)
  (cube-root-iter x 1.0))

(display (cube-root 8))
(exit)