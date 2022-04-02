(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (+ (count-leaves (car list))
           (count-leaves (cdr list)))))


(define (tree-map tree proc)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map (car tree) proc)
                    (tree-map (cdr tree) proc)))))

(define (square-tree tree)
  (tree-map tree (lambda (x) (* x x))))

(define a  (list 1
                 (list 2 (list 3 4) 5)
                 (list 6 7)))

(display (square-tree a))
(exit)


