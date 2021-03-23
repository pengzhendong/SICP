#lang racket

(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))

(define (f2 n)
  (define (iter a b c count)
    (if (= count 0)
        c
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

  (if (< n 3)
      n
      (iter 0 1 2 (- n 2))))

(require rackunit)
(check-equal? (f1 3) (f2 3))
(check-equal? (f1 4) (f2 4))
(check-equal? (f1 5) (f2 5))
