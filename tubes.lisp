;;;; tubes.lisp

(in-package #:idelchik)

;;; "idelchik" goes here. Hacks and glory await!

(defparameter tubes-gib
  (list
   (cons 0.010 (+ 0.020 (/ 0.010 2)))
   (cons 0.014 (+ 0.030 (/ 0.014 2)))
   (cons 0.022 (+ 0.045 (/ 0.022 2)))
   (cons 0.028 (+ 0.070 (/ 0.028 2)))
   (cons 0.032 (+ 0.080 (/ 0.032 2)))
   (cons 0.053 (+ 0.160 (/ 0.053 2)))
   (cons 0.075 (+ 0.225 (/ 0.075 2)))))

(defun radius-giba(diameter)
  (cdr (assoc diameter tubes-gib)))

(defparameter tubes-delta
  (list
        (cons 0.010 0.001)
        (cons 0.014 0.0012)
        (cons 0.022 0.0014)
        (cons 0.028 0.0018)
	(cons 0.032 0.0018)
	(cons 0.053 0.0018)
	(cons 0.075 0.002)))

(defun truba-in-dia(diameter)
  (- (car (assoc diameter tubes-delta))
     (* 2.0 (cdr (assoc diameter tubes-delta)))))

(defparameter ugolnik-data
  '((0.032 0.026 0.002)
    (0.053 0.0415 0.002)
    (0.075 0.0525 0.002)))

(defun ugolnik-in-dia(diameter)
  (- (nth 0 (assoc diameter ugolnik-data))
     (* 2.0 (nth 2 (assoc diameter ugolnik-data)))))

(defun ugolnik-radius(diameter)
  (nth 1 (assoc diameter ugolnik-data)))
