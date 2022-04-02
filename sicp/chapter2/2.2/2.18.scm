(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))


(define (reverse list)
  (if (null? list)
      '()
      (append (reverse (cdr list))
              (cons (car list) '()))))

(display (list 12 45 64))
(display (reverse (list 12 45 64)))
(exit)