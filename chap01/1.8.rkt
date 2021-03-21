#lang racket

(define (square x) (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess new-guess)
  (< (abs (/ (- guess new-guess) guess))
     0.001))

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 0.008)
(cube-root 8)