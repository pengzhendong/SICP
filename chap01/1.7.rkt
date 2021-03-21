#lang racket

(define (average x y)
  (/ (+ x y) 2.0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; 0.001 is too large
(sqrt 0.0009) ; 0.04030062264654547
; square of guess is too large
; (sqrt 100000000000000000.0)

(define (new-good-enough? guess new-guess)
  (< (abs (/ (- guess new-guess) guess))
     0.001))

(define (new-sqrt-iter guess x)
  (if (new-good-enough? guess (improve guess x))
      guess
      (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(new-sqrt 0.0009)
(new-sqrt 100000000000000000.0)