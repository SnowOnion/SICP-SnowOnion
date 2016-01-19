#lang planet neil/sicp
; 检测 解释器 是 正则序 还是 应用序
"start"
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))
"end"
; real: 死循环了。所以，应用序咯？