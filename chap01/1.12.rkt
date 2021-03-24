#lang racket

(define (pascal row col)
   (cond ((< row col) #f)
         ((or (= 0 col) (= row col)) 1)
         (else (+ (pascal (- row 1) col)
                  (pascal (- row 1) (- col 1))))))

(require rackunit)
(check-equal? (pascal 4 0) 1)
(check-equal? (pascal 4 1) 4)
(check-equal? (pascal 4 2) 6)
(check-equal? (pascal 4 3) 4)
(check-equal? (pascal 4 4) 1)
