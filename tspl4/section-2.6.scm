;; Section 2.6. Top-Level Definition
;; http://www.scheme.com/tspl4/start.html#./start:h6

(define double-any
  (lambda (f x)
    (f x x)))
(format #t "~a~%" (double-any + 10))
(format #t "~a~%" (double-any cons 'a))

(define sandwitch "peanut-butter-and-jelly")
(format #t "~a~%" sandwitch)

(define xyz '(x y z))
(format #t "~a~%"
        (let ((xyz '(z y x)))
          xyz))
(define list (lambda x x))

(define cadr
  (lambda (x)
    (car (cdr x))))

(define cddr
  (lambda (x)
    (cdr (cdr x))))

(format #t "~a~%" (cadr '(a b c)))
(format #t "~a~%" (cddr '(a b c)))

(define (cadr x)
  (car (cdr x)))
(format #t "~a~%" (cadr '(1 2 3)))

(define (list . x) x)
(format #t "~a~%" (list 1 2 3))

(define doubler
  (lambda (f)
    (lambda (x) (f x x))))

(define double
  (doubler +))

(format #t "~a~%" (double 13/2))

(define double-cons
  (doubler cons))

(format #t "~a~%" (double-cons 'a))

(define double-any
  (lambda (f x)
    ((doubler f) x)))

; (i-am-not-defined 3) ; => unbound variable: i-am-not-defined

(define proc1
  (lambda (x y)
    (proc2 y x)))

; (proc1 'a 'b) ; => unbound variable: proc2

(define proc2 cons)
(format #t "~a~%" (proc1 'a 'b))


;; Exercise

;; ex. 2.6.1
; (double-any double-any double-any) ; => infinite loop

;; ex. 2.6.2
(define compose
  (lambda (proc-a proc-b)
    (lambda (x)
      (proc-a (proc-b x)))))

(format #t "~a~%" (compose car cdr))

(define cadr
  (lambda (x)
    ((compose car cdr) x)))
(format #t "~a~%" (cadr '(1 2 3))) ; => 2

(define cddr
  (lambda (x)
    ((compose cdr cdr) x)))
(format #t "~a~%" (cddr '(1 2 3))) ; => (3)

; using double
(define double-compose
  (doubler compose))

(define cddr
  (lambda (x)
    ((double-compose cdr) x)))
(format #t "~a~%" (cddr '(3 2 1))) ; => (1)

;; ex. 2.6.3
(define caar
  (lambda (x)
    ((compose car car) x)))
(format #t "~a~%" (caar '((3) 2 1))) ; => 3

(define cdar
  (lambda (x)
    ((compose cdr car) x)))
(format #t "~a~%" (cdar '((3 2) 1))) ; => (2)

(define caaar
  (lambda (x)
    (car ((compose car car) x))))
(format #t "~a~%" (caaar '(((3) 2) 1))) ; => 3

(define caadr
  (lambda (x)
    (car ((compose car cdr) x))))
(format #t "~a~%" (caadr '(3 (2) 1))) ; => 2
