;; Section 2.4. Variables and Let Expressions
;; http://www.scheme.com/tspl3/start.html#./start:h4

;; let syntax
(format #t "~a~%" (let ((x 2))
                    (+ x 3))) ; => 5
(format #t "~a~%" (let ((y 3))
                    (+ 2 y))) ; => 5
(format #t "~a~%" (let ((x 2) (y 3))
                    (+ x y))) ; => 5

;; general form of let syntax
;; (let ((var val) ...) expr1 expr2 ...)
(format #t "~a~%" (let ((x 3) (y 5))
                    (+ x y)
                    (display "foo")
                    (* x y))) ; => 15

(format #t "~a~%" (let ((x 3) (x 5))
                    (let ((x 100) (y 200))
                      (+ x y)))) ; => 300

;; let-bound variables
(format #t "~a~%" (+ (* 4 4) (* 4 4))) ; => 32
(format #t "~a~%" (let ((a (* 4 4)))
                    (+ a a))) ; => 32

(let ((list1 '(a b c)) (list2 '(d e f)))
  (format #t "~a~%" 
    (cons (cons (car list1)
                (car list2))
          (cons (car (cdr list1))
                (car (cdr list2)))))) ; => ((a . d) b . e)

;; first procedure will be evaluated same with another one.
(format #t "~a~%" (let ((f +))
                    (f 2 3))) ; => 5
(format #t "~a~%" (let ((f +) (x 2))
                    (f x 3))) ; => 5
(format #t "~a~%" (let ((f +) (x 2) (y 3))
                    (f x y))) ; => 5

;; let-bound variabes are visible only within let-body
(let ((+ *))
   (+ 2 3))
(format #t "~a~%" (+ 2 3)) ; => 5

;; It is possible to nest let expr.
(let ((a 4) (b -3))
  (let ((a-squared (* a a))
        (b-squared (* b b)))
    (format #t "~a~%"
      (+ a-squared b-squared)))) ; => 25

;; inner x hides (shadow) outer xw
;; scope (lexical scope)
(format #t "~a~%" (let ((x 1))
  (let ((x (+ x 1)))
    (+ x x)))) ; => 4

(format #t "~a~%" (let ((x 1))
                    (let ((new-x (+ x 1)))
                      (+ new-x new-x)))) ; => 4

;; Exercise
;; 2.4.1
(define a 2)
(define b 3)
;; a. (+ (- (* 3 a) b) (+ (* 3 a) b))
(format #t "~a~%" (+ (- (* 3 a) b) (+ (* 3 a) b))) ; => 12
(format #t "~a~%" (let ((x (* 3 a)))
                    (+ (- x b) (+ x b)))) ; => 12

;; b. (cons (car (list a b c)) (cdr (list a b c)))
(define c 5)
(format #t "~a~%" (cons (car (list a b c)) (cdr (list a b c)))) ; (2 3 5)
(format #t "~a~%" (let ((l (list a b c)))
                    (cons (car l) (cdr l)))) ; => (2 3 5)

;; ex. 2.4.2.
;; (let ((x 9))
;;    (* x
;;       (let ((x (/ x 3)))
;;         (+ x x))))
;;
;; * x in outer let is bound to 9.
;; * body of outer let waits evaluation of inner let.
;; * x in inner let is bound to 3, because x variable in expression (/ x 3) is bound to 9. It is in body of outer let.
;; * returned value of inner let expr. is (+ 3 3)
;; * returned value of outer let expr. is (* 9 6)
;; * value is 54
(format #t "~a~%" (let ((x 9))
                    (* x
                       (let ((x (/ x 3)))
                        (+ x x))))) ; => 54

;; ex. 2.4.3
;; a.
(let ((x 'a) (y 'b))
  (format #t "~a~%"
    (list (let ((x 'c)) (cons x y))
          (let ((y 'd)) (cons x y))))) ; => ((c . b) (a . d)

(let ((x 'a) (y 'b))
  (format #t "~a~%"
          (list (let ((z 'c)) (cons z y))
                (let ((z 'd)) (cons x z)))))

;; b
(format #t "~a~%" (let ((x '((a b) c)))
                   (cons (let ((x (cdr x)))
                          (car x))
                         (let ((x (car x)))
                          (cons (let ((x (cdr x)))
                                  (car x))
                                (cons (let ((x (car x)))
                                        x)
                                        (cdr x))))))) ; => (c b a b)

(format #t "~a~%" (let ((x '((a b) c)))
                   (cons (let ((x2 (cdr x)))
                          (car x2))
                         (let ((x2 (car x)))
                          (cons (let ((x3 (cdr x2)))
                                 (car x3))
                                (cons (let ((x3 (car x2)))
                                        x3)
                                       (cdr x2))))))) ; => (c b a b)
