#lang planet neil/sicp
(define (pow base n)
  (define (pow-it prod n)
    (if (= n 0)
        prod
        (pow-it (* prod base) (- n 1))))
  (pow-it 1 n))
;(pow 2 3)
;(pow 3 2)

(define (de-factor num base)
  (define (df-it n num)
    (if (not(= 0 (remainder num base)))
        n
        (df-it (+ 1 n) (/ num base))))
  (df-it 0 num))
;(de-factor 72 2)
;(de-factor 72 3)

(define (cons x y)
  (* (pow 2 x) (pow 3 y)))

(define (car z)
  (de-factor z 2))

(define (cdr z)
  (de-factor z 3))

(car (cons 2 3))
(cdr (cons 2 3))