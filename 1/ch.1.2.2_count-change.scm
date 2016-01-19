#lang planet neil/sicp
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds 0)) 0)
        (else (+ (cc amount (- kinds 1)) ; 不用最后一种币
                 (cc (- amount (value kinds)) kinds))))) ; 用一次最后一种币
(define (value kind)
  (cond ((= kind 1) 1)
        ((= kind 2) 5)
        ((= kind 3) 10)
        ((= kind 4) 25)
        ((= kind 5) 50)))

(count-change 100)
(count-change 11)