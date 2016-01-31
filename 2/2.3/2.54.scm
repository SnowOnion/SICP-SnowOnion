#lang planet neil/sicp

(eq? 1 1)
(eq? 1 2)
(eq? 'a 'a)
(eq? 'a 'b)

(display "咦 是可以用于数值的吖……")
(newline)

(equal? '() '() )
(equal? '(1) '(1) )
(equal? '(a b) '(a b) )
(equal? '(a b) '(a) )

(display "阿西吧 已经实现了呀")
(newline)

(define (my-equal? list1 list2)
  (let ((n1 (null? list1))
        (n2 (null? list2)))
    (cond ((and n1 n2) true)
          ((and n1 (not n2)) false)
          ((and (not n1) n2) false)
          (else (and (eq? (car list1) (car list2)) 
                     (my-equal? (cdr list1) (cdr list2)))))))
; 啊西，还是尾递归不鸟

(my-equal? '() '() )
(my-equal? '() '(1) )
(my-equal? '(1) '() )
(my-equal? '(1) '(1) )
(my-equal? '(1) '(2) )
(my-equal? '(a b) '(a b) )
(my-equal? '(a b) '(a) )
(my-equal? '(a b) '(a c) )
(my-equal? '(a b) '(b a) )