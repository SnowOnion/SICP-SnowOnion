#lang planet neil/sicp
; 一般化！成为你的超集！层次碾压！我好兴奋。
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            term
                            (next a)
                            next
                            b))))
; 乃们都是我的特例！
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))
  
; ref: ch.1.3.1_...
(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 100)

(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)