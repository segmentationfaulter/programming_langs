
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (λ (x)
         (string-append x suffix)) xs))

(define (list-nth-mod xs n)
  (cond
    [(< n 0) (error "list-nth-mod: negative number")]
    [(null? xs) (error "list-nth-mod: empty list")]
    [#t (let* ([xs-length (length xs)]
          [mod-ans (remainder n xs-length)])
          (car (list-tail xs mod-ans)))]))

(define (stream-for-n-steps s n)
  (let* ([thunk-result (s)]
        [stream-elem (car thunk-result)]
        [next-stream (cdr thunk-result)])
    (if (= n 0)
        null
        (cons stream-elem (stream-for-n-steps next-stream (- n 1))))))

(define (nats start-point)
  (lambda () (cons start-point (nats (+ start-point 1)))))

(define (funny-number-stream)
  (letrec ([aux (lambda (start)
                  (lambda ()
                    (cons (if (= (remainder start 5) 0) (- 0 start) start) (aux (+ start 1)))))])
    (aux 1)))

(define (dan-then-dog)
  (letrec ([aux (lambda (idx)
                  (lambda ()
                    (cons (if (= (remainder idx 2) 0) "dan.jpg" "dog.jpg") (aux (+ idx 1)))))])
    (aux 0)))

(define (stream-add-zero s)
  (let* ([stream-pair (s)]
         [stream-element (car stream-pair)]
         [stream-thunk (cdr stream-pair)])
    (lambda ()
      (cons (cons 0 stream-element) (stream-add-zero stream-thunk)))))