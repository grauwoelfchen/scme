;; Section 1.2. Scheme Naming Convensions
;; http://www.scheme.com/tspl2/intro.html#./intro:h2

;; Predicate names end with `?`
(format #t "~a~%" (null? '())) ; => #t
(format #t "~a~%" (eq? '() '())) ; => #t
(format #t "~a~%" (zero? 9)) ; => #f
(format #t "~a~%" (string=? "foo" "foo")) ; => #t
;; Exception to naming convension
(format #t "~a~%" (< 0 1)) ; => #t
(format #t "~a~%" (<= 12 9)) ; => #f

;; (+ type ?)
(format #t "~a~%" (pair? '(3 . 2))) ; => #t

(format #t "~a~%" (string-append "boo" "-" "boo")) ; => boo-boo

;; convert
(format #t "~a~%" (vector->list #(this is vector))); => (this is vector)

;; side effect
(define x 9)
(let ((x 1))
  (set! x "var"))

(format #t "~a~%" x) ; => 9

(let ((x 1))
  (set! x "var")
  (format #t "~a~%" x)) ; => var

(format #t "~a~%" x) ; => 9


(let ((v #(cat dog)))
  (vector-set! v 0 "penguin")
  (format #t "~a~%" v)) ; => (penguin dog)
