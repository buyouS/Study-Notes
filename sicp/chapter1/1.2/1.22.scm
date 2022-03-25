#|
runtime 参考time.scm
|#
(load "primality.scm")

(define (timed-prime-test n)
  (display n)
  (newline)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (time-difference (current-time) start-time))))



(define (report-prime elapsed-time)
  (display " *** ")
  (newline)
  (display elapsed-time)
  (newline)
  elapsed-time)

;(display (timed-prime-test  166021 ))
(newline)
(display (add-duration
          (timed-prime-test  166021 )
          (timed-prime-test  166021 )))
(exit)

