(setq x 2)
(if x
    (format t "yes.~%")
    (format t "no.~%"))
(defun verbose-sum (x y)
  (format t "summing ~d and ~d.~%" x y)
  (+ x y))

(format t "verbose-sun is ~d~% " (verbose-sum  4 6))

(format t "---------~%")

(defun foo (x)
  (format t "parameter: ~a~%" x)
  (let ((x 2))
    (format t "outer let:~a~%" x)
    (let ((x 3))
      (format t "inner let: ~a~%" x))
    (format t "outer let: ~a~%" x))
  (format t "parameter:~a~%" x))

(print (foo 18))
