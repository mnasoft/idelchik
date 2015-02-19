;;;; part_2.lisp

(in-package #:idelchik)

(defparameter part_2_doc
  "Сопротивление при течении по прямым трубам и каналам 
  (коэффициенты сопротивления трения и параметры шероховатости)")

(defparameter
    dia-2-1-b
  '(
    (2000.0 0.0275)
    (3000.0 0.035)
    (4000.0 0.040)
    ))

(defun Idl-2-1-a (Re)
  "(mapcar #'Idl-2-1-a '(10 100 500 1000 2000))
"
  (/ 64.0 Re))

(defun Idl-2-1-b(Re)
    "(mapcar #'Idl-2-1-b '(4e3 5e3 6e3  8e3 1e4 2e4 4e4 6e4 8e4 1e5))
"
  (/ 0.3164 (expt Re 0.25)))

(defun Idl-2-1-bv(Re)
  "(mapcar #'Idl-2-1-bv '(1e5 1e6 1e7 1e8))
"
  (/ 1.0
   (* (- (* 1.8 (lg Re)) 1.64)
      (- (* 1.8 (lg Re)) 1.64))))

(defun Idl-2-2-_d-Re-lam (_d Re lam)
  (let
      ((_delta-Re-sqrt_lambda (* _d Re (sqrt lam))))
    (cond
      ((< _delta-Re-sqrt_lambda 10.0) (values -0.80  2.0     0.0   _d Re lam))
      ((< _delta-Re-sqrt_lambda 20.0) (values 0.068  1.13   -0.87  _d Re lam))
      ((< _delta-Re-sqrt_lambda 40.0) (values 1.538  0.000  -2.0   _d Re lam))
      ((< _delta-Re-sqrt_lambda 191.2)(values 2.471 -0.588  -2.588 _d Re lam))
      (T (values 1.138 0.0 -2.0 _d Re lam)))))

(defun Idl-2-2-a1-b1-c1 (a1 b1 c1 _d Re lam)
  (/ 1.0
     (+ a1
	(* b1 (lg (* Re (sqrt lam))))
	(* c1 (lg _d)))
     (+ a1
	(* b1 (lg (* Re (sqrt lam))))
	(* c1 (lg _d)))))

(defun Idl-2-2 (Re _d)
  (do
   ( (_delta-Re-sqrt_lambda nil)
     (lam0 0.08)
     (lam1 0.008)
     (i 0 (1+ i)))
   ((< (abs (- 1.0 (/ lam1 lam0))) 0.00001) lam0)
    (setf  _delta-Re-sqrt_lambda (* _d Re (sqrt lam0))
	   lam1 (multiple-value-bind
		      (a1 b1 c1 _d1 _Re1 _lam1) (Idl-2-2-_d-Re-lam _d Re lam0)
		  (Idl-2-2-a1-b1-c1 a1 b1 c1 _d1 _Re1 _lam1))
	   lam0 (sqrt (* lam1 lam0)))
    ))

(defun _delta_pred(Re)
  (/ ( - (* 18.0 (lg Re)) 16.4) Re))

(defun form-2-2(lam len dia ro w)
  (/ (* lam len ro w w ) (* 2.0 dia )))

(defun form-2-17 (_d)
  "(_delta_pred (form-2-17 0.001))"
  (/ 26.9 (expt _d 1.143)))

(defun form-2-18 (_d)
  (/ (- 217.0 (* 382.0 (lg _d))) _d))

(defun form-2-17_18 (_d)
  (values  (form-2-17 _d) (form-2-18 _d)))

(defun Idl-2-5_dzeta (l D0 mikro)
  "Сильфон (Idl-2-5_dzeta 0.4 0.050 0.0025)
"
  (* (/ l D0) (Idl-2-6-lambda (/ mikro D0))))


(defun Idl-2-6-lambda (delta)
  (/ 1.0 (* 2.0 2.0 (lg (/ 3.7 delta))(lg (/ 3.7 delta)))))

(defun table_aproximate (x table)
  (do* ((x_min -1.0d100) 
	(x_max 1.0d100)
	(xx_min 1.0d100) 
	(xx_max -1.0d100)
	(x_i nil)
	(y_i nil)
	(i 0 (1+ i))
	(len (length table)))
       ((>= i len) (values xx_min (list x_min y_min) x (list x_max y_max) xx_max))
    (setf x_i (car (nth i table))
	  y_i (cadr (nth i table))
 	  xx_min (min xx_min x_i)
	  xx_max (max xx_max x_i))
    (if (and (>= x_i x) (<= x_i x_max))
	(setf x_max x_i
	      y_max y_i))
    (if (and (<= x_i x) (>= x_i x_min))
	(setf x_min x_i
	      y_min y_i))))

(table_aproximate 10.25 '((1.0 1.1) (2.0 2.2) (3.0 3.3)(4.0 4.4) (5.0 5.5)))

  (let
      ((x_min (car (first table)))
       (x_max (car (last table)))
       )
    
    )
(cond
      ((< x x_min)
       
       )
      )
(last '( 1 2 3 4 5 6))
