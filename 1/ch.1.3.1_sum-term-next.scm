#lang planet neil/sicp
(define (sum term a next b)
  (if (> a b) ; 嗯，序……
      0
      (+ (term a) 
         (sum term (next a) next b)) ))

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 100)