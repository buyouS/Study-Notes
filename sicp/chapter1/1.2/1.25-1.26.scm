
#|
如果base很大会导致计算很慢，还有可能越界
|#
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

#|
偶数时
T(n) = T(n/2) --logn--变为：
T(n) = 2T(n/2) --n--

|#
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
           (* (expmod base (/ exp 2) m)
              (expmod base (/ exp 2) m))
           m))
        (else
         (remainder 
           (* base (expmod base (- exp 1) m))
           m))))