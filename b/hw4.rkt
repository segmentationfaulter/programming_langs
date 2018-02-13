
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (λ (x)
         (string-append x suffix)) xs))