;; Section 2.1 
;; http://www.scheme.com/tspl3/start.html#./start:h1

;; REPL (reda eval print loop)

;; load wihout extension
(load "./section-1.3")
(load "./section-1.3.scm")

(format #t "------~%")

"Hi Mom!"
(format #t "~a~%" "Hi Mom!") ; => Hi Mom!
(format #t "~a~%" 1/2) ; 1/2
(format #t "~a~%" +) ; => #<subr +>
+
(+ 76 31)
'(1 2 3 4)

(format #t "------~%")

;; try
(format #t "~a~%" (car '(a b c))) ; => a
(format #t "~a~%" (cdr '(a b c))) ; => (b c)
(format #t "~a~%" (cons 'a '(b c))) ; => (a b c)

(format #t "~a~%" (cons (car '(a b c))
                        (cdr '(d c e)))) ; => (a c e)
(define square
  (lambda (x)
    (* x x)))

(format #t "~a~%" (square 5)) ; => 25
(format #t "~a~%" (square -200)) ; => 40000
(format #t "~a~%" (square 0.5)) ; => 0.25
(format #t "~a~%" (square -1/2)) ; => 1/4

(load "./reciprocal.ss")

(format #t "~a~%" (reciprocal 10)) ; => 1/10
(format #t "~a~%" (reciprocal 1/10)) ; => 10
(format #t "~a~%" (reciprocal 0)) ; => opps!
