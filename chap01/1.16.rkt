#lang racket

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (fast-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (* b b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))


(require rackunit)
(define (check-fast-exp b n)
  ; (check-= v1 v2 epsilon [message])
  (check-= (expt b n) (fast-expt b n)  0.01))

(check-fast-exp 1.1 4)
(check-fast-exp 1.1 5)
