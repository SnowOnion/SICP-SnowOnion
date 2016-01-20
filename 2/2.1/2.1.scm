#lang planet neil/sicp
; 分析 numerator 和 denominator 分别为 +0- 的情形，结论是：
; 不处理 denominator=0 时，当且仅当 分母<0 时让 分子分母 都取负。
; 当然让数据符合 (gcd x y) 的 precondition 也是很大的！
(define (better-make-rat n d)
  (define (neg rat)
    (cons (- 0 (car rat)) (cdr rat)))
  (cond ((and (< n 0) (< d 0)) (better-make-rat (- 0 n) (- 0 d)))
        ((and (< n 0) (> d 0)) (neg (better-make-rat (- 0 n) d)))
        ((and (> n 0) (< d 0)) (neg (better-make-rat n (- 0 d))))
        (else (let ((g (gcd n d)))
                (cons (/ n g) (/ d g))))))

;(#%require "ch.2.1.1_rational_number.scm") ; 为啥 println-rat 符号不能识别？！！！2016-01-20 17:51:02
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (println-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(println-rat (better-make-rat 2 4))
(println-rat (better-make-rat 2 0))
(println-rat (better-make-rat 2 -4))
(println-rat (better-make-rat 0 4))
; (println-rat (better-make-rat 0 0)) ; hh 需要规定(= 1 (gcd 0 0)) 才能苟活
(println-rat (better-make-rat 0 -4))
(println-rat (better-make-rat -2 4))
(println-rat (better-make-rat -2 0))
(println-rat (better-make-rat -2 -4))

