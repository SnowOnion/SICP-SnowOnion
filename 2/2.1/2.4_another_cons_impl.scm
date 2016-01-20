#lang planet neil/sicp
; 固参器 (lambda (m) (m x y)) !!!
(define (cons x y)
  (lambda (m) (m x y)))
; 取参器 (lambda (p q) p) !!!
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 3 5))
(cdr (cons 3 5))

