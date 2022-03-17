#|
1.对于应用序求值来说，先对test过程的实际参数0和(p)求值
而(p)是一个调用自身的无限循环过程
2.对于正则序求值来说，
(test 0 (p))

(if (= 0 0)
    0
    (p))
根据if的求值规则得到结果0
|#

(define (p)
    (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
(exit)