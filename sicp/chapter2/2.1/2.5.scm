(define (cons a b)
  (cond
    ((and (= a 0) (= b 0)) 1)
    ((> a 0) (* 2 (cons (- a 1) b)))
    (else (* 3 (cons a (- b 1))))
    ))



(define (car x)
  (if (not (= (remainder x 2) 0))
      0
      (+ 1 (car (/ x 2)))))


(define a (cons 4 5))
(display (car a))

(exit)