#lang racket

(define (average x y)
  (/ (+ x y) 2.0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x) (* x x))

(define (abs x)
  (if (< x 0) (- x)
      x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (new-if predicate then-caluse else-clause)
  (cond (predicate then-caluse)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

; 应用序: 先计算参数 then-caluse 和 else-clause 会导致无限递归
; if 语句会根据判断结果只计算一个分支
; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x)
;                      x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
