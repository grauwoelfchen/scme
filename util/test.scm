;; http://c2.com/cgi/wiki?SchemeUnit

(define report-msg
  (lambda (msg)
    (display msg)
    (newline)))

(define report-err
  (lambda (msg)
    (display "ERROR: ")
    (report-msg msg)))

(define assert
  (lambda (msg b)
    (if (not b) (report-err msg))))

(define assert-eq
  (lambda (msg a b)
    (assert msg (equal? a b))))
