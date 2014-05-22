;; Section 1.3. Typographical and Notational Convensions
;; http://www.scheme.com/tspl3/start.html#./start:h3

;; Scheme expressions are usually evaluated to single value.

;; procedure can also return multiple values
(define two-values
  (lambda ()
    (values 1 2 3)))

;; values
(format #t "~a~%" (two-values)) ; => 1
(format #t "~a~%" (values-ref (values 1 2 3) 1)) ; => 2
(format #t "~a~%" (call-with-values two-values list)) ; => (1 2 3)
