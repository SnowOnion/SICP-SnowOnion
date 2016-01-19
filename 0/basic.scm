#lang planet neil/sicp
;(load "some-module.scm")
; 表达式的序列
42
"aha"
; 函数或操作符调用
(+ 40 2)
; 函数定义
(define (my-function x) (+ x 1))
(my-function 42)
; 条件
;; 一样的
True
true
#T
#t
False
false
#F
#f
;; SICP:只有 #f 表示假,其他都是真...(啊 根据上面几行 False false #F #f 都是假)
(if #t 1 2)
(if #f 3 4)
; cond: 第一个条件为真的
(cond (#f 1)
      (#f 2)
      (#t 3 9) ; 这里序列会返回最后一个…… 之前的呢 TODO
      (#t 4)
      (else 5))
; 逻辑运算，是短路的。因而是特殊形式。
(and #t #f #t)
(or #t #f #t)
(not #t)
; 函数作为参数
(define (do op a b)
  (op a b))
(do + 3 4)
; 函数作为返回值: 实现一个 a+|b|
(define (f a b)
  ((if (> b 0) + -) a b))
(f 3 4)
(f 3 -4)

; 啊，副作用！输出
(display "abc\ndef")