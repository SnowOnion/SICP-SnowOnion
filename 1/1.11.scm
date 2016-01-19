#lang planet neil/sicp
(define (f-t n)
  (if (< n 3)
      n
      (+ (f-t (- n 1))
         (* 2 (f-t (- n 2)))
         (* 3 (f-t (- n 3))))))

(map (lambda (n) (display (f-t n))
       (newline)) '(0 1 2 3 4 5))

(define (f-l n)
  (define (f-iter n-1 n-2 n-3 count)
    (if (= count 0) 
        n-3
        (f-iter (+ n-1
                   (* 2 n-2)
                   (* 3 n-3))
                n-1
                n-2
                (- count 1))))
  (f-iter 2 1 0 n))
                  
(map (lambda (n) (display (f-l n))
       (newline)) '(0 1 2 3 4 5))