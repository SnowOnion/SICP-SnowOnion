#lang planet neil/sicp
; precondition: non-negative integer x,y
(define (gcd x y)
  (if (> y x) 
      (gcd y x)
      (if (= y 0)
          x
          (gcd y (remainder x y)))))

;(gcd 15 75)
;(gcd 35 25)
;(gcd 15 -75)
;(gcd -35 25)