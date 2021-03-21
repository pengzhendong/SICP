#lang racket

; normal-order evaluation: fully expand and then reduce
; applicative-order evaluation: evaluate the arguments and then apply
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

; normal-order evaluation will return 0.
; applicative-order evaluation will lead to infinite recursion.
(test 0 (p))