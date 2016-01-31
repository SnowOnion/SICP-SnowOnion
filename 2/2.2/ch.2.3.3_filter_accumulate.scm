#lang planet neil/sicp

; map 容易实现，scheme 实现里也提供；filter 和 accumulate 容易标准化：

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

(display (filter (lambda (x) (> x 3)) '(1 6 2 5 3 4 7)))
(accumulate + 0 '(1 6 2 5 3 4 7))
        
; enumerate 取决于具体结构：
;; 区间
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ 1 low) high))))

(display (enumerate-interval 1 10)) (newline)

#|
;; 先序遍历树，取叶子：
(#%require "./2.28_fringe.scm") ; 妈妈的又不行。是不是不能嵌套 (#%require 啊？ TODO
(define (enumerate-tree tree)
  (fringe tree))

|#

; 用这个「设计模式」实现 找出从0到n间偶数的平方和
(define (sum-even-square n)
  (accumulate +
              0
              (map (lambda (x) (* x x))
                   (filter (lambda (x) (= 0 (remainder x 2)))
                      (enumerate-interval 0 n)))))
(sum-even-square 6)
  