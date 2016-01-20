#lang planet neil/sicp

(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))
; 你是否也有千言万语
; 埋在递归栈帧里

#|
(append (list 1 2 3) (list 4 5 6))
'()
'(1 3 5 7)
|#