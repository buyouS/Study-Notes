#|
参考https://cisco.github.io/ChezScheme/csug9.5/csug9_5.pdf
第12.10章节：Times and Dates
|#

#|
(current-time) 
(current-time time-type)
time-type must be one of the time-type symbols listed above and defaults to time-utc.

time-utc: The time elapsed since the “epoch:” 00:00:00 UTC, January 1, 1970, subject to
adjustment, e.g., to correct for leap seconds.

time-duration: The time elapsed between two times. When used as an argument to
current-time, it behaves like time-monotonic, but may also used to represent the
result of subtracting two time objects.
|#
(display (current-time))

#|
(time-nanosecond time)
(time-second time)
|#
(newline)
(display (time-nanosecond (current-time)))
(newline)
(display (time-second (current-time)))
(newline)
(display "----------")

(define a (current-time))
(newline)
(display a)
(newline)
(display (time-nanosecond a))
(newline)
(display (time-second a))



#|
(time-difference time1 time2)
returns: the result of subtracting time2 from time1
(subtract-duration time timed) 
returns : the result of subtracting timed from time
(add-duration time timed)
|#
(newline)
(display "----------")
(newline)
(define b (current-time))
(define ba (time-difference b a))
(display ba)
(newline)
(define c (current-time))
(define d (current-time))
(define dc (time-difference d c))
(display dc)
(newline)
(display (subtract-duration dc ba))
(exit)

#|
(make-time type nsec sec) 
|#

(display (make-time 'time-duration 0 0))