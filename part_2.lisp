;;;; part_2.lisp

(in-package #:idelchik)

(defparameter part_2_doc
  "Сопротивление при течении по прямым трубам и каналам 
  (коэффициенты сопротивления трения и параметры шероховатости)")

(defun Idl-2-5_dzeta (l D0 mikro)
  "Сильфон (Idl-2-5_dzeta 0.4 0.050 0.0025)
"
  (* (/ l D0) (Idl-2-6-lambda (/ mikro D0))))


(defun Idl-2-6-lambda (delta)
  (/ 1.0 (* 2.0 2.0 (lg (/ 3.7 delta))(lg (/ 3.7 delta)))))
