(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x  x))



(define (repeat f k x)
  (if (= k 0)
      x
      (f (repeat f (- k 1) x))))

(define (f x)
  (lambda (y) (set! x  (+ x 3)) (+ x y)))

(display ((f 3) 4))

;(display ((repeat square 2) 5)) 
(exit)