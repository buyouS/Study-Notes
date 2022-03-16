(define (square x)
  (* x x))


(define (sum-square x y)
  (+ (square x)
     (square y)))

;依据不同的条件调用不同sum-square过程
(define (g x y z)
  (cond ((and (> x y) (> y z)) (sum-square x y))
        ((and (> x y) (> z y)) (sum-square x z))
        ((and (> y x) (> z x)) (sum-square y z))
        ((and (> y x) (> x z)) (sum-square y x))))

;条件语句参与到sum-square过程的构建
(define (h x y z)
  (sum-square
       (if (> x y)
           x
           y)
       (if (< x y)
           (if (< x z)
               z
               x)
           (if (< y z)
               z
               y))))

#|
对比h和f过程，条件语句块可以看成求值的过程，但这样的过程是不确定的
这什么意思？如果你想要得到(x y)的较小值，你需要分别处理(< x y)的两种不同情况
f过程使用smaller子过程避免了这个问题，使得整个算法看起来更合理
|#
(define (bigger x y)
    (if (> x y)
        x
        y))
(define (smaller x y)
    (if (< x y)
        x
        y))

(define (f x y z)
    (sum-square
         (bigger x y)
         (bigger (smaller x y) z)))

(display (f 1 2 2))
(newline)
(display (g 1 2 2))
(newline)
(display (h 1 2 2))
(exit)