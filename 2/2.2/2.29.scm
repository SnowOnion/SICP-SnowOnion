#lang planet neil/sicp
; constructor
(define (make-mobile left right)
;  (list left right)) ; d)-
  (cons left right)) ; d)+

(define (make-branch length structure)
;  (list length structure)) ; d)-
  (cons length structure)) ; d)+

; a)
; getter
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
;  (car (cdr mobile))) ; d)-
  (cdr mobile)) ; d)+

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
;  (car (cdr mobile))) ; d)-
  (cdr branch)) ; d)+

; (define iBranchA (make-branch 10 1))
(define iBranchA (make-branch 560 1)) ; 560*1=70*(5+3)
(define iBranchB (make-branch 30 5))
(define iBranchC (make-branch 50 3))
(define iMobileR (make-mobile iBranchB iBranchC))
(define iBranchD (make-branch 70 iMobileR))
(define iMobile (make-mobile iBranchA iBranchD))

(branch-length (left-branch iMobile))
(branch-structure (left-branch iMobile))
(branch-length (right-branch iMobile))
(display (branch-structure (right-branch iMobile))) (newline)

(display iMobile) (newline)

; b)
(define (mobile? structure)
  (pair? structure)) ; 啊！脆弱的"类型"标识…… ; 直接适应了 d) 的需求

(define (total-weight structure)
  (if (mobile? structure)
      (+ (total-weight (branch-structure (left-branch structure)))
         (total-weight (branch-structure (right-branch structure))))
      structure))

(total-weight iMobile)

; c) 完全不考虑效率！weight 爱重复算重复算吧……
(define (balance? structure)
  (if (not (mobile? structure))
      #t
      (let ((left (left-branch structure))
            (right (right-branch structure)))
        (and (balance? (branch-structure left))
             (balance? (branch-structure right))
             (= (* (branch-length left) (total-weight (branch-structure left)))
                (* (branch-length right) (total-weight (branch-structure right))))))))

(balance? iMobile)
(balance? iMobileR)
      