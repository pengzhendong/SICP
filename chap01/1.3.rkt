#lang racket

(define (max-sum a b c)
  (cond ((and (> a c) (> b c)) (+ a b))
        ((and (> a b) (> c b)) (+ a c))
        (else (+ b c))))

(require rackunit)
(check-equal? (max-sum 1 2 3) 5)
(check-equal? (max-sum 1 3 2) 5)
(check-equal? (max-sum 3 2 1) 5)
