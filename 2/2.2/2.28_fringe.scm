#lang planet neil/sicp
(#%require "ch.2.2.1_append.scm")

(define aTree (list (list 1 2) (list 3 4)))
(define bTree (list (list 1 2) (list (list 3) (list 4 5 6))))

#|
(display aTree)
(newline)
(display bTree)
(newline)

(list? 1)
(null? 1) ; #f
(list? '())
(null? '())
(list? '(1))
(null? '(1))
|#

(define (fringe tree)
  (if (list? tree)
      (if (null? tree)
          '()
          (append (fringe (car tree)) ; 1. 必须继续剥掉
                  (fringe (cdr tree))))
      (list tree))) ; 2. 所以要处理 非列表（为元素）时的情形
; 啊哈，(list tree) 和 '(tree) 是很不同的呢。看符号那一节。

#|
(display (fringe aTree))
(newline)
(display (fringe bTree))
(newline)
|#