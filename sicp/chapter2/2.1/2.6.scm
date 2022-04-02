(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
               
(define (church-to-number c)
    ((c (lambda (n) (+ 1 n))) 0))

(define three (plus one two))


(display (church-to-number three))
(exit)


