#lang planet neil/sicp
(define zero
  (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))
(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (add m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

; 怎么检验啊= =
; 啊！“对0应用n次后继函数”=n~

(define (to-num n)
  (define (suc x) (+ 1 x))
  ((n suc) 0))

(to-num zero)
(to-num one)
(to-num two)
(to-num (add-1 two))
(to-num (add two two))