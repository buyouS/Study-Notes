
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (inc a)
  (+ a 1))

(define (cube x)
  (* x x x))


(define (even? n)
  (= (remainder n 2) 0))



(define (integarl-simpson f a b n)
  (define h (/ (- b a) n))

  (define (yk k)
    (f (+ a (* k h))))
  
  (define (term k)
    (cond
      ((= k 0) (yk k))
      ((= k n) (yk k))
      ((even? k) (* 2.0 (yk k)))
      (else (* 4.0 (yk k)))))

  (*
     (/ h 3.0)
     (sum term 0 inc n)))

;0.24999999999999992
(display (integarl-simpson cube 0 1 100))
;0.2500000000000002
(display (integarl-simpson cube 0 1 1000))
(exit)