#lang planet neil/sicp

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
                    (cons (car sequence)
                          (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              '()
              sequence))

(display (my-map (lambda (x) (+ x 1))
        '(1 2 3 4)))
(newline)

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(display (my-append '(5 4) '(3 2)))
(newline)

(define (my-length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

(my-length '(5 4 3 2))
