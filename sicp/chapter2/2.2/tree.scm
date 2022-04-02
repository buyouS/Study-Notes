(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (+ (count-leaves (car list))
           (count-leaves (cdr list)))))


