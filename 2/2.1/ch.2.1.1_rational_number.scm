#lang planet neil/sicp
; numerator  ['njuːməreɪtə] 
; denominator  [dɪ'nɒmɪneɪtə] 

(#%require "../../0/gcd.scm")

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (println-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(let ((x (make-rat 2 4))
      (y (make-rat 0 4))
      (z (make-rat 2 0)))
  (println-rat x)
  (println-rat y)
  (println-rat z))
