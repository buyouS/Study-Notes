(load "2.1/2.3.scm")

;上下平行线
(define (make-rect  s1 s2)
  (cons s1 s2))

#|
选择函数名称的语义标识出复合数据组成部分的含义，
这样操作函数才能利用选择函数表示出来，选择函数才能将
复合数据的具体实现隔离
|#

(define (up-left-point r)
  (car (car r)))

(define (up-right-point r)
  (cdr (car r)))

(define (bottom-left-point r)
  (car (cdr r)))

(define (bottom-right-point r)
  (cdr (cdr r)))

;从左顶点开始，顺时针
(define (make-rect p1 p2 p3 p4)
  (cons p1 (cons p2 (cons p3 p4))))

(define (up-left-point r)
   (car r))
(define (up-right-point r)
  (car (cdr r)))

(define (bottom-right-point r)
  (car (cdr (cdr r))))

(define (bottom-left-point r)
 (cdr (cdr (cdr r))))

