;k项连分式
(define (cont-frac-i n d k)

  (define (cont-frac-iter product k)
    (if (= k 0)
        product
        (cont-frac-iter
         (/ (n k)
            (+ (d k) product))
         (- k 1))))

  (cont-frac-iter 0 k))

(define (f k)
  (cont-frac-i  (lambda (i) 1.0)
              (lambda (i) 1.0)
               k))



(define (cont-frac-r n d k)
  (define (rf i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (rf (+ i 1))))))
  (rf 1))

(define (g k)
  (cont-frac-r (lambda (i) 1.0)
              (lambda (i) 1.0)
               k))


#|
(display (f 20))
(newline)
(display (g 20))
(exit)
|#