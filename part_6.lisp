;;;; part_6.lisp

(in-package #:idelchik)

(defparameter part_6_doc
  "Сопротивление при течении с изменением направления потока 
  (коэффициенты сопротивления изогнутых участков колен, отводов и др.)")

(defun Idl-6-1-1-A1 (delta_gradus)
  (cond
    ( (and (<= delta_gradus 70.0))
     (* 0.9 (sin (/ delta_gradus (/ 180. pi)))))
    ( (and (<= 70.0 delta_gradus) (<= delta_gradus 90.0))
     (+ (* 0.9 (sin (/ delta_gradus (/ 180. pi))))
        (* (- 1.0 (* 0.9 (sin (/ delta_gradus (/ 180. pi)))))
	   (/ (- delta_gradus 70.0)(- 90.0 70.0)))))
    ( (and (<= 90.0 delta_gradus) (<= delta_gradus 100.0))
     (+ 1.0 (* (- (+ 0.7 (* 0.35 (/ delta_gradus 90.0)))1.0)
	       (/ (- delta_gradus 90.0)(- 100.0 90.0) ))))    
    ( (and (<= 100.0 delta_gradus) (<= delta_gradus 180.0))
     (+ 0.7 (* 0.35 (/ delta_gradus 90.0))))))

(defun Idl-6-1-1-B1 (R0_D0)
  (cond
    ( (and (<= 0.5 R0_D0) (<= R0_D0 1.0))
     (* 0.21 (expt R0_D0 -2.5)))
    ( (and (<= 1.0 R0_D0) (<= R0_D0 100.0))
     (* 0.21 (expt R0_D0 -0.5)))))

(defun Idl-6-1-1-C1 (a0_b0)
  (cond
    ((and (<= a0_b0 4.0 )) (+ 0.85 (/ 0.125 a0_b0)))
    ((and (<= 4.0 a0_b0)) (- 1.115 (/ 0.84 a0_b0 )))))

(defun Idl-6-1-1-dzeta_mu(delta_gradus R0_D0 a0_b0)
  (*
    (Idl-6-1-1-A1 delta_gradus)
    (Idl-6-1-1-B1 R0_D0)
    (Idl-6-1-1-C1 a0_b0)))

(defun Idl-6-1-1-dzeta (delta_gradus ; 
			   R0 ; [м]
			   D0 ; [м]
			   a0 ; [м]
			   b0 ; [м]
			   mikro_hight ; [м] 0.02*0.001
			)
  "Поворот (Idl-6-1-1-dzeta 90.0 0.0494  0.0494 0.0494 0.0494 (* 0.02 0.001))
"
  (+ (Idl-6-1-1-dzeta_mu delta_gradus (/ R0 D0) (/ a0 b0))
     (*	0.0175 delta_gradus
	(Idl-2-6-lambda (/ mikro_hight D0))
	(/ R0 D0))))
