;; Section 2.2. Simple Expression
;; http://www.scheme.com/tspl3/start.html#./start:h2

;; There are several type of numbers
12345
3/4
2.718281828
2.2+1.1i

;; procedure applications
(format #t "~a~%" (+ 1/2 1/2)) ; => 1
(format #t "~a~%" (- 1.5 1/2)) ; => 1.0
(format #t "~a~%" (* 3 1/2)) ; => 2/3
(format #t "~a~%" (/ 1.5 3/4)) ; => 2.0

;; * prefix notation
;; * (procedure args, ... )
;; * procedure application can be nested
;; * Scheme supports many arithmetic procedures

(format #t "~a~%" (+ (+ 2 2) (+ 2 2))) ; => 8
(format #t "~a~%" (- 2 (* 4 1/3))) ; => 2/3
(format #t "~a~%" (* 2 (* 2 (* 2 (* 2 2))))) ; => 32
(format #t "~a~%" (/ (* 6/7 7/2) (- 4.5 1.5))) ; => 1.0

;; List
'(1 2 3 4 5)
'("this" "is" "a" "list")
'(4.2 "hi")
'((1 2) (3 4))
'(1 2 3 4 5) ; => 1 is a number not a procedure

;; quote forces list to be treated as data
(format #t "~a~%" (quote (1 2 3 4 5))) ; => (1 2 3 4 5)
(format #t "~a~%" (quote ("this" "is" "a" "list"))) ; => (this is a list)
(format #t "~a~%" (quote (+ 3 4))) ; => (+ 3 4)

;; * If object is enclosed in a quote expression,  then it's called as quoted.
;; * quote expression is not a procedure application.
;; * quote expression involve lists.
;; * quote prevents that Scheme treats hello as variable.

(quote hello)
; > hello
'2
; > 2
'2/3
; > 2/3
(quote "Hi Mom!")
; > "Hi Mom!"

;; Numbers and Strings are treated as Constants.
(car '(a b c))
; > a
(cdr '(a b c))
; > (b c)
(car (cdr '(a b c)))
; > b
(cdr (cdr '(a b c)))
; > (c)
(car '((a b) (c d)))
; > (a b)
(cdr '((a b) (c d)))
; > ((c d))

(format #t "~a~%" (cons 'a '())) ; => (a)
(format #t "~a~%" (cons 'a '(b c))) ; => (a b c)
(format #t "~a~%" (cons 'a (cons 'b (cons 'c '())))) ; => (a b c)
(format #t "~a~%" (cons '(a b) '(c d))) ; => ((a b) c d)

(format #t "~a~%" (car (cons 'a '(b c)))) ; => a
(format #t "~a~%" (cdr (cons 'a '(b c)))) ; => (b c)
(format #t "~a~%" (cons (car '(a b c))
                        (cdr '(d e f)))) ; => (a e f)
(format #t "~a~%" (cons (car '(a b c))
                        (cdr '(a b c)))) ; => (a b c)

;; * car and cdr are used as nonus.
;; * cons is used as verb.
;; * A list is sequence of pair.
;; * Each pair's cdr is the next pair in sequence.
;; * cdr of the last pair in proper list is empty list '().
;;   Otherwise  the Sequen of pair's form is improper.
;; * The empty list is proper list.
;; * pair that it's cdr is proper list is a proper list.

(format #t "~a~%" (cons 'a 'b)) ; => (a . b)
(format #t "~a~%" (cdr '(a . b))) ; => b
(format #t "~a~%" (cons 'a '(b . c))) ; => (a b . c)

;; dotted pair
(format #t "~a~%" '(a . (b . (c . ())))) ; => (a b c)

;; Exercise

;; ex. 2.2.1
(format #t "~%;; ex. 2.2.1. ~%~%")
; a
(format #t "~a~%" (+ -8.7 (* 1.2 (- 2 1/3)))) ; => -6.699999999999999
; b
(format #t "~a~%" (/ (+ 2/3 4/9) (- 5/11 4/3))) ; => -110/870
; c
(format #t "~a~%" (+ 1 (/ 1 (+ 2 (/ 1 (+ 1 1/2)))))) ; => 11/8
; d
(format #t "~a~%" (* (* (* (* (* (* 1 -2) 3) -4) 5) -6) 7)) ; -5040

;; ex. 2.2.2
(format #t "~%;; ex. 2.2.2. ~%~%")

;;; when decimal is given, expression will return decimal type.
(format #t "~a~%" (+ 1.0 1)) ; => 2.0
(format #t "~a~%" (+ 4 2.0)) ; => 2.0
(format #t "~a~%" (- 2.0 2/4)) ; => 1.5
(format #t "~a~%" (- 2/4 2.0)) ; => 2.5
(format #t "~a~%" (* 2.0 1/3)) ; => 0.6666666666666666
(format #t "~a~%" (/ 8.0 1/2)) ; => 16.0
;;; when fraction is given, expression will return fraction in most case. but if possible, it will be integer.
(format #t "~a~%" (+ 1/2 1/2)) ; => 1
(format #t "~a~%" (+ 4.0 1/2)) ; => 4.5
(format #t "~a~%" (- 1/2 -3)) ; => 7/2
(format #t "~a~%" (- 1/2 3)) ; => -5/2
;;; when integer is given, expression will return integer is most case. but if impossible, it will be fracton.
(format #t "~a~%" (/ 20 13)) ; => 20/13
(format #t "~a~%" (- 1 20)) ; => -19
;;; zero
(format #t "~a~%" (/ 3 0)) ; => +inf.0
(format #t "~a~%" (/ 0 3)) ; => 0
;; priority: decimal > fraction > integer

;; ex. 2.2.3.
(format #t "~%;; ex. 2.2.3. ~%~%")
; a
(format #t "~a~%" (cons 'car 'cdr)) ; => (car . cdr)
; b
(format #t "~a~%" (list 'this '(is silly))) ; => (this (is silly))
; c
(format #t "~a~%" (cons 'is '(this silly?))) ; => (is this silly?)
; d
(format #t "~a~%" (quote (+ 2 3))) ; => (+ 2 3)
; e
(format #t "~a~%" (cons '+ '(2 3))) ; => (+ 2 3)
; f
(format #t "~a~%" (car '(+ 2 3))) ; => +
; g
(format #t "~a~%" (cdr '(+ 2 3))) ; => '(2 3)
; h
(format #t "~a~%" cons) ; => #<subr cons>
; i
(format #t "~a~%" (quote cons)) ; => cons
; j
(format #t "~a~%" (quote (quote cons))) ; => 'cons
; k
(format #t "~a~%" (car (quote (quote cons)))) ; => quote
; l
(format #t "~a~%" (+ 2 3)) ; => 5
; m
(format #t "~a~%" (+ '2 '3)) ; => 5
; n
(format #t "~a~%" (+ (car '(2 3)) (car (cdr '(2 3))))) ; => 5
