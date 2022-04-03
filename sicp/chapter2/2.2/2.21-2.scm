(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))


(define (square-list list)
  (map (lambda (x) (* x x)) list))

(define (square-list list)
  (if (null? list)
      '()
      (cons (* (car list) (car list)) (square-list (cdr list)))))


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(define (square x) (* x  x))

;((((() . 1) . 4) . 9) . 16)
(display (square-list (list 1 2 3 4)))
(exit)
