(define (even? n)
  (= (remainder n 2) 0))

(define (odd? n)
  (not (even? n)))


; (define (same-parity x . y)
;   (let ((xy (cons x y)))
;       (if (even? x)
;           (if (even? (car xy))
;               (cons (car xy) ))))


; (define (same-parity x . y)
;   (define (help xy)
;     (if (even? x)
;         (if (even? (car xy))
;             ())
;         )))


(define (same-parity x . y)
  (let ((same-x? (if (even? x)
                    even?
                    odd?)))
    
     (define (help xy)
       (cond
         ((null? xy) '())
         ((same-x? (car xy)) (cons (car xy) (help (cdr xy))))
         (else (help (cdr xy)))))
     (help (cons x y))))

(define filted-list (same-parity 2 1 3 4 5 6 7 8))

(display filted-list)
(exit)