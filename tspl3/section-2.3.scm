;; Section 2.3. Evaluating Scheme Expressions
;; http://www.scheme.com/tspl3/start.html#./start:h3

;; procedure +, number, 3 and 4
(format #t "~a~%" (+ 3 4)) ; => 7

;; nested expressions
(format #t "~a~%" (* (+ 3 4) 2)) ; => 14

;; value of quote expression is object
(format #t "~a~%" (quote abc)) ; => abc

;; These are part of main syntactics
;; * Constants Objects
;; * procedure applications
;; * quote expression

;; Subexpressions are __not__ evaluated from left to right (free order)
;; Procedure will be also evaluated.

(format #t "~a~%" (car (list + - * /))) ; => #<subr +>
(format #t "~a~%" ((car (list + - * /)) 2 3)) ; => 5

;; Exercise

;; ex. 2.3.1
;; a. ((car (cdr (list + - * /))) 17 5)

(format #t "~a~%" (list + - * /)) ; => (#<subr +> #<subr -> #<subr *> #<subr />)
(format #t "~a~%" (cdr (list + - * /))) ; => (#<subr -> #<subr *> #<subr />)
(format #t "~a~%" (car (list - * /))) ; #<subr ->
(format #t "~a~%" (- 17 5)) ; => 12

;; b. (cons (quote -) (cdr (quote (+ b c))))
(format #t "~a~%" (quote (+ b c))) ; => (+ b c)
(format #t "~a~%" (cdr '(+ b c))) ; => (b c)
(format #t "~a~%" (quote -)) ; => '-
(format #t "~a~%" (cons '- '(b c))) ; => (- b c)

;; c. (cdr (cdr '(a b c)))
(format #t "~a~%" (cdr '(a b c))) ; => (b c)
