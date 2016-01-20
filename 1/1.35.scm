#lang planet neil/sicp
(define tolerance 0.00001)
(define (fix-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next ; next 比 guess 进了一步…… （也展现出let优越性
          (try next))))
  (try first-guess))

(fix-point (lambda (x) (+ 1 (/ 1 x))) 2.)
(fix-point (lambda (x) (+ 1 (/ 1 x))) 1.)
(fix-point (lambda (x) (+ 1 (/ 1 x))) -2.)

(fix-point (lambda (x) (* x x)) 0.5)

(fix-point (lambda (x) (* x x)) 1.)
          