(define (search f neg-point pos-point)
  (let ((mid-point (/ (+ neg-point pos-point) 2)))
    (if (close-enough? neg-point pos-point)
        mid-point
        (let ((test-value (f mid-point)))
          (cond ((postive? tes-value)
                 (search f neg-point mid-point))
                ((negative? test-value)
                 (search f mid-point pos-point))
                (else mid-point))))))
              
(define (close-enough? neg-point pos-point)
  (< (abs (- pos-point neg-point)) 0.001))


