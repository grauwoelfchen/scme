;; Section 1.1. Scheme Syntax
;; http://www.scheme.com/tspl3/intro.html#./intro:h1

-1
"hi"
'()

; (define -1 "minus one") ;; => syntax-error
(format #t "~a~%" syntax-error)

(define ?$&*!! "hi")

(format #t "~a~%" (eq? #f '())) ; => #f
(format #t "~a~%" (eq? #f (not #t))) ; => #t
(format #t "~a~%" (eq? #f (not '()))) ; => #t

(format #t "~a~%" #(this is a vector of symbols))
(format #t "~a~%" '(#\c #\h #\a #\r))
(format #t "~a~%" 1/2)

;;; comment
