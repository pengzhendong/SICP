#lang racket

(define (cube x) (* x x x))

(define (p x)
  (printf "p(~a)\n" x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; p 将被使用 5 次
(sine 12.15)

; 阶数为: O(loga)
