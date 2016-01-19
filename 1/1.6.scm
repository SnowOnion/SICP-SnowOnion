#lang planet neil/sicp
; Test how (cond) evaluates parameters
(cond (#t (display 1))
       (#t (display 2))
       (#f (display 3))
       (else (display 4)))
(newline)
"诶？！"
(define (new-if pre then-c else-c)
  (cond (pre then-c)
        (else else-c)))
(new-if #t (display 11) (display 22)) ; will both be evaluated!
; 所以那样写的 (sqrt x) 会死循环啦！