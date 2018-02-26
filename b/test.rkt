#lang racket

(require "hw5.rkt")

(define adder (fun #f "x" (fun #f "y" (add (var "x") (var "y")))))

(eval-exp (call (call adder (int 2)) (int 2)))