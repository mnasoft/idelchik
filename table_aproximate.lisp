;;;; table_aproximate.lisp

(in-package #:idelchik)


(defun line-approximate-list( XX n0 n1 lst)
  (line-approximate
   XX
   (nth n0 lst)
   (nth n1 lst)))

(defun line-approximate( XX PP0 PP1)
  (multiple-value-bind (x p0 p1)
      (values XX PP0 PP1)
    (+ (second p0)
       (/ (*
	   (- x (first p0))
	   (- (second p1) (second p0)))
	  (- (first p1) (first p0))))))

(defun table_aproximate (x lst)
  (do ((len (length lst))
       (res nil)
       (i 0 (1+ i))
       )
      ((>= i len) (line-approximate-list
		   x
		   (first res)
		   (second res )
		   lst))
    (cond
      ((and (null res) (<= x (first (nth 0 lst))))
       (setf res '(0 1)))
      ((and (null res) (<= (first (nth (1- len) lst)) x))
       (setf res (list (- len 2) (- len 1))))
      ((and (null res)
	    (<= (first(nth i lst)) x)
	    (<= x (first(nth (1+ i) lst))))
       (setf res (list i (1+ i)))))))


;;;;(table_aproximate 10.25 '((1.0 1.1) (2.0 2.2) (3.0 3.3)(4.0 4.4) (5.0 5.5)))

  
