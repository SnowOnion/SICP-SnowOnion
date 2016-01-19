#lang planet neil/sicp
(define (fast-expt b n)
  (define (f a b n)
    (if (= n 0)
        a
        (if (even? n)
            (f a (* b b) (/ n 2))
            (f (* a b) b (- n 1)))))
  (f 1 b n))

(fast-expt 2 3)
(fast-expt 3 2)
(fast-expt 2 1)
(fast-expt 2 0)
(fast-expt 2 256) ; checked by python 2**256