#lang planet neil/sicp
; filter 之一种
(define (same-parity first . remained)
  (define (same-parity-num x y)
    (= 0 (remainder (+ x y) 2)))
  (define (filter l)
    (if (null? l)
        l
        (let ((inner-first (car l)))
          (if (same-parity-num first inner-first)
              (cons inner-first (filter (cdr l)))
              (filter (cdr l))))))
  (cons first (filter remained)))

(define (test-bccs a . b)
  (display a)
  (newline)
  (display b)
  (newline))

(test-bccs 1 2 3 4 5)
(same-parity 1 2 3 4 5)