#lang planet neil/sicp
; TODO 识别函数的调用关系…… 排序…… 的程序
;; 哎？！顺序“不对”也能运行啊…… 那就可以用“其中”顺序了…… aka 自顶向下
; TODO TDD 小工具
(define (sqrt x)
  (sqrt-iter 1.0 x)) ; 1.0 则用小数, 1 则用分数
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average a b)
  (/ (+ a b) 2))

(sqrt 1)
(sqrt 4)
(sqrt 2)
(sqrt 0.25)
(sqrt 0.0625)
(sqrt (* 0.25 0.25))