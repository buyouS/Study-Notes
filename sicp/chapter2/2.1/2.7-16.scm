(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (cdr interval))
(define (lower-bound interval)
  (car interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))


(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

(define (add-interval-width w1 w2)
   (+ w1 w2) )
(define (sub-interval-width w1 w2)
   (+ w1 w2) )

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "Division by zero" y)
      (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))



;(display (div-interval (make-interval 1 2) (make-interval -1 2)))


 (define (make-center-percent c p) 
   (make-interval (- c (abs (* c p))) (+ c (abs (* c p)))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

 (define (percent i) 
   (/ (width i) (center i)))



(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))


  (define r1 (make-center-percent  500 0.88))
  (define r2 (make-center-percent 3000 0.42))

#|
数学公式的成立依赖于符号所表达的具体含义，
对于区间对象，这两个公式并不等价
进一步需要抽象代数（不懂，略）
|#
(display (par1 r1 r2))
(newline)
(display (par2 r1 r2))

(exit)