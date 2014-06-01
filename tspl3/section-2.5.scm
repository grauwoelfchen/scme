;; Section 2.5. Lambda Expressions
;; http://www.scheme.com/tspl3/start.html#./start:h5

;; lambda syntax
(format #t "~a~%" (lambda (x) (+ x x))) ; => #<closure #f>

;; general form
;; (lambda (var ...) exp1 exp2 ...)

;; * var is formal parameter
;; * body is exp1 exp2 ...
;; * procedure is object

(format #t "~a~%" ((lambda (x) (+ x x)) (* 3 4))) ; => 24
;; * actual parameter is value of (* 3 4)
;; * It will be bound to formal parameter in body (same with let-bound variable)

(format #t "~a~%" (let ((double (lambda (x) (+ x x))))
                   (list (double (* 3 4))
                         (double (/ 99 11))
                         (double (- 2 7))))) ; => (24 18 -10)

(format #t "~a~%" (let ((double-cons (lambda (x) (cons x x))))
                   (double-cons 'a))) ; => (a . a)

;; It is possible that procedure is argument
(format #t "~a~%" (let ((double-any (lambda (f x) (f x x))))
                   (list (double-any + 13) (double-any cons 'a)))) ; => (26 (a . a))

;; nest

;; x is occur free in lambda expr. (free variable of lambda expr.)
(format #t "~a~%" (let ((x 'a))
                   (let ((f (lambda (y) (list x y))))
                    (f 'b)))) ; => (a b)

;; tiny test framework :)
(add-load-path "../util" :relative)
(load "test")

;; test for test
(assert-eq "This will fail :D"
           1
           '(a))
(assert-eq "Checked with equal?"
           '(a)
           '(a))
(assert "This also fails ;)"
        (equal? 1 9))
(assert "This is also possible"
        (equal? 1 1))

;; back to book
(assert-eq "Free variable x is bound expectedly"
           '(a b)
           (let ((x 'a))
            (let ((f (lambda (y) (list x y))))
             (f 'b))))
(assert-eq "Procedure at outer of bind-scope works"
           '(a . b)
           (let ((f (let ((x 'a))
                     (lambda (y) (cons x y)))))
             (f 'b)))
(assert-eq "The x variable is bound to value in scope"
           '(a . b)
           (let ((f (let ((x 'a))
                     (lambda (y) (cons x y)))))
             (let ((x 'i-am-not-a))
              (f 'b))))

(assert-eq "The let is same with lambda has arguments"
          (let ((x 'a))
           (cons x x))
          ((lambda (x) (cons x x))
           'a))

;; let is expand syntax from lambda and procedure application
;;
;; (let ((var val) ...) exp1 exp2 ...)
;; ((lambda (var ...) exp1 exp2 ...) val ...)

;; The format parameters are
;; * proper list like (var1 ... varn)
;; * single variable
;; * inproper list like (var1 ... varn . varr)

;; rest parameter

(assert-eq "It will take any number arguments"
           '(1 2 3 4)
           (let ((f (lambda x x)))
            (f 1 2 3 4)))

(assert-eq "It will not take any argument"
           '()
           (let ((f (lambda x x)))
            (f)))

(assert-eq "It has rest parameters (x . y)"
           '(1 (2 3 4))
           (let ((g (lambda (x . y) (list x y))))
            (g 1 2 3 4)))

(assert-eq "It has rest parameters (x y . z)"
           '(a b (c d))
           (let ((h (lambda (x y . z) (list x y z))))
            (h 'a 'b 'c 'd)))

;; (assert-eq "It will fail for few arguments"
;;            '(a b (c d))
;;            (let ((h (lambda (x y . z) (list x y z))))
;;             (h 'a)))


;; Exercise
;; 2.5.1.
;; a. (let ((f (lambda (x) x))) (f 'a))
(assert-eq "a"
           'a
           (let ((f (lambda (x) x)))
            (f 'a)))

;; b. (let ((f (lambda x x))) (f 'a))
(assert-eq "(a)"
           '(a)
           (let ((f (lambda x x)))
            (f 'a)))

;; c. (let ((f (lambda (x . y) x))) (f 'a))
(assert-eq "a"
           'a
           (let ((f (lambda (x . y) x)))
            (f 'a)))
(format #t "y: ~a~%" (let ((f (lambda (x . y) y))) (f 'a)))

;; d. (let ((f (lambda (x . y) y))) (f 'a))
(assert-eq "empty list"
           '()
           (let ((f (lambda (x . y) y)))
            (f 'a)))

;; 2.5.2.
;; list returns just arguments as proper list
(format #t "~a~%" (let ((f (lambda x x))) (f 1 2 3 4 5))) ; => (1 2 3 4 5)


;; 2.5.3.
;; a. (lambda (f x) (f x))

;; b. (lambda (x) (+ x x))
;; +

;; c. (lambda (x y) (f x y))
;; f

;; d. (lambda (x) (cons x (f x y)))
;; cons, f, y

;; e. (lambda (x) (let ((y (cons x y))) (list x y z)))
;; x, y (outer of let), list, z
