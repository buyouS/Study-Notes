(display  (car (cdaddr (list 1 3 (list 5 7) 9))))

(display (caar (list (list 7))))

(display
 (cadadr
  (cadadr
   (cadadr
    (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))

(exit)