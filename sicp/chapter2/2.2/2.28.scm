(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree))  
                      (fringe (cdr tree))))))

(define a (list (list 12 45) (list 22 64) 23 44))
(display a)
(newline)
(display (fringe a))
(exit)