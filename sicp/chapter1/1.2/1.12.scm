(define (pascal-tri n i)
    (cond
        ((= i 1) 1)
        ((= i n) 1)
        (else (+ (pascal-tri (- n 1) (- i 1))
                 (pascal-tri (- n 1) i)))))

(display (pascal-tri 5 3))
(exit)