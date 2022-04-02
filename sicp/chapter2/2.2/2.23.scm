(define (for-each proc list)
  (cond ((null? (cdr list)) (proc (car list)))
      (else (proc (car list))
            (for-each proc (cdr list)))))


(define (for-each proc list)
    (cond ((not (null? list))
            (proc (car list))
            (for-each proc (cdr list)))))


(define (print list)
  (for-each (lambda (x) (newline) (display x)) list))

(print (list 121 43  5322))
(exit)