#lang planet neil/sicp
; iterative process
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (f result-store current-a)
    (if (> current-a b)
        result-store
        (if (filter current-a)
            (f (combiner result-store (term current-a)) (next current-a))
            (f result-store (next current-a)))))
  (f null-value a))


; 乃们都是我的特例！
(define (sum term a next b)
  (filtered-accumulate + 0 term a next b (lambda (x) #T)))

(define (filtered-sum term a next b filter)
  (filtered-accumulate + 0 term a next b filter))

(define (product term a next b)
  (filtered-accumulate * 1 term a next b (lambda (x) #T)))

(define (filtered-product term a next b filter)
  (filtered-accumulate * 1 term a next b filter))

(define (prime-fake? n)
  #T)

(define (gcd x y)
  (if (< x y)
      (gcd y x)
      (if (= y 0)
          x
          (gcd y (remainder x y)))))
  
; test
(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 100)

(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)

(gcd 25 150)
(gcd 150 25)
(gcd 35 150)
(gcd 150 35)

; a)
((lambda (a b)
  (filtered-sum (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b prime-fake?))
 1
 5) ; 1^2+2^2+...+5^2 = 55 (= 1+2+...+10)
; b)
((lambda (a b)
   (filtered-product (lambda (x) x) a (lambda (x) (+ x 1)) b (lambda (x) (= 1 (gcd x b)))))
 1
 12) ; 1*5*7*11 = 385 