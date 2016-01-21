#lang planet neil/sicp
(define a (cons '(1 2)
                '(3 4)))

(display a)
(newline)

(define (println x)
  (display x)
  (newline))

(println '(1 (2 (3 4)))) ; TODO 为啥不需要 '(1 '(2 '(3 4))) 呢？

(println (list 1 (list 2 (list 3 4))))