(load "1.3/newton.scm")

(define (cubic a b c)
  (+ (cube x) (* a (square x)) (* b x) c))