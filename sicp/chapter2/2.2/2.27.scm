(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))


(define (reverse list)
  (if (null? list)
      '()
      (append (reverse (cdr list))
              (cons (car list) '()))))

(define (reverse-i list)
  (define (iter cur product)
    (if (null? cur)
        product
        (iter (cdr cur) (cons (car cur) product))))
  (iter (cdr list) (cons (car list) '())))


;(display (reverse-i (list 12 45 (list 22 64) 11)))

(define (deep-reverse list)
  (cond
    ((null? list) '())
    ((pair? (car list))
     (append (deep-reverse (cdr list))
             (cons (deep-reverse (car list)) '())))
    (else (append (deep-reverse (cdr list))
                  (cons (car list) '())))))

(newline)
(define a (list (list 12 45) (list 22 64) 23 44))
(display a)
(newline)
(display (deep-reverse a))

;更简洁
 (define (deep-reverse- li) 
   (cond ((null? li) '()) 
         ((not (pair? li)) li) 
         (else (append (deep-reverse (cdr li))  
                       (list (deep-reverse (car li))))))) 

(exit)