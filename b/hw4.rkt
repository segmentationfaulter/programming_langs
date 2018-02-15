
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

(define (funny-number-stream)
  (letrec ([aux (lambda (stream-element)
                  (cons (if (= (remainder stream-element 5) 0) (- stream-element) stream-element) (lambda () (aux (+ stream-element 1)))))])
    (aux 1)))

(define (dan-then-dog)
  (letrec ([aux (lambda (index)
                  (cons (if (= (remainder index 2) 0) "dan.jpg" "dog.jpg") (lambda () (aux (+ index 1)))))])
    (aux 0)))

(define (stream-add-zero s)
  (let* ([stream-pair (s)]
         [stream-element (car stream-pair)]
         [stream-thunk (cdr stream-pair)])
    (lambda ()
      (cons (cons 0 stream-element) (stream-add-zero stream-thunk)))))

(define (cycle-lists xs ys)
  (letrec ([aux (lambda (n)
                  (lambda ()
                    (cons (cons (list-nth-mod xs n) (list-nth-mod ys n)) (aux (+ n 1)))))])
    (aux 0)))

(define (vector-assoc v vec)
  (letrec ([aux (lambda (current-index)
                  (if (>= current-index (vector-length vec))
                      #f
                      (let ([current-element (vector-ref vec current-index)])
                        (cond [(not (pair? current-element)) (aux (+ current-index 1))]
                              [#t (if (equal? (car current-element) v) current-element (aux (+ current-index 1)))]))))])
    (aux 0)))

(define (cached-assoc xs n)
  (let ([cache (make-vector n #f)])
    (lambda (v)
      (let* ([cache-add-turn 0]
             [next-cache-element (remainder cache-add-turn (vector-length cache))]
             [add-to-cache (lambda (ans) (begin
                                           (vector-set! cache next-cache-element (cons v ans))
                                           (set! cache-add-turn (+ cache-add-turn 1))))]
             [found-in-cache (vector-assoc v cache)]
             [ans-from-cache (if found-in-cache (cdr (found-in-cache)) found-in-cache)])
        (if ans-from-cache
            ans-from-cache
            (let* ([ans-organic (assoc v xs)])
              (begin (add-to-cache ans-organic)
                     ans-organic)))))))                              