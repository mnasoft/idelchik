;;;; part_5.lisp

(in-package #:idelchik)

(defparameter *part_05_doc*
  "Сопротивление при течении с плавным изменением скорости 
  (коэффициенты сопротивления диффузоов, конфузоров и дрyrих переходных участков)")

(defun idl-5-5-ζ-rash (d1 d0 l)
  (let* (
	 (α_r (* 2.0 (atan (/ (- d1 d0) 2.0 l))))
	 (n   (/ (* d1 d1) (* d0 d0))))
    (* 3.2
       1.0
       (expt (tan (* α_r 0.5)) 1.25)
       (expt (- 1.0 (/ 1.0 n)) 2.0))))

(defun Idl-5-6-ζ-tr(Re d1 d0 l mikro)
  "Диффузор с доотрывным течением
Сопротивления трения
(Idl-5-6-ζ-tr 2e6 0.07 0.050 0.060 (* 0.001 0.02))
"
  (let*
      ((α_r  (* 2.0 (atan (/ (- d1 d0) 2.0 l))))
       (n    (/ (* d1 d1) (* d0 d0)))
       (_d   (/ mikro d0))
       (λ  (Idl-2-2-λ_ravnomer Re _d)))
    (/ (* λ (- 1.0 (/ 1.0 (* n n)))  ) 8.0 (sin (* 0.5 α_r)))))

(defun idl-5-5-ζ(Re D1 D0 l mikro)
  "Диффузор с доотрывным течением D1 > D0
D1    [м] - диаметр на выходе
D0    [м] - диаметр на входе
l     [м] - длина перехода
mikro [м] - абсолютеая высота микронеровностей
(idl-5-5-ζ 2e5 0.079 0.049 0.060 (* 0.001 0.02))
Потери определяются по скорости на входе
"
  (+
    (Idl-5-5-ζ-rash    D1 D0 l)
    (Idl-5-6-ζ-tr   Re D1 D0 l mikro)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun Idl-5-23-1-ζ (Re D1 D0 l mikro)
  "Конфузор D1 > D0
D1     [м] - вход   
D0     [м] - выход  [м]
l      [м] - длина  [м]
mikro  [м] - шероховатость
Потери определяются по скорости на выходе (меньший диаметр)
(Idl-5-23-1-ζ 2e5 0.079 0.049 0.060 (* 0.001 0.02)) 
"
  (let* ((α_r (* 2.0 (atan (/ (- D1 D0) 2.0 l))))
	 (n0 (/ (* D0 D0) (* D1 D1)))
	 (ζ
	  (*
	   (+
	    (* n0 n0 n0 n0 -0.0125)
	    (* n0 n0 n0 0.0224)
	    (* n0 n0 -0.00723)
	    (* n0 0.00444)
	    -0.00745
	    )
	   (+ (* α_r α_r α_r)
	      (* α_r α_r pi -2.0)
	      (* α_r -10.0)))))
    (+ ζ
       (idl-5-6-ζ-tr Re D1 D0 l mikro))))



(defun al (D1 D0 alfa)
  "Определяет длину перехода при заданных
  D1 - больший диаметр   [м]
  D0 - меньший диаметрд  [м]
  alfa - угол раскрытия [град]"
  (let ((alfa_r (* alfa (/ pi 180.0))))
    (/ (* 0.5 (- D1 D0)) (tan (* alfa_r 0.5)))))

;;;;(Idl-5-23-1-ζ 2e5 0.071 0.020 (al  0.071 0.020 60.0) 0.02e-3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter ζд_alfa
  '(3 4 6 8 10 12 14 16 20 30 45 60 90 120 180))

(defparameter
    ζд_n2
    '((0.5e5 0.148 0.135 0.121 0.112 0.107 0.109 0.120 0.141 0.191 0.315 0.331 0.326 0.315 0.308 0.298) 
      (1.0e5 0.120 0.106 0.090 0.083 0.080 0.088 0.102 0.122 0.196 0.298 0.297 0.286 0.283 0.279 0.276) 
      (2.0e5 0.093 0.082 0.070 0.068 0.062 0.062 0.063 0.073 0.120 0.229 0.279 0.268 0.268 0.265 0.263) 
      (4.0e5 0.079 0.068 0.056 0.048 0.048 0.048 0.051 0.051 0.068 0.120 0.271 0.272 0.272 0.268 0.268)))

(defparameter
    ζд_n4
    '((0.5e5 0.197 0.180 0.165 0.151 0.157 0.174 0.197 0.225 0.298 0.461 0.606 0.680 0.643 0.630 0.615) 
      (1.0e5 0.154 0.141 0.126 0.119 0.120 0.131 0.155 0.183 0.262 0.479 0.680 0.628 0.600 0.593 0.585) 
      (2.0e5 0.120 0.112 0.101 0.096 0.096 0.107 0.120 0.146 0.180 0.360 0.548 0.586 0.585 0.580 0.567) 
      (4.0e5 0.101 0.091 0.085 0.079 0.082 0.090 0.107 0.124 0.172 0.292 0.462 0.562 0.582 0.577 0.567) 
      (6.0e5 0.101 0.091 0.085 0.089 0.080 0.107 0.135 0.169 0.240 0.382 0.506 0.560 0.582 0.577 0.567)))

(defparameter
    ζд_n6
    '((0.5e5 0.182 0.170 0.168 0.168 0.179 0.200 0.240 0.268 0.330 0.482 0.655 0.766 0.742 0.730 0.722) 
      (1.0e5 0.153 0.144 0.131 0.126 0.132 0.159 0.193 0.218 0.286 0.488 0.680 0.755 0.731 0.720 0.707) 
      (2.0e5 0.129 0.118 0.109 0.101 0.101 0.118 0.151 0.185 0.280 0.440 0.895 0.700 0.710 0.708 0.690) 
      (4.0e5 0.106 0.095 0.090 0.084 0.087 0.104 0.151 0.160 0.224 0.360 0.588 0.660 0.696 0.695 0.680) 
      (6.0e5 0.092 0.090 0.080 0.079 0.080 0.098 0.137 0.160 0.286 0.456 0.600 0.690 0.707 0.700 0.695)))

(defparameter
    ζд_n10
    '((0.5e5 0.195 0.181 0.184 0.190 0.200 0.227 0.256 0.290 0.380 0.585 0.760 0.800 0.834 0.840 0.827) 
      (1.0e5 0.160 0.156 0.155 0.156 0.162 0.184 0.212 0.240 0.332 0.572 0.812 0.800 0.820 0.820 0.815) 
      (2.0e5 0.123 0.120 0.120 0.123 0.134 0.151 0.167 0.195 0.240 0.426 0.760 0.800 0.806 0.807 0.808) 
      (4.0e5 0.100 0.097 0.097 0.100 0.106 0.128 0.160 0.195 0.254 0.407 0.605 0.735 0.804 0.805 0.809) 
      (6.0e5 0.085 0.084 0.084 0.085 0.086 0.114 0.160 0.212 0.332 0.520 0.600 0.760 0.825 0.840 0.825)))

(defparameter
    ζд_n16
    '((0.5e5 0.179 0.174 0.176 0.185 0.196 0.224 0.270 0.306 0.378 0.600 0.840 0.880 0.880 0.880 0.880) 
      (1.0e5 0.148 0.146 0.147 0.147 0.151 0.179 0.233 0.275 0.340 0.600 0.840 0.905 0.877 0.876 0.876)
      (2.0e5 0.118 0.120 0.120 0.120 0.120 0.140 0.176 0.208 0.280 0.520 0.760 0.868 0.868 0.868 0.868)
      (4.0e5 0.102 0.098 0.095 0.094 0.095 0.118 0.160 0.191 0.264 0.480 0.700 0.778 0.847 0.868 0.869)
      (6.0e5 0.094 0.085 0.084 0.085 0.094 0.118 0.160 0.212 0.342 0.560 0.720 0.790 0.853 0.874 0.886)))

(defun ζд-points (n alfa Re_ζ_lst)
  (let ((Re (mapcar #'(lambda (el) (car el)) Re_ζ_lst))
	(ζ  (mapcar #'(lambda (el) (cdr el)) Re_ζ_lst))
	(rez nil))
    (mapcar #'(lambda (el1 el2)
		(mapcar #'(lambda (ell alf) (setf rez (cons (list (lg n) (lg alf) (lg el1) (lg ell)) rez)))
			el2 alfa))
	    Re ζ)
    rez))


(defparameter ζд-points-data
  (apply #'append 
	 (mapcar #'(lambda (el)
		     (ζд-points (car el) (cadr el) (caddr el)))
		 (list (list  2 ζд_alfa ζд_n2)
		       (list  4 ζд_alfa ζд_n4)
		       (list  6 ζд_alfa ζд_n6)
		       (list 10 ζд_alfa ζд_n10)
		       (list 16 ζд_alfa ζд_n16)))))

(defparameter ζд-2-points-data
  (apply #'append 
	 (mapcar #'(lambda (el)
		     (ζд-points (car el) (cadr el) (caddr el)))
		 (list (list  2 ζд_alfa ζд_n2)))))



;;;;ζд-points-data


(defparameter kд-data
;;;; (l/D0 Re пn)  alfa        3    4    6    8    10   12   14   16   20   30   45   60   90  
  '((( 2  0.5e5 2)             1.00 1.10 1.20 1.25 1.26 1.26 1.23 1.16 1.05 1.00 1.01 1.01 1.01)
    (( 5  0.5e5 2)             1.45 1.62 1.75 1.83 1.86 1.80 1.70 1.53 1.10 1.02 1.02 1.02 1.02)
    ((10  0.5e5 2)             1.88 1.96 2.05 2.07 2.07 2.05 2.00 1.93 1.60 1.13 1.11 1.10 1.10)
    ((20  0.5e5 2)             1.68 1.83 1.96 2.00 1.99 1.93 1.85 1.74 1.45 1.03 1.01 1.01 1.01)
    (( 2 1e5 2)                1.00 1.10 1.20 1.27 1.43 1.60 1.67 1.60 1.10 0.85 0.96 1.11 1.13)
    (( 5 1e5 2)                1.63 1.83 2.00 2.11 2.20 2.19 2.11 1.88 1.20 1.00 1.13 1.15 1.15)
    ((10 1e5 2)                1.93 2.13 2.41 2.75 2.93 3.00 3.05 2.99 1.40 1.00 1.13 1.15 1.15)
    ((20 1e5 2)                1.86 2.07 2.31 2.60 2.68 2.60 2.45 2.13 1.45 1.00 1.13 1.13 1.15)
    (( 2  (3e5 4e5) 2)         1.31 1.45 1.60 1.80 2.05 2.33 2.40 2.40 2.20 1.56 1.20 1.15 1.13)
    (( 5  (3e5 4e5) 2)         1.53 1.70 1.90 2.14 2.54 2.90 3.02 3.00 2.60 1.56 1.20 1.15 1.13)
    ((10  (3e5 4e5) 2)         2.20 2.33 2.55 3.00 3.80 4.00 4.07 4.00 3.30 2.00 1.33 1.20 1.25)
    ((20  (3e5 4e5) 2)         1.91 2.07 2.25 2.46 3.20 3.70 3.83 3.73 3.03 1.56 1.20 1.15 1.13)
    (( 2 (2e5 5e5) 2)          1.18 1.33 1.50 1.67 1.95 2.20 2.31 2.13 1.60 1.27 1.14 1.13 1.11)
    (( 5 (2e5 5e5) 2)          1.15 1.75 2.05 2.30 2.60 2.70 2.80 2.58 1.85 1.33 1.15 1.14 1.11)
    ((10 (2e5 5e5) 2)          2.06 2.25 2.54 2.91 3.40 3.70 3.82 3.73 2.27 1.50 1.26 1.20 1.12)
    ((20 (2e5 5e5) 2)          1.75 1.93 2.28 2.60 3.00 3.22 3.36 3.20 2.10 1.43 1.20 1.16 1.11)
    (( 2 (6e5 6e35) 2)         1.00 1.14 1.33 1.65 1.90 2.00 2.06 1.90 1.53 1.26 1.10 1.07 1.10) 
    (( 5 (6e5 6e35) 2)         1.15 1.33 1.60 1.90 2.06 2.10 2.10 1.92 2.20 1.62 1.30 1.23 1.10) 
    ((10 (6e5 6e35) 2)         1.73 1.90 2.15 2.45 2.93 3.13 3.25 3.15 2.20 1.62 1.30 1.23 1.10) 
    ((20 (6e5 6e35) 2)         1.46 1.65 1.95 2.86 2.54 2.65 2.70 2.60 1.70 1.33 1.13 1.12 1.10)
    (( 2 0.5e5 (4 16))         1.00 1.04 1.07 1.20 1.38 1.28 1.05 1.14 1.07 1.05 1.05 1.06 1.05)
    (( 5 0.5e5 (4 16))         1.00 1.25 1.47 1.60 1.66 1.65 1.60 1.58 1.43 1.23 1.08 1.06 1.05)
    ((10 0.5e5 (4 16))         1.50 1.65 1.85 1.90 2.10 2.10 2.05 1.93 1.70 1.38 1.26 1.20 1.05)
    ((20 0.5e5 (4 16))         1.30 1.43 1.65 1.85 1.98 1.74 1.75 1.66 1.48 1.23 1.10 1.06 1.05)
    ((2  1e5 (4 16))           1.05 1.10 1.14 1.26 1.47 1.40 1.28 1.18 1.06 0.95 0.95 0.95 1.02)
    ((5  1e5 (4 16))           1.30 1.46 1.68 1.93 2.15 2.15 2.05 1.90 1.60 1.07 1.00 1.00 1.02)
    ((10 1e5 (4 16))           1.67 1.83 2.08 2.28 2.60 2.50 2.43 2.20 1.83 1.30 1.10 1.03 1.02)
    ((20 1e5 (4 16))           1.50 1.63 1.93 2.15 2.60 2.50 2.27 2.07 1.73 1.20 1.05 1.07 1.02)
    ((2  (3e5 4e5)(4 16))      1.07 1.25 1.40 1.60 2.14 2.25 2.20 2.12 1.90 1.53 1.25 1.10 1.05)
    ((5  (3e5 4e5)(4 16))      1.30 1.47 1.67 2.00 2.45 2.53 2.47 2.40 2.20 1.60 1.26 1.15 1.06)
    ((10 (3e5 4e5)(4 16))      1.90 2.05 2.30 2.70 3.38 3.30 3.13 3.00 2.65 1.80 1.30 1.15 1.06)
    ((20 (3e5 4e5)(4 16))      1.52 1.73 2.13 2.50 3.27 3.13 2.93 2.75 2.40 1.67 1.30 1.15 1.06)
    ((2  (2e5 5e5)(4 16))      1.00 1.20 1.40 1.63 2.05 2.13 2.07 1.95 1.68 1.32 1.15 1.13 1.07)
    ((5  (2e5 5e5)(4 16))      1.30 1.47 1.69 2.00 2.27 2.35 2.37 2.27 1.95 1.40 1.19 1.13 1.07)
    ((10 (2e5 5e5)(4 16))      1.80 2.00 2.25 2.60 3.30 3.20 3.00 2.80 2.40 1.53 1.26 1.20 1.07)
    ((20 (2e5 5e5)(4 16))      1.54 1.73 2.12 2.43 3.20 3.00 2.75 2.50 2.10 1.50 1.23 1.15 1.07)
    ((2  (6.0e5 6.0e35)(4 16)) 1.00 1.13 1.42 1.73 1.98 1.93 1.83 1.70 1.50 1.23 1.13 1.10 1.07)
    ((5  (6.0e5 6.0e35)(4 16)) 1.05 1.23 1.60 1.95 2.25 2.20 2.08 1.90 1.55 1.25 1.15 1.10 1.07)
    ((10 (6.0e5 6.0e35)(4 16)) 1.60 1.82 2.15 2.55 3.20 3.02 2.53 2.20 1.83 1.33 1.22 1.18 1.07)
    ((20 (6.0e5 6.0e35)(4 16)) 1.35 1.63 2.10 2.43 3.05 2.70 2.23 1.98 1.60 1.30 1.20 1.15 1.07)))


(defun ζд-5-2 (n alfa Re)
  (let ((X1 (lg n ))
	(X2 (lg alfa ))
	(X3 (lg Re)))
    (expt 10.0
	  (+
	     (* -0.950761 X1 X1 X1 X1 X1)
	     (* 0.156515 X2 X2 X2 X2 X2)
	     (* 0.0271212 X3 X3 X3 X3 X3)
	     (* 2.10449 X1 X1 X1 X1)
	     (* -0.725385 X2 X2 X2 X2)
	     (* -0.339477 X3 X3 X3 X3)
	     (* 0.101436 X1 X1 X2)
	     (* 0.0205264 X2 X2 X1)
	     (* 0.0264429 X2 X2 X3)
	     (* -0.0736903 X3 X3 X1)
	     (* -0.222286 X1 X1 X3)
	     (* -0.0141006 X3 X3 X2)
	     (* -2.32868 X1 X1)
	     (* 3.71354 X2 X2)
	     (* 16.9614 X3 X3)
	     (* 1.19515 X1 X3)
	     (* 0.287271 X2 X3)
	     (* -1.0307 X1)
	     (* -6.00984 X2)
	     (* -85.2958 X3)
	     (* 129.786 1.0)))))


    


