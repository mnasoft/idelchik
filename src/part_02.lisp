;;;; part_2.lisp

(in-package #:idelchik)

(defparameter *part_02_doc*
  "Часть 2"
  "Сопротивление при течении по прямым трубам и каналам 
  (коэффициенты сопротивления трения и параметры шероховатости)")

(defparameter
    dia-2-1-b-2000-4000-data
  '((1111.0 0.032)
    (2.0e3 0.032)
    (2.5e3 0.034)
    (3.0e3 0.040)
    (4.0e3 0.040)
    (4444.0 0.040)))

(defparameter Idl-2-1-b_2000_4000-data
  '())

(defun dia-2-1-b-2000-4000(x)
  (table_aproximate x dia-2-1-b-2000-4000-data))

(defun Idl-2-1-a (Re)
  "(mapcar #'Idl-2-1-a '(10 100 500 1000 2000))
Гладкостенная труба
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
	   lam0 (sqrt (* lam1 lam0)))))

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


(defun Idl-2-1-b_2000_4000 () ;(x)
  1000.
    )

(defun Idl-2-1-λ_gl (aRe)
    "Коэффициент трения для гладкой трубы
"
  (cond
    ( (<= aRe 2.0d3)
     (values (Idl-2-1-a aRe) (format nil "Re=~A" aRe) "(Idl-2-1-a aRe)"))
    ((and (<= 2.0d3 aRe) (<= aRe 4.0d3))
     (values (dia-2-1-b-2000-4000 aRe)  (format nil "Re=~A" aRe) "(dia-2-1-b-2000-4000 aRe)"))
    ((and (<= 4.0d3 aRe) (<= aRe 100.0d3))
     (values (Idl-2-1-b aRe)  (format nil "Re=~A" aRe) "(Idl-2-1-b aRe)"))
    ((and (<= 100.0d3 aRe))
     (values (Idl-2-1-bv aRe)  (format nil "Re=~A" aRe) "(Idl-2-1-bv aRe)"))))

(defun Idl-2-2-λ_ravnomer (aRe _d)
  "Коэффициент трения для равномерно-шероховатой трубы
"
  (let* ((_d_pred (_delta_pred aRe)))
    (cond
      ((and (<= aRe (form-2-17 _d)))
       (values (Idl-2-1-λ_gl aRe)
	       (format nil "Re=~A" aRe)
	       "(Idl-2-1-λ_gl aRe)"))
      ((<= aRe (form-2-18 _d))
       (values (Idl-2-2 aRe _d)
	       (format nil "Re=~A" aRe)
	       "(Idl-2-2 aRe _d)" _d_pred))
      (T (values (Idl-2-6-lambda _d)
		 (format nil "Re=~A" aRe)
		 "(Idl-2-6-lambda _d)" _d_pred)))))

(Idl-2-1-λ_gl 4.010e4)
(Idl-2-2-λ_ravnomer 4.010e4 0.0009999995)

(form-2-17 0.000999)

