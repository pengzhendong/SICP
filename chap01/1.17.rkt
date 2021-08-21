#lang racket

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))

(require rackunit)
(define (check-fast-mul a b)
  (check-= (* a b) (fast-mul a b)  0.01))

(check-fast-mul 1.1 4)
(check-fast-mul 1.1 5)
