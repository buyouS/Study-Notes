(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x  x))



(define (repeat f k x)
  (if (= k 0)
      x
      (f (repeat f (- k 1) x))))

#|
k永远等于1
(define (repeat f k)
  (define (help x)
    (let ((k (- k 1)))
      (display k)
      (newline)
      (if (= k 0)
          x
          (f (help x)))))

 help )
|#

;麻烦
(define (repeat f k)
  (define (help x)
    (define (help-help k)
      (if (= k 0)
          x
          (f (help-help (- k 1)))))
    (help-help k))

 help )

;拥有赋值能力的变量
(define (repeat f k)
  (define (help x)
      (set! k (- k 1))
      (if (< k 0)
          x
          (f (help x)))
      )
 help)

;引入compose语义，不用再写lambda
(define (repeat f k)
  (if (= k 1)
      f
      (compose f (repeat f (- k 1)))))


(display ((repeat square 2) 5)) 
(exit)