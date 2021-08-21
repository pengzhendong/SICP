#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(require rackunit)
(check-equal? (a-plus-abs-b 1 1) 2)
(check-equal? (a-plus-abs-b 1 -1) 2)
