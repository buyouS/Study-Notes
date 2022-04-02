(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))))

(display (last-pair (list 12 45 64)))
(exit)