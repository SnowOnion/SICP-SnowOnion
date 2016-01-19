#lang planet neil/sicp
; 之前是 recursive process, 改成 iterative process!~
(define (accumulate combiner null-value term a next b)
  (define (f result-store current-a)
    (if (> current-a b)
        result-store
        (f (combiner result-store (term current-a)) (next current-a))))
  (f null-value a))


; 乃们都是我的特例！
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))
  
; ref: ch.1.3.1_...
(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 100)

(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)