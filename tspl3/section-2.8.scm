;; Section 2.8. Simple Recursion
;; http://www.scheme.com/tspl3/start.html#./start:h8

(add-load-path "../util" :relative)
(load "test")

;; Recursion: the application of a procedure form within the procedure.
;; never returns
;; (define goodbye
;;   (lambda ()
;;     goodbye))

(define length
  (lambda (ls)
    (if (null? ls)
      0
      (+ (length (cdr ls)) 1))))

(assert-eq ":(" 0 (length '()))
(assert-eq ":(" 1 (length '(a)))
(assert-eq ":(" 2 (length '(a b)))

(use slib)
(require 'trace)

(trace length)
(length '(a b c d))
