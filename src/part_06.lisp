;;;; part_6.lisp

(in-package #:idelchik)

(defparameter *part_06_doc*
  "Сопротивление при течении с изменением направления потока 
  (коэффициенты сопротивления изогнутых участков колен, отводов и др.)")

(defparameter Idl-6-1-1-A1-data
  '((0.000 0.0)
    (20.00 0.31)
    (30.00 0.45)   
    (45.00 0.60)
    (60.00 0.78)
    (75.00 0.90)
    (90.00 1.00)
    (110.0 1.13)
    (130.0 1.20)
    (150.0 1.28)
    (180.0 1.40)))

(defparameter Idl-6-1-1-B1-data
  '((0.444 1.18)
    (0.50 1.18)
    (0.60 0.77)
    (0.70 0.51)
    (0.80 0.37)
    (0.90 0.28)
    (1.00 0.21)
    (1.25 0.19)
    (1.50 0.17)
    (2.00 0.15)
    (4.00 0.11)
    (6.00 0.09)
    (8.00 0.07)
    (10.0 0.07)
    (20.0 0.05)
    (30.0 0.04)
    (40.0 0.03)
    (55.5 0.03)))

(defparameter Idl-6-1-kRe-data-279
 '((0.10e5 1.40 1.67 2.00)
   (0.14e5 1.33 1.58 1.89) 
   (0.20e5 1.26 1.49 1.77) 
   (0.30e5 1.19 1.40 1.64)
   (0.40e5 1.14 1.34 1.56)
   (0.60e5 1.09 1.26 1.46)
   (0.80e5 1.06 1.21 1.38)
   (1.00e5 1.04 1.19 1.30)
   (1.40e5 1.00 1.17 1.15)
   (2.00e5 1.00 1.14 1.02)
   (3.00e5 1.00 1.06 1.00)
   (4.00e5 1.00 1.00 1.0)))

(defun Idl-6-1-1-A1 (x)
  (table_aproximate x Idl-6-1-1-A1-data))

(defun Idl-6-1-1-B1 (x)
  (table_aproximate x Idl-6-1-1-B1-data))

(defun Idl-6-1-1-C1 (&optional (x 1.0)) x)

(defun Idl-6-1-1-ζm-277(delta_gradus R0_D0  &key (a0_b0 1.0))
  (*
    (Idl-6-1-1-A1 delta_gradus)
    (Idl-6-1-1-B1 R0_D0)
    (Idl-6-1-1-C1 a0_b0)))

(defun Idl-6-1-1-ζ-277 (Re delta_gradus R0 D0 &key (a0 R0) (b0 R0))
  "Поворот для гладкостенной трубы
delta_gradus - угол поворота в градусах 
R0[m] - средний радиус отвода (ugolnik)
D0[m] - диаметр отвода "
  (+ (Idl-6-1-1-ζm-277 delta_gradus (/ R0 D0) :a0_b0 (/ a0 b0))
     (*	0.0175 delta_gradus
	(Idl-2-1-λ_gl Re)
	(/ R0 D0))))

(defun Idl-6-1-2-k-Δ (Re R0 D0 _d)
  (values
   (cond
     ((and
       (<= (/ R0 D0) 0.55)
       (<= 3.0e3 Re) (<= Re 4.0e4)) 1.0)
     ((and
       (<= (/ R0 D0) 0.55)
       (< 4.0e4 Re))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) (+ 1.0 (* 0.5e3 _d)))
	((< 0.001 _d) 1.5)))
     ((and
       (< 0.55 (/ R0 D0))
       (<= 3.0e3 Re) (<= Re 4.0e4))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) 1.0)
	((< 0.001 _d) 1.0)))
     ((and
       (< 0.55 (/ R0 D0))
       (< 4.0e4 Re) (<= Re 2.0e5))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) (/ (Idl-2-2-λ_ravnomer Re _d) (Idl-2-1-λ_gl Re)))
	((< 0.001 _d) 2.0)))
     ((and
       (< 0.55 (/ R0 D0))
       (< 2.0e5 Re))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) (+ 1.0 (* 1.0e3 _d)))
	((< 0.001 _d) 2.0))))
   (format nil "R0=~A D0=~A Re=~A _d=~A" R0 D0 Re _d)))

(defun Idl-6-2-λk(R0 D0 Re)
  (let ( 
	(D0_2_R0 (/ D0 2 R0))
	(Re_R0_D0 (* Re (sqrt (/ D0 2 R0))))
	)
    (cond
      ((< Re_R0_D0 50) 0.0)
      ((< Re_R0_D0 600) 
       (* 
	(/ 20 (expt Re 0.65))
	(expt D0_2_R0 0.175)))
      ((< Re_R0_D0 1400) 
       (* 
	(/ 10.4 (expt Re 0.55))
	(expt D0_2_R0 0.225)))
      ((< Re_R0_D0 5000) 
       (* 
	(/ 5 (expt Re 0.45))
	(expt D0_2_R0 0.275))))))

(defun Idl-6-1-kRe_279(Re R0 D0)
  (let* ((R0D0 (/ R0 D0))
	 (lst (cond 
		((<= R0D0 0.55)
		 (mapcar #'(lambda(el) (list (first el) (second el))) Idl-6-1-kRe-data-279))
		((<= R0D0 0.7)
		 (mapcar #'(lambda(el) (list (first el) (third el))) Idl-6-1-kRe-data-279))
		((< 0.7 R0D0)
		 (mapcar #'(lambda(el) (list (first el) (fourth el))) Idl-6-1-kRe-data-279)))))
    (table_aproximate Re lst)))

(defun Idl-6-1-2-ζ-277 (Re delta_gradus R0 D0 _d &key (a0 R0) (b0 R0))
  "Поворот для шероховатой трубы при Re >= 1.0e4
delta_gradus - угол поворота в градусах
R0[m]        - средний радиус отвода (ugolnik)
D0[m]        - диаметр отвода
_d           - относительная шероховатость    "
  (let* ((R0_D0 (/ R0 D0))
	 (kRe (Idl-6-1-kRe_279 Re R0 D0))
	 (kΔ  (Idl-6-1-2-k-Δ   Re R0 D0 _d))
	 (ζm  (Idl-6-1-1-ζm-277 delta_gradus R0_D0 ))
	 (λ   (Idl-2-2-λ_ravnomer Re _d)))
    (values
     (+ (* kRe kΔ ζm) (* 0.0175 delta_gradus λ R0_D0))
     R0_D0 kRe kΔ ζm λ a0 b0)))
