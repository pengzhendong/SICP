#lang racket

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (define (iter n a b)
    (cond ((= b 0) n)
          ((even? b) (iter n (double a) (halve b)))
          (else (iter (+ n a) a (- b 1)))))
  (iter 0 a b))

(require rackunit)
(define (check-fast-mul a b)
  (check-= (* a b) (fast-mul a b)  0.01))

(check-fast-mul 1.1 4)
(check-fast-mul 1.1 5)
