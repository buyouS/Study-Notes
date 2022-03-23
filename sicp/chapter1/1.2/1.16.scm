
#|
an additional state variable a,用于储存当n为奇数时的乘法累积值
当 n = 1时，将两种状态的值累积在一起
|#

(define (fast-exp-iter a b n)
  (cond ((= n 0) a)
      ((even? n) (fast-exp-iter a (* b b) (/ n 2)))
      (else (fast-exp-iter (* a b) b (- n 1)))))

(define (fast-exp  b n)
  (fast-exp-iter 1 b n))

(trace fast-exp-iter)


(display (fast-exp 2 7))
(exit)

