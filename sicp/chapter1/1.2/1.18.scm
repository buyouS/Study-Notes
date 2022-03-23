(define (double  x)
  (+ x x))

(define (halve n)
   (/ n 2))

(define (fast-times-iter a b c)
   (cond ((= b 0) c)
      ((even? b) (fast-times-iter (double a) (halve b) c))
      (else (fast-times-iter a (- b 1) (+ c a)))))

(display (fast-times-iter 3 5 0))
(exit)