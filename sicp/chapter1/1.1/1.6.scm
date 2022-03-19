#|
Chez Scheme Version 9.5.6
Copyright 1984-2021 Cisco Systems, Inc.
out of memory

应用序的求值过程使得递归无法退出
|#

(load "sqrt.scm")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
      (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))




(display (sqrt 2))

(exit)

