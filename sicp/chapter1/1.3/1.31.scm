(define (even? n)
  (= (remainder n 2) 0))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (inc a)
  (+ a 1))
(define (identity x)
    x)


(define (factorial n)
  (product identity 1 inc n))

(define (pi-approx n)
  (define (term k)
    (if (even? k)
        (/ (+ k 2.0) (+ k 1.0))
        (/ (+ k 1.0) (+ k 2.0))))
  (* 4 (product term 1 inc n)))

(display (pi-approx 10))
(newline)
(display (pi-approx 100))
(newline)
(display (pi-approx 1000))
(exit)


(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))