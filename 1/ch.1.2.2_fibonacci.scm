#lang planet neil/sicp
(define (fib-tree n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-tree (- n 1))
                 (fib-tree (- n 2))))))
(fib-tree 0)
(fib-tree 1)
(fib-tree 2)
(fib-tree 3)
(fib-tree 4)
(fib-tree 35)
"
(define (test-tree min-n max-n)
  (if (<= min-n max-n)
      (test-tree min-n (- max-n 1))
      (display (fib-tree max-n))
      (newline)
      #t))
(test-tree 0 10)
"

(define (fib-linear n)
  (define (fib-iter n-2 n-1 count)
    (if (= 0 count)
        n-2
        (fib-iter n-1 (+ n-2 n-1) (- count 1))))
  (fib-iter 0 1 n))

(fib-linear 0)
(fib-linear 1)
(fib-linear 2)
(fib-linear 3)
(fib-linear 4)
(fib-linear 35)
 