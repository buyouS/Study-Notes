(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))


(define (f- n)
  (define (f-iter  a b c count)
      (if (= count (+ n 1))
          c
          (f-iter b c (+ c (* 2 b) (* 3 a)) (+ count 1))))
  
  (if (< n 3)
      n
      (f-iter 0 1 2 3)))
  



(display (f 6))
(newline)
(display (f- 6))
(exit)