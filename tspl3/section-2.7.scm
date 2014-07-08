;; Section 2.7. Conditional Expressions
;; http://www.scheme.com/tspl3/start.html#./start:h7

(define abs
  (lambda (n)
    (if (< n 0)
        (- 0 n)
        n)))

(add-load-path "../util" :relative)
(load "test")

(assert-eq "abs :(" 77 (abs 77))
(assert-eq "abs :(" 77 (abs -77))

;; (if test consequent alternative)

(define abs2
  (lambda (n)
    (if (>= n 0)
        n
        (- 0 n))))

(assert-eq "abs2 :(" 18 (abs2 18))
(assert-eq "abs2 :(" 18 (abs2 -18))

(define abs3
  (lambda (n)
    (if (not (< n 0))
        n
        (- 0 n))))

(assert-eq "abs3 :(" 16 (abs3 16))
(assert-eq "abs3 :(" 16 (abs3 -16))

(define abs4
  (lambda (n)
    (if (or (> n 0) (= n 0))
        n
        (- 0 n))))

(assert-eq "abs4 :(" 21 (abs4 21))
(assert-eq "abs4 :(" 21 (abs4 -21))

(define abs5
  (lambda (n)
    (if (= n 0)
        0
        (if (< n 0)
            (- 0 n)
            n))))

(assert-eq "abs5 :(" 81 (abs5 81))
(assert-eq "abs5 :(" 81 (abs5 -81))

(define abs6
  (lambda (n)
    ((if (>= n 0) + -)
     0
     n)))

(assert-eq "abs6 :(" 53 (abs6 53))
(assert-eq "abs6 :(" 53 (abs6 -53))

;; 'if must be syntactic form.
;; if 'if is procedure, then (/ 1 n) will be evaluated before it.

(define reciprocal
  (lambda (n)
    (if (= n 0)
        "oops!"
        (/ 1 n))))

(format #t "~a~%" (< -1 0)) ;; => #t
(format #t "~a~%" (> -1 0)) ;; => #f

;; true and false

(assert-eq "boolean (if)" 'true (if #t 'true 'false))
(assert-eq "boolean (if)" 'false (if #f 'true 'false))
(assert-eq "boolean (if)" 'true (if '() 'true 'false))
(assert-eq "boolean (if)" 'true (if 1 'true 'false))
(assert-eq "boolean (if)" 'true (if '(a b c ) 'true 'false))

(assert-eq "boolean (not)" #f (not #t))
(assert-eq "boolean (not)" #f (not "false"))
(assert-eq "boolean (not)" #t (not #f))

(assert-eq "boolean (or)" #f (or))
(assert-eq "boolean (or)" #f (or #f))

(define reciprocal
  (lambda (n)
    (and (not (= n 0))
         (/ 1 n))))

(format #t "~a~%" (reciprocal 3)) ;; 1/3
(format #t "~a~%" (reciprocal 0.5)) ;; => 2.0
(format #t "~a~%" (reciprocal 0)) ;; => #f

;; predicate =, <, >, <=, >=

(format #t ";; predicate~%")

(assert "predicate" (null? '()))
(assert "predicate" (not (null? 'abc)))
(assert "predicate" (not (null? '(x y z))))
(assert "predicate" (null? (cdddr '(x y z))))

;; some lisp (include Commonn Lisp) defins (cdr '()) as ()
(define lisp-cdr
  (lambda (x)
    (if (null? x)
        '()
        (cdr x))))

(assert-eq "lisp-cdr" '(b c) (lisp-cdr '(a b c)))
(assert-eq "lisp-cdr" '() (lisp-cdr '(c)))
(assert-eq "lisp-cdr" '() (lisp-cdr '()))

(assert "eqv?" (eqv? 'a 'a))
(assert "eqv?" (not (eqv? 'a 'b)))
(assert "eqv?" (eqv? #f #f))
(assert "eqv?" (eqv? #t #t))
(assert "eqv?" (not (eqv? #f #t)))
(assert "eqv?" (eqv? 3 3))
(assert "eqv?" (not (eqv? 3 2)))

(let ((x "Hi Mom!"))
  (assert-eq "eqv?" #t (eqv? x x)))

(let ((x (cons 'a 'b)))
  (assert-eq "eqv?" #t (eqv? x x)))

;; (not #t)
(assert-eq "eqv?" #f (eqv? (cons 'a 'b) (cons 'a 'b)))

;; type predicate
(assert "pair?" (pair? '(a . c)))
(assert "pair?" (pair? '(a b c)))
(assert "pair?" (not (pair? '())))
(assert "pair?" (not (pair? "Hi Mom!")))
(assert "pair?" (not (pair? 12345)))

;; pair?, symbol?, number?, string?

(define reciprocal
  (lambda (n)
    (if (and (number? n) (not (= n 0)))
        (/ 1 n)
        "oops!")))

(format #t "~a~%" (reciprocal 2/3))
(format #t "~a~%" (reciprocal 'a)) ;; => oops!

;; error

(define reciprocal
  (lambda (n)
    (if (and (number? n) (not (= n 0)))
      (/ 1 n)
      (error 'reciprocal "improper argument ~s" n))))

(format #t "~a~%" (reciprocal .25)) ;; => 4.0
;;(format #t "~a~%" (reciprocal 0.0)) ;; => "error": reciprocal "improper ...
;;(format #t "~a~%" (reciprocal 'a))  ;; => "error": reciprocal "improper ...

(format #t ";; cond~%")

;; (cond (test exp) ... (else exp))

(define abs
  (lambda (n)
    (if (= n 0)
        0
        (if (< n 0)
            (- 0 n)
            n))))

(define abs-cond
  (lambda (n)
    (cond
      ((= n 0) 0)
      ((< n 0) (- 0 n))
      (else n))))

(assert-eq "abs-cond" (abs -19) (abs-cond -19))

(define abs-cond-no-else
  (lambda (n)
    (cond
      ((= n 0) 0)
      ((< n 0) (- 0 n))
      ((> n 0) n))))

(assert "abs-cond" (eqv? (abs-cond -33) (abs-cond-no-else -33)))

;; order is important
(define income-tax
  (lambda (income)
    (cond
      ((<= income 10000)
       (* income .05))
      ((<= income 20000)
       (+ (* (- income 10000) .08)
          500.00))
      ((<= income 30000)
       (+ (* (- income 20000) .13)
          1300.00))
      (else
        (+ (* (- income 30000) .21)
           2600.00)))))

(assert-eq "income" 250.0 (income-tax 5000))
(assert-eq "income" 900.0 (income-tax 15000))
(assert-eq "income" 1950.0 (income-tax 25000))
(assert-eq "income" 6800.0 (income-tax 50000))

;; Exercise
;; 2.7.1.

(define atom?
  (lambda (x)
    (not (pair? x))))

(assert "atom?" (atom? '()))
(assert "atom?" (atom? 1))
(assert "atom?" (not (atom? '(a . c))))

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


(define atom?
  (lambda (x)
    (not (list? x))))

(assert "atom?" (atom? 'b))
(assert "atom?" (atom? 1))
(assert "atom?" (not (atom? '())))


;; 2.7.2
(define shorter
  (lambda (a b)
    (cond
      ((not (list? a))
       (errorf "improper argument ~s" a))
      ((not (list? b))
       (errorf "improper argument ~s" b))
      (else
        (if (<= (length a) (length b))
          a
          b))
      )))

;; Gauche's errorf
;; http://practical-scheme.net/gauche/man/gauche-refj_58.html

(assert-eq "shorter" '(a b) (shorter '(a b) '(c d e)))
(assert-eq "shorter" '(c d) (shorter '(a b c d e) '(c d)))
;; (assert-eq "shorter" '(a b) (shorter 'b '(c d e)))
