#lang planet neil/sicp
(define (f x . y)
  (display x) (newline) (display y) (newline))
(define (g . x)
  (display x) (newline))
(define h (lambda (x . y)
             (display x) (newline) (display y) (newline)))
(define i (lambda x ; 好生奇怪~
             (display x) (newline)))

(f 1 2 3)
(g 1 2 3)
(h 1 2 3)
(i 1 2 3)