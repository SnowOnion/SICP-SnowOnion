#lang planet neil/sicp

; 能 shadow.
(define (cons n d)
  (define (dispatch m)
    (cond ((= m 0) n)
          ((= m 1) d)))
  dispatch)

(define (car x)
  (x 0))

(define (cdr x)
  (x 1))

; 约定好啊！

(car (cons 1 2))

(cdr (cons 1 2))