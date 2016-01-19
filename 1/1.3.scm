#lang planet neil/sicp
; 返回三个数中较大的两个的平方和
(define (max-two-square-sum a b c)
  (define (square-sum x y) 
    (+ (* x x) (* y y)))
  (cond ((and (<= a b) (<= a c)) (square-sum b c))                                
        ((and (<= b a) (<= b c)) (square-sum a c))
        (else (square-sum a b))))

(max-two-square-sum 2 3 5)
(max-two-square-sum 2 5 3)
(max-two-square-sum 3 2 5)
(max-two-square-sum 3 5 2)
(max-two-square-sum 5 2 3)
(max-two-square-sum 5 3 2)
