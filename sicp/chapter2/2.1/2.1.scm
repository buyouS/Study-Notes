

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (make-rat n d)
  (let ((+n (abs n))
        (+d (abs d))
        ;在这里
        (g (gcd (abs n) (abs d))))
      (if (> (* n d) 0)
          (cons (/ +n g) (/ +d g))
          (cons (- (/ +n g)) (/ +d g)))))

(display (make-rat -2 -4) )
(newline)

(display (make-rat 2 -4) )
(newline)

(display (make-rat -2 4) )
(exit)

