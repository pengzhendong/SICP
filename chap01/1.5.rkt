#lang racket

; 正则序：先完全展开，再规约
; 应用序：先求参数，然后再求函数值
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

; 正则序：返回 0
; 应用序：求参数值导致无限递归
(test 0 (p))
