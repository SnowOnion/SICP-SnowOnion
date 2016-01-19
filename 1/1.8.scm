#lang planet neil/sicp
(define (cube-root x)
  (cube-root-iter 1.0 x)) ; 1.0 则用小数, 1 则用分数
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001))
(define (improve guess x)
  (/ (+ (/ x 
           (* guess guess)) 
        (* 2 guess)) 
     3))

(cube-root 1)
(cube-root 0.125)
(cube-root 8.0)
(cube-root 2)
