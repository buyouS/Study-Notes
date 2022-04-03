(load "sicp/chapter2/2.2/2.38.scm")

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))