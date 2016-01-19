#lang planet neil/sicp
(define a 3) ; a=3
(define b (+ a 1)) ; b=4
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1)) ; ( a==b?-1:max(a,b) ) * (a+1)
   (+ a 1)) ; 16