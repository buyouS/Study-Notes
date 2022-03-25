(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (inc a)
  (+ a 1))

(define (cube x)
  (* x x x))

(define (identity x)
    x)

(define (sum-cube a b)
  (sum cube a inc b))

(define (sum-primitive a b)
  (sum identity a inc b))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))

(* dx (sum f (+ a (/ dx 2.0)) add-dx b)))

#|
(display (sum-cube 1 4))
(newline)
(display (integral cube 0 1 0.01))
(exit)
|#